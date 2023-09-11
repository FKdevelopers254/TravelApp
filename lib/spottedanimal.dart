 import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
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

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final document = snapshot.data!.docs[index];
              final animalName = document['animalName'];
              final date = document['date'];
              final time = document['time'];
              final latitude = document['latitude'];
              final longitude = document['longitude'];
              final imagepath = document['imagepath'];

              return ListTile(
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
              );
            },
          );
        },
      ),
    );
  }
}
