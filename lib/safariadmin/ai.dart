import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;


class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<File> _imageList = [];
  bool _isUploading = false;


  void _pickImages() async {
    final pickedImages =
    await ImagePicker().pickMultiImage(imageQuality: 50);

    if (pickedImages != null) {
      setState(() {
        _imageList = pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
      });
    }
  }


  void _uploadImages(String title) async {
    setState(() {
      _isUploading = true;
    });


    final url = 'https://markiniltd.com/eas/imagess/uploadimage.php';
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll({'Content-Type': 'multipart/form-data'});

    request.fields['title'] = title;

    final progressIndicators = List<Widget>.generate(
      _imageList.length,
          (index) => LinearProgressIndicator(value: 0),
    );





    for (var i = 0; i < _imageList.length; i++) {

      final file = _imageList[i];
      final filename = path.basename(file.path);
      final stream = http.ByteStream(file.openRead());
      final length = await file.length();


      final multipartFile = http.MultipartFile(
        'images[]',
        stream,
        length,

        filename: filename,
      );

      request.files.add(multipartFile);

      final streamedRequest = http.MultipartRequest('POST', Uri.parse(url));
      streamedRequest.headers.addAll({'Content-Type': 'multipart/form-data'});
      streamedRequest.fields['title'] = title;
      streamedRequest.files.add(multipartFile);

      final response = await streamedRequest.send();
      final responseString = await response.stream.bytesToString();
      print('Response: $responseString');
      var totalBytesSent = 0;
      response.stream.listen(
            (event) {
          totalBytesSent += event.length;
          final progress = totalBytesSent / length;
          setState(() {
            progressIndicators[i] = LinearProgressIndicator(value: progress);
          });
        },
      );
    }

    try {
      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Images uploaded successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error uploading images'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while uploading the images'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upload Progress:'),
            SizedBox(height: 8),
            ...progressIndicators,
          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Images'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(hintText: 'Title'),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImages,
              child: Text('Pick Images'),
            ),
            SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(_imageList.length, (index) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.file(
                    _imageList[index],
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isUploading ? null : () => _uploadImages('Test Title'),
              child: _isUploading
                  ? CircularProgressIndicator()
                  : Text('Upload Images'),
            ),
          ],
        ),
      ),
    );
  }
}
