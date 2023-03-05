import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  final String id;
  final String title;
  final String description;

  EditPage({required this.id, required this.title, required this.description});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _description = widget.description;
  }

  Future<void> _updateData() async {

      _formKey.currentState?.save();

      final response = await http.post(Uri.parse('https://markiniltd.com/edit.php'), body: {
        'id': widget.id.toString(),
        'title': _title,
        'description': _description,
      });

      if (response.statusCode == 200) {
        Navigator.pop(context);
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Title and Description'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),

                onSaved: (value) => _title = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),

                onSaved: (value) => _description = value!,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _updateData,
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
