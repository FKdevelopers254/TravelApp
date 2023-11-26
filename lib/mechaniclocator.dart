import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maps_launcher/maps_launcher.dart';





class MechanicLocator extends StatefulWidget {
  @override
  _MechanicLocatorState createState() => _MechanicLocatorState();
}
void openMaps(double latitude, double longitude) {
  MapsLauncher.launchCoordinates(latitude, longitude);
}

class _MechanicLocatorState extends State<MechanicLocator> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  // List<String> closestStores = ['Loading...'];
  List<Map<String, dynamic>> closestStores = [{'name': 'Loading...'}];

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
    getUserLocation().then((Position userLocation) async {

      List<Map<String, dynamic>> stores = await findClosestStoress(userLocation);
      setState(() {
        closestStores = stores;
      });
    });
  }



  Future<List<Map<String, dynamic>>> findClosestStoress(Position userLocation) async {
    final stores = FirebaseFirestore.instance.collection('mechanics');
    final QuerySnapshot snapshot = await stores.get();

    List<Map<String, dynamic>> storeDistances = [];

    for (QueryDocumentSnapshot doc in snapshot.docs) {
      double latitude = doc['latitude'];  // Assuming latitude field name is 'latitude'
      double longitude = doc['longitude'];
      // GeoPoint point = doc['location'];
      double distance = Geolocator.distanceBetween(
        userLocation.latitude,
        userLocation.longitude,
        latitude,
        longitude,
      );

      storeDistances.add({
        'name': doc['name'],
        'distance': distance,
      });
    }

    storeDistances.sort((a, b) => (a['distance']).compareTo(b['distance']));

    return storeDistances;
  }

  Future<Map<String, dynamic>> findClosestStores(Position userLocation) async {
    final stores = FirebaseFirestore.instance.collection('mechanics');
    final QuerySnapshot snapshot = await stores.get();

    double minDistance = double.infinity;
    String closestStore = '';
    double closestDistance = 0.0;


    for (QueryDocumentSnapshot doc in snapshot.docs) {
      double latitude = doc['latitude'];
      double longitude = doc['longitude'];
      double distance = Geolocator.distanceBetween(
        userLocation.latitude,
        userLocation.longitude,
        latitude,
        longitude,
      );

      if (distance < minDistance) {
        minDistance = distance;
        closestStore = doc['name'];

        closestDistance = distance;
      }
    }
    return {'name': closestStore, 'distance': (closestDistance / 1000)};
    //  return {'name': closestStore, 'distance': closestDistance / 1000}; // Convert meters to kilometers
  }




  @override


  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _permissionStatus = status;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: <Widget>[

            Container(
              height: 55.0,

              decoration:   BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(5.0,),bottomLeft: Radius.circular(75.0,),topRight: Radius.circular(75)



                  )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5,),
                GestureDetector(
                  onTap: () {

                  },
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Mechanic Locator',textStyle: GoogleFonts.bebasNeue(fontSize:28,color: Colors.white)),

                      TyperAnimatedText('Closest we can find',textStyle: GoogleFonts.bebasNeue(fontSize:28,color: Colors.white)),


                    ],
                    pause: const Duration(milliseconds: 3000),

                    stopPauseOnTap: true,
                    repeatForever: true,
                  ),
                ),
                GestureDetector(
                    onTap: () {

                    },
                    child: Lottie.asset('assets/icons/2523-loading.json',height: 70,)),
                SizedBox(width: 5,),
              ],
            ),


          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            if (_permissionStatus.isDenied)
              Text('Location permission denied. Please enable it in settings.'),
            ElevatedButton(
              onPressed: () async {
                if (_permissionStatus.isGranted) {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);

                  // Access location here
                } else {
                  requestLocationPermission();
                }
              },
              child: Text('Request Location Permission'),
            ),



            Text(
              'Closest Mechanics:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            for (var store   in closestStores)
              GestureDetector(
                onTap: () async {
                  openMaps(1, 2);


                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${store['name']} - ',
                      style: GoogleFonts.andika(fontSize: 20, color: Colors.blue),
                    ),
                    Text(
                      '${store['distance']} kms',
                      style: GoogleFonts.andika(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
              ),



          ],
        ),
      ),
    );
  }
}

Future<Position> getUserLocation() async {
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
}
