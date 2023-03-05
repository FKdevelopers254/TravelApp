import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'editdata.dart';

class ViewData extends StatefulWidget {
   const ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  List _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }



  _fetchData() async {
    final response = await http.get(Uri.parse('https://markiniltd.com/get.php'));


    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(_data[index]['title']),
              subtitle: Text(_data[index]['description']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditPage(
                      id: _data[index]['id'],
                      title: _data[index]['title'],
                      description: _data[index]['description'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
