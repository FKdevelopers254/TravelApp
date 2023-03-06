import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String _title = '';
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter a title',
              ),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Select Images'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Image.file(_images[index]);
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_title.isNotEmpty && _images.isNotEmpty) {
                  addImageAndTitle(_title, _images);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Posting...')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a title and select images.')),
                  );
                }
              },
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }

Future<void> addImageAndTitle(String title, List<File> images) async {
  final user = FirebaseAuth.instance.currentUser!;
  final userDetailsSnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: user.email)
      .get();

  // Get a reference to the storage bucket where you want to store the images
  final storageRef = FirebaseStorage.instance.ref().child('images');

  // Create a list to hold the download URLs for the images
  List<String> imageUrls = [];

  // Use the image_picker package to select the images
  List<XFile>? images = await ImagePicker().pickMultiImage();

  // Upload each image to the storage bucket and get its download URL
  for (var image in images!) {
    TaskSnapshot taskSnapshot = await storageRef.child(image.name).putFile(File(image.path));
    String imageUrl = await taskSnapshot.ref.getDownloadURL();
    imageUrls.add(imageUrl);
  }

  // Create a document in the Firestore collection that includes the title and image URLs
  final userId = userDetailsSnapshot.docs.first.id;
  await FirebaseFirestore.instance.collection('posts').add({
    'userId': userId,
    'title': _title,
    'imageUrls': imageUrls,
    'timestamp': FieldValue.serverTimestamp(),
  });
}


  Future<void> _pickImages() async {
    List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
    if (pickedImages != null) {
      List<File> files = [];
      for (var image in pickedImages) {
        files.add(File(image.path));
      }
      setState(() {
        _images = files;
      });
    }
  }

  Future<void> _post() async {
    // Upload images to Firebase Storage
    List<String> imageUrls = [];
    for (var image in _images) {
      String imageName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      TaskSnapshot taskSnapshot =
      await FirebaseStorage.instance.ref('images/$imageName').putFile(image);
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      imageUrls.add(imageUrl);
    }}
}