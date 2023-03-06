import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/destination_model.dart';

class CarBookPage extends StatefulWidget {


  const CarBookPage();

  @override
  _CarBookPageState createState() => _CarBookPageState();
}

class _CarBookPageState extends State<CarBookPage> {

  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  //late bool _isLoading;

  void _submitForm() {

    _formKey.currentState?.save();
   

    _uploadData();

  }

  void _uploadData() async {

    final url = Uri.https('markiniltd.com', '/add.php');
    final response = await http.post(url,
        body: {'title':_title, 'description': _description});

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == 'success') {
        _showSuccessDialog();
      } else {
        _showErrorDialog();
      }
    } else {
      _showErrorDialog();
    }
  }


  void _showSuccessDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Succesful We are contacting you shortly'),
            actions: [
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
  }
  void _showErrorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred while uploading the data.'),
            actions: [
              MaterialButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ss'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),

                onSaved: (value) => _title = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),

                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 16.0),
              TextButton(

                 onPressed: _submitForm,
                  child:  Text('Submit')

              ),



        

        
        
        
        

            ],
          ),
        ),
      ),
    );
  }
}
