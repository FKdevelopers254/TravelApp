import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class PaymentStatusPage extends StatefulWidget {
  final String checkoutRequestID;

  PaymentStatusPage({required this.checkoutRequestID});

  @override
  _PaymentStatusPageState createState() => _PaymentStatusPageState();
}

class _PaymentStatusPageState extends State<PaymentStatusPage> {
  bool _isLoading = true;
  String _statusMessage = "";

  @override
  void initState() {
    super.initState();

  }

  Future<String> _generateAccessToken() async {
    String consumerKey = "3Q97LkpP7qupUpSKOrLv0ISSwrboyGFk";
    String consumerSecret = "ACQdwhi8G6CaGxUQ";
    String requestUrl = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials";

    var headers = {
      HttpHeaders.authorizationHeader: "Basic " + base64.encode(utf8.encode(consumerKey + ":" + consumerSecret)),
    };


    var response = await http.get(Uri.parse(requestUrl), headers: headers);


    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      String accessToken = responseBody["access_token"];
      return accessToken;
    } else {
      throw Exception("Failed to generate access token");
    }
  }

  Future<void> _checkPaymentStatus(String checkoutRequestID) async {
    setState(() {
      _isLoading = true;
    });

    String accessToken = await _generateAccessToken();

    // Step 2: Initiate payment request
    String businessShortCode = "174379";
    String passKey = "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919";


    String timestamp = DateFormat("yyyyMMddHHmmss").format(DateTime.now());


    String rawString =
        "$businessShortCode$passKey$timestamp"; // Concatenate businessShortCode, passkey and timestamp
    String encodedString = base64.encode(utf8.encode(rawString));

    // Set up the HTTP headers
    Map<String, String> headers = {
      "Authorization": "Bearer $accessToken",
      "Content-Type": "application/json",
    };

    // Set up the HTTP request body
    Map<String, String> requestBody = {
      "BusinessShortCode": businessShortCode,
      "Password": encodedString,
      "Timestamp": timestamp,
      "CheckoutRequestID": checkoutRequestID,
    };

    // Encode the request body as JSON
    String requestBodyJson = json.encode(requestBody);

    // Set up the HTTP request
    String paymentStatusUrl = "https://sandbox.safaricom.co.ke/mpesa/stkpushquery/v1/query";
    var response = await http.post(
      Uri.parse(paymentStatusUrl),
      headers: headers,
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      String resultCode = responseBody["ResultCode"];
      if (resultCode == "0") {
        String resultDesc = responseBody["ResultDesc"];
        if (resultDesc.toLowerCase() == "success") {
          setState(() {
            _isLoading = false;
            _statusMessage = "Payment successful!";
          });
        } else {
          setState(() {
            _isLoading = false;
            _statusMessage = "Payment failed: $resultDesc";
          });
        }
      } else {
        setState(() {
          _isLoading = false;
          _statusMessage = "Failed to get payment status. Please try again later.";
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _statusMessage = "Failed to get payment status. Please try again later.";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Status"),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text(_statusMessage),
      ),
    );
  }
}
