 import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import 'animalspotted.dart';
 import 'package:flutter/material.dart';
 import 'package:maps_launcher/maps_launcher.dart';




class AnimalSpottedPage extends StatefulWidget {

  @override
  _AnimalSpottedPageState createState() => _AnimalSpottedPageState();
}

 void openMaps(double latitude, double longitude) {
   MapsLauncher.launchCoordinates(latitude, longitude);
 }

class _AnimalSpottedPageState extends State<AnimalSpottedPage> {
  final mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animals Spotted',style: GoogleFonts.andika(),),
        actions: [
          ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalSpottingPage(),),);

          }, child: Row(
            children: [
              Icon(Icons.add),
              Text('Add')
            ],
          ),)
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('animalspotted').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }


          if (snapshot.data is QuerySnapshot) { // Check if the data is of type QuerySnapshot
            QuerySnapshot querySnapshot = snapshot.data as QuerySnapshot;
            return ListView.builder(
              itemCount: querySnapshot.docs.length, // Now you can safely access docs
              itemBuilder: (context, index) {
                final document = querySnapshot.docs[index];
                final animalName = document['animalName'];
                final date = document['date'];
                final time = document['time'];
                final double latitude = document['latitude'];
                final double longitude = document['longitude'];
                final imagepath = document['imagepath'];

                return Column(
                  children: [
                    ListTile(
                      leading: Lottie.asset('$imagepath',width: 50,height: 70),
                      title: Text(animalName),
                      subtitle: Text('$date at $time'),
                      trailing: GestureDetector(
                        onLongPress: ()async {



                          final url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

                          if (await canLaunchUrl(Uri.parse(url))) {
                            final uri = Uri.parse(url);
                            await launchUrl(uri);
                          }
                          else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Could not open maps app'),
                            ));
                          }

                        },
                        child: IconButton(
                          icon: Icon(Icons.map),

                          onPressed: () async {
                            openMaps(latitude, longitude);


                          },
                        ),
                      ),
                    ),

                  ],
                );

              },
            );




          } else {
            return Center(child: Text('No data available'));
          }


        },
      ),
    );
  }
}





