import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';


class AnimalSpottingPage extends StatefulWidget {
  @override
  _AnimalSpottingPageState createState() => _AnimalSpottingPageState();
}

class _AnimalSpottingPageState extends State<AnimalSpottingPage> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;
  final animalNameController = TextEditingController();

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  double? latitude;
  double? longitude;


  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    setState(() {
      _permissionStatus = status;
    });
  }









  Future<void> addAnimal() async {
    if (latitude != null && longitude != null) {
      try {
        await FirebaseFirestore.instance.collection('animalspotted').add({
          'animalName': animalNameController.text,
          'date': dateController.text,
          'time': timeController.text,
          'latitude': latitude,
          'longitude': longitude,
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Spotted $animalNameController Added successfully')));
        animalNameController.clear();
        dateController.clear();
        timeController.clear();
        setState(() {
          latitude = null;
          longitude = null;
        });
      } catch (e) {
        print('Error writing animal details to Firestore: $e');
        Navigator.pop(context); // dismiss the progress indicator dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('An error occurred while saving your animal details. Please try again later.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    } else {
      // handle the case where the location is null
      Navigator.pop(context); // dismiss the progress indicator dialog
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please get your location first')));
    }
  }


  @override
  void dispose() {
    animalNameController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Spotted Animal',style: GoogleFonts.andika(),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: TextFormField(
                    controller: animalNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      hintText: 'Animal Name',
                      fillColor: Colors.grey[200],
                      filled: true,

                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an animal name';
                        }
                        return null;
                      }

                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: TextFormField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: 'Select date',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          // Update the date controller with the selected date
                          if (selectedDate != null) {
                            dateController.text = DateFormat.yMMMd().format(selectedDate);
                          }
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date';
                      }
                      return null;
                    },
                  ),

                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: TextFormField(
                    controller: timeController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      hintText: 'Time',
                      fillColor: Colors.grey[200],
                      filled: true,

                    ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Time';
                        }
                        return null;
                      }

                  ),
                ),
              ),
            ),



            SizedBox(height: 16.0),


            if (_permissionStatus.isDenied)
              Text('Location permission denied. Please enable it in settings.'),
            ElevatedButton(
              onPressed: () async {
                if (_permissionStatus.isGranted) {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  setState(() {
                    latitude = position.latitude;
                    longitude = position.longitude;
                  });
                  // Access location here
                } else {
                  requestLocationPermission();
                }
              },
              child: Text('Request Location Permission'),
            ),
              ElevatedButton(
                onPressed: () async {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  setState(() {
                    latitude = position.latitude;
                    longitude = position.longitude;
                  });
                },
                child: Text('Get My Location'),
              ),
            SizedBox(height: 16.0),
            if (latitude != null && longitude != null)
              Text('Latitude: $latitude\nLongitude: $longitude'),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                onPrimary: Colors.white, // Text color
              ),
              onPressed: addAnimal ,

              child: Text('Add Spotted Animal'),
            ),
          ],
        ),
      ),
    );
  }
}
