
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class PlacetoVisit extends StatelessWidget {
  final String safari;




   PlacetoVisit({Key? key, required this.safari}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('places').doc(safari).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final name = snapshot.data!.get('name');
          final address = snapshot.data!.get('address');
          final description = snapshot.data!.get('description');
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 8.0),
                Text(address),
                SizedBox(height: 16.0),
                Text(description),
              ],
            ),
          );
        },
      ),
    );
  }
}







