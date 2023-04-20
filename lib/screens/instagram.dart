import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InstagramImage extends StatefulWidget {
  final String postLink;

  InstagramImage(this.postLink);

  @override
  _InstagramImageState createState() => _InstagramImageState();
}

class _InstagramImageState extends State<InstagramImage> {
  String _accessToken = "EAAqCUVShohsBAHtcaXwWJ5fQEX1lvWSE1bL1oMNiChFEjBmZAE4IZAQb9IIgJlz4GLrGR3ztP2bL1L2jrixMvmzOBt8lbS0ODYn4zBP65X3x6AzJ468kdh2TAOaPoYZAyILzVbbtUkyq2V9vCZC3GQ2WSw3ZCN7vOd5OUdpIxkmnJT4GqfpFHwz5zx4OXC0hupsT2exZCYiQZDZD";
  String _mediaUrl = "";

  @override
  void initState() {
    super.initState();
    _getInstagramMedia();
  }

  Future<void> _getInstagramMedia() async {
    final url =
        "https://graph.instagram.com/17887406447880629?fields=media_url&access_token=$_accessToken";
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);
    setState(() {
      _mediaUrl = data["media_url"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        _mediaUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
