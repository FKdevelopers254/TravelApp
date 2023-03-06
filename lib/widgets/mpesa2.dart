import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'mpesa.dart';


class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedUserRole = 'Staff';



  final TextEditingController _phoneNumberController =
  TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final String _businessShortCode = "174379";
  final String _passKey = "your_passkey_here";
  final String _callbackUrl = "https://mydomain.com/callback";
  String paymentStatusUrl = "https://sandbox.safaricom.co.ke/mpesa/stkpushquery/v1/query";

  String _transactionDescription = "Test payment";

  Future<void> initiatePayment() async {
    String amount = _amountController.text;
    String phoneNumber = _phoneNumberController.text;
    if (amount.isEmpty || phoneNumber.isEmpty) {
      return;
    }
    String timestamp =
    DateTime.now().toIso8601String().replaceAll(RegExp(r'[:-]'), '');
    String password = base64.encode(
        utf8.encode(_businessShortCode + _passKey + timestamp));
    String requestUrl = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest";
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer " + await _generateAccessToken(),
      HttpHeaders.contentTypeHeader: "application/json",
    };
    var requestBody = json.encode({
      "BusinessShortCode": _businessShortCode,
      "Password": password,
      "Timestamp": timestamp,
      "TransactionType": "CustomerPayBillOnline",
      "Amount": amount,
      "PartyA": phoneNumber,
      "PartyB": _businessShortCode,
      "PhoneNumber": phoneNumber,
      "CallBackURL": _callbackUrl,
      "AccountReference": "Test",
      "TransactionDesc": _transactionDescription,
    });
    var response = await http.post(Uri.parse(requestUrl), headers: headers, body: requestBody);
    if (response.statusCode == 200) {
      // Payment initiated successfully, display confirmation screen
      String message = "Payment of KES $amount initiated for $phoneNumber.";
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Payment initiated"),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Payment initiation failed, display error message
      String message = "Failed to initiate payment. Please try again later.";
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Payment failed"),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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










  bool _isProcessingPayment = false;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _processPayment() async {
    setState(() {
      _isProcessingPayment = true;
    });

    // Step 1: Generate access token
    String accessToken = await _generateAccessToken();

    // Step 2: Initiate payment request
    String businessShortCode = "174379";
    String passKey = "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919";
    String phoneNumber = _phoneNumberController.text;
    String accountReference = phoneNumber.replaceAll("+", "");// Replace with user's phone number
    String amount = _amountController.text;

    String timestamp = DateFormat("yyyyMMddHHmmss").format(DateTime.now());
    String transactionReference = "your_unique_transaction_reference_here";

    String rawString =
        "$businessShortCode$passKey$timestamp"; // Concatenate businessShortCode, passkey and timestamp
    String encodedString = base64.encode(utf8.encode(rawString)); // Base64 encode the raw string

    var body = json.encode({
      "BusinessShortCode": businessShortCode,
      "Password": encodedString,
      "Timestamp": timestamp,
      "TransactionType": "CustomerPayBillOnline",
      "Amount": amount,
      "PartyA": phoneNumber,
      "PartyB": businessShortCode,
      "PhoneNumber": phoneNumber,
      "CallBackURL": "https://mydomain.com/path",
      "AccountReference": accountReference,
      "TransactionDesc": "your_transaction_description_here",
      "Remark": "your_remark_here",
      "Occasion": "your_occasion_here",
    });

    String paymentRequestUrl = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest";
    var headers = {
      HttpHeaders.authorizationHeader: "Bearer $accessToken",
      HttpHeaders.contentTypeHeader: "application/json",
    };
    try {
      var response = await http.post(Uri.parse(paymentRequestUrl), headers: headers, body: body);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.body);
        String checkoutRequestID = responseBody["CheckoutRequestID"];
        print("CheckoutRequestID: $checkoutRequestID");
        String message = "Payment of KES $amount initiated for $phoneNumber.";
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Payment initiated"),
              content: Text(message),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );


        // Wait for payment confirmation
        const duration = const Duration(seconds: 10);
        Timer.periodic(duration, (Timer timer) async {
          var paymentStatusUri = Uri.parse(paymentStatusUrl + "?checkoutRequestId=$checkoutRequestID");
          var response = await http.get(paymentStatusUri, headers: headers);


          if (response.statusCode == 200) {
            Map<String, dynamic> responseBody = json.decode(response.body);
            String resultDesc = responseBody["ResultDesc"];
            if (resultDesc.toLowerCase() == "success") {
              print("Payment successful!");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Payment successful!'),
                  backgroundColor: Colors.green,
                ),
              );
            } else {
              print("Payment failed: $resultDesc");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Payment failed: $resultDesc'),
                  backgroundColor: Colors.red,
                ),
              );
            }
            timer.cancel();
          } else {
            print("Payment failed: User Did not input pin");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Payment failed: User Did not input pin'),
                backgroundColor: Colors.red,
              ),
            );
            Navigator.pop(context);
            timer.cancel();
          }
        });
      } else {
        print("Payment request failed with status code ${response.statusCode}");
        print("Response body: ${response.body}");

        String message = "Failed to initiate payment. Please try again later.";
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Payment failed"),
              content: Text(message),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("OK"),
                 onPressed: (){
                   // After payment processing is complete


                 },
                  // onPressed: () {Navigator.of(context).pop();},
                ),
              ],
            );
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment failed: '),
            backgroundColor: Colors.red,
          ),
        );
      }

      setState(() {
        _isProcessingPayment = false;
      });
    } catch (e) {
      print("Error occurred while processing payment: $e");
      String message = "An error occurred while processing payment. Please try again later.";
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Payment failed"),
            content: Text(message),
            actions: <Widget>[
              ElevatedButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Payment failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }











  }
  String checkoutRequestID = "";







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                value: _selectedUserRole,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUserRole = newValue!;
                  });
                },
                items: <String>['Admin', 'Staff']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter amount',
              ),
            ),

            SizedBox(height: 16.0),
            TextFormField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isProcessingPayment
                  ? null
                  : () {
                _processPayment();
              },
              child: _isProcessingPayment
                  ? CircularProgressIndicator()
                  : Text('Pay Now'),
            ),
            GestureDetector(
              onTap: (){
                // After payment processing is complete
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PaymentStatusPage(checkoutRequestID: checkoutRequestID),
                  ),
                );

              },
                child: Text('data')),


          ],
        ),
      ),
    );
  }



}