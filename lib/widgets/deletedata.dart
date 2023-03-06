
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  @override
  _DeleteDataState createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  Future<List<Data>> _getData() async {
    final response = await http.get(Uri.parse('https://markiniltd.com/get.php'));
    if (response.statusCode == 200) {
      print('Succesffully Fetched');
      List<dynamic> data = json.decode(response.body);
      return data.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete'),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Data data = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(data.title),
                    subtitle: Text(data.description),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {

                        final response = await http.post(
                            Uri.parse('https://markiniltd.com/get.php'),
                            body: {'id': data.id});
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
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class Data {
  int id;
  String title;
  String description;

  Data({required this.id, required this.title, required this.description});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
