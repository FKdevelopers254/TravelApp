import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'editdata.dart';

class WorkingData extends StatefulWidget {
  @override
  _WorkingDataState createState() => _WorkingDataState();
}

class _WorkingDataState extends State<WorkingData> {

  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final response = await http.get(Uri.parse('https://markiniltd.com/get.php'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _data = data['data'];
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titles and Descriptions'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {

          final description = _data[index]['description'];
          final id = _data[index]['id'];
          final title = _data[index]['title'];
          return Card(
            child: ListTile(
              onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EditPage(id: id, title: title, description: description),
            ));
            },

              title: Text(_data[index]['title']),
              subtitle: Text(description),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {

                  final response = await http.post(
                      Uri.parse('https://markiniltd.com/delete.php'),
                      body: {'id': id});
                  if (response.statusCode == 200) {
                    setState(() {});
                  } else {
                    throw Exception('Failed to delete data');
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
