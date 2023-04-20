import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart';


import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'addroom.dart';
import '../safariadmin/homescreen.dart';
import 'edithotel.dart';
import 'addhotel.dart';
import 'editroom.dart';


import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';








class HomeP extends StatefulWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  State<HomeP> createState() => _HomePState();
}

class _HomePState extends State<HomeP> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  late TabController tabController;
  @override
  void  initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9EFEB),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
        ),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100.0,

                decoration: const BoxDecoration(
                    color: Color(0xFFFD7465),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0,),bottomLeft: Radius.circular(75.0,)



                    )
                ),
              ),
               Padding(
                padding: EdgeInsets.only(top: 15.0,left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [


                      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection('hotels')
                            .where('email', isEqualTo: user.email!)
                            .snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                                );
                              },
                              child: const Text(
                                'Add Hotel',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }
                          // Return an empty Container if the document with the matching email exists in the "hotels" collection.
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => rRegisterPage()),
                              );
                            },
                            child: Container(
                              child: const Text(
                                'Add Room',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ],
                    ),

                    GestureDetector(
                        onTap: (){FirebaseAuth.instance.signOut();},

                        child: Lottie.asset('assets/icons/133390-hotel-pop-up.json',height: 70,))
                  ],
                ),


              ),


            ],
          ),

          TabBar(
            controller: tabController,
            indicatorColor: Color(0xFFFE8A7E),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            isScrollable: true,
            labelColor: Color(0xFF440206),
            unselectedLabelColor: Color(0xFF440206),
            tabs: const [

              Tab(
                child: Text(
                  'Hotel Amenities',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Rooms',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Profile',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Earn Credits',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),


            ],



          ),
          const SizedBox(height: 10.0,),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: tabController,
              children:  <Widget>[
                SwitchScreen(),



                RoomP(),
                BadgeScreen(name: '', email: user.email!, location: '', price: '',),
                BadgeScreen(name: user.email!, email: '', location: '', price: '',),















              ],
            ),
          ),



        ],
      ),
    );
  }


}


class MilkPage extends StatefulWidget {
  const MilkPage({Key? key}) : super(key: key);

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(


      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('hotels')
            .where('email', isEqualTo: user!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred while loading the data.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No  details found.'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              final name = document.get('name');
              final address = document.get('address');
              final price = document.get('price');
              final imageurl = document.get('imageurl');


              return Column(
                children: [


                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditHotelPage(docId: document.id,)),
                      );
                    },
                    //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 400.0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0,top: 15.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 170.0,
                              width: MediaQuery.of(context).size.width,


                            ),
                            Positioned(
                              left: 15.0,
                              top: 30.0,
                              child: Container(
                                height: 125.0,
                                width: MediaQuery.of(context).size.width - 15.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9EFEB),
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3.0,
                                          blurRadius: 3.0
                                      )
                                    ]

                                ),






                              ),
                            ),
                            Positioned(
                              left: 95.0,
                              top: 64.0,
                              child: Container(
                                height: 105.0,
                                width: MediaQuery.of(context).size.width - 15.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9EFEB),
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3.0,
                                          blurRadius: 3.0

                                      )
                                    ]
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.favorite,color: Colors.red,),
                                        SizedBox(width: 5.0,),
                                        Text('$price'.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),
                                        SizedBox(width: 25.0,),
                                        Icon(Icons.account_box,color: Colors.red,),
                                        Text('$price'.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),

                                        SizedBox(width: 25.0,),
                                        Icon(Icons.account_box,color: Colors.red,),
                                        Text('$price'.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),





                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 60,),
                            Container(
                              height: 125.0,
                              width: MediaQuery.of(context).size.width - 15.0,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset('$imageurl',fit: BoxFit.cover,),
                                    SizedBox(width: 10.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        SizedBox(height: 10.0,),
                                        Wrap(
                                          children: [
                                            Text('$name',
                                              style: TextStyle(
                                                color: Color(0xFF563724),
                                                fontFamily: 'Montserrat',
                                                fontSize: 14.0,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,


                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          width: 175,
                                          child: Text('$address', style: TextStyle(
                                              color: Color(0xFFB2A9A9),
                                              fontFamily: 'Montserrat',
                                              fontSize: 11.0
                                          ),),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(price.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFF76053),
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15.0
                                              ),

                                            ),
                                            SizedBox(width:
                                            80),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => EditHotelPage(docId: document.id,)),
                                                );
                                              },
                                              child: Text('Edit',
                                                style: TextStyle(
                                                    color: Color(0xFFF76053),
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 15.0
                                                ),

                                              ),
                                            )
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );

  }
}
class RoomP extends StatefulWidget {
  const RoomP({Key? key}) : super(key: key);

  @override
  State<RoomP> createState() => _RoomPState();
}

class _RoomPState extends State<RoomP> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Container(


      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('rooms')
            .where('email', isEqualTo: user!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred while loading the data.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No  details found.'),
            );
          }


          void deleteCar(String carId) {
            FirebaseFirestore.instance
                .collection('rooms')
                .doc(carId)
                .delete()
                .then((value) => print('Room deleted'))
                .catchError((error) => print('Failed to delete room: $error'));
          }

          return Column(

            children: snapshot.data!.docs.map((document) {
              final name = document.get('name');
              final address = document.get('address');
              final price = document.get('price');
              final imageurl = document.get('imageurl');
              bool roomAvailability = document.get('availability');
              bool _isAvailable = roomAvailability;


              void deleteCar(String carId) {
                FirebaseFirestore.instance
                    .collection('rooms')
                    .doc(carId)
                    .delete()
                    .then((value) => print('Rooms deleted'))
                    .catchError((error) => print('Failed to delete car: $error'));
              }


              return GestureDetector(

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditRoomPage(docId: document.id,)),
                  );
                },
                //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 400.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0,top: 15.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 170.0,
                          width: MediaQuery.of(context).size.width,


                        ),
                        Positioned(
                          left: 15.0,
                          top: 30.0,
                          child: Container(
                            height: 125.0,
                            width: MediaQuery.of(context).size.width - 15.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFF9EFEB),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3.0,
                                      blurRadius: 3.0
                                  )
                                ]

                            ),






                          ),
                        ),
                        Positioned(
                          left: 95.0,
                          top: 64.0,
                          child: Container(
                            height: 105.0,
                            width: MediaQuery.of(context).size.width - 15.0,
                            decoration: BoxDecoration(
                                color: Color(0xFFF9EFEB),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3.0,
                                      blurRadius: 3.0

                                  )
                                ]
                            ),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.0,left: 10.0),
                                child: Row(

                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.delete_forever),
                                      color: Colors.red,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Delete Room'),
                                              content: Text('Are you sure you want to delete this room from your Hotel?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    deleteCar(document.id);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Delete'),
                                                ),
                                              ],
                                            );
                                          },
                                        );

                                      },
                                    ),


                                    Icon(Icons.edit,color: Colors.red,),

                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => EditRoomPage(docId: document.id,)),
                                        );
                                      },
                                      child: Text('Edit',
                                        style: TextStyle(
                                            color: Color(0xFFF76053),
                                            fontFamily: 'Montserrat',
                                            fontSize: 15.0
                                        ),

                                      ),
                                    ),

                                    IconButton(
                                      icon: Icon(
                                        roomAvailability ? Icons.toggle_on : Icons.toggle_off,
                                        color: roomAvailability ? Colors.green : Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isAvailable = !_isAvailable;
                                        });
                                        FirebaseFirestore.instance
                                            .collection('rooms')
                                            .doc(document.id)
                                            .update({'availability': _isAvailable})
                                            .then((value) => print(document.id))
                                            .catchError((error) => print('Failed to update availability: $error'));
                                      },
                                    ),
                                    Text(
                                      _isAvailable ? 'Available' : 'Not available',
                                      style: TextStyle(
                                          color: _isAvailable ? Colors.green : Colors.red,
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0
                                      ),
                                    ),







                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 96.0,
                          width: MediaQuery.of(context).size.width - 15.0,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset('$imageurl',fit: BoxFit.cover,),
                                SizedBox(width: 10.0,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(height: 10.0,),
                                    Wrap(
                                      children: [
                                        Text('$name',
                                          style: TextStyle(
                                            color: Color(0xFF563724),
                                            fontFamily: 'Montserrat',
                                            fontSize: 14.0,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,


                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 5.0,),
                                    Container(
                                      width: 175,
                                      child: Text('$address', style: TextStyle(
                                          color: Color(0xFFB2A9A9),
                                          fontFamily: 'Montserrat',
                                          fontSize: 11.0
                                      ),),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                      children: [
                                        Text(price.toString(),
                                          style: TextStyle(
                                              color: Color(0xFFF76053),
                                              fontFamily: 'Montserrat',
                                              fontSize: 15.0
                                          ),

                                        ),


                                      ],
                                    ),


                                  ],
                                )
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool _wifiEnabled = false;
  bool _barEnabled = false;
  bool _parkingEnabled = false;
  bool _spaEnabled = false;
  bool _poolEnabled = false;
  bool _restaurantEnabled = false;
  bool _roomserviceEnabled = false;
  bool _petfriendlyEnabled = false;
  bool _fitnesscenterEnabled = false;
  bool _airconditioningEnabled = false;

  final firestoreInstance = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // Initialize switch button values from Firestore database
    firestoreInstance
        .collection('hotelamenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        Map<String, dynamic> data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        setState(() {
          _wifiEnabled = data['wifi'] ?? false;
          _barEnabled = data['bar'] ?? false;
          _parkingEnabled = data['parking'] ?? false;
          _spaEnabled = data['spa'] ?? false;
          _poolEnabled = data['pool'] ?? false;
          _restaurantEnabled = data['restaurant'] ?? false;
        });
      }
    });
  }






  void _onWifiChanged(bool value) {
    setState(() {
      _wifiEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('hotelamenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('hotelamenities')
            .doc(documentId)
            .update({'wifi': value});
      } else {
        firestoreInstance.collection('hotelamenities').add({
          'email': user!.email,
          'wifi': value,
          'bar': _barEnabled,
          'parking': _parkingEnabled,
          'spa': _spaEnabled,
          'pool': _poolEnabled,
          'restaurant': _restaurantEnabled,
        });
      }
    });
  }

  void _onBarChanged(bool value) {
    setState(() {
      _barEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('hotelamenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('hotelamenities')
            .doc(documentId)
            .update({'bar': value});
      } else {
        firestoreInstance.collection('hotelamenities').add({
          'email': user!.email,
          'wifi': _wifiEnabled,
          'bar': value,
          'parking': _parkingEnabled,
          'spa': _spaEnabled,
          'pool': _poolEnabled,
          'restaurant': _restaurantEnabled,
        });
      }
    });
  }
  void _onParkingChanged(bool value) {
    setState(() {
      _parkingEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('hotelamenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('hotelamenities')
            .doc(documentId)
            .update({'parking': value});
      } else {
        firestoreInstance.collection('hotelamenities').add({
          'email': user!.email,
          'wifi': _wifiEnabled,
          'bar': _barEnabled,
          'parking': value,
          'spa': _spaEnabled,
          'pool': _poolEnabled,
          'restaurant': _restaurantEnabled,
        });
      }
    });
  }


  void _onPoolChanged(bool value) {
    setState(() {
      _poolEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('hotelamenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('hotelamenities')
            .doc(documentId)
            .update({'pool': value});
      } else {
        firestoreInstance.collection('hotelamenities').add({
          'email': user!.email,
          'wifi': _wifiEnabled,
          'bar': _barEnabled,
          'parking': _parkingEnabled,
          'spa': _spaEnabled,
          'pool': value,
          'restaurant': _restaurantEnabled,
        });
      }
    });
  }
  void _onSpaChanged(bool value) {
    setState(() {
      _spaEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('hotelamenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('hotelamenities')
            .doc(documentId)
            .update({'spa': value});
      } else {
        firestoreInstance.collection('hotelamenities').add({
          'email': user!.email,
          'wifi': _wifiEnabled,
          'bar': _barEnabled,
          'parking': _parkingEnabled,
          'spa': value,
          'pool': _poolEnabled,
          'restaurant': _restaurantEnabled,
        });
      }
    });
  }
  void _onRestaurantChanged(bool value) {
    setState(() {
      _restaurantEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('hotelamenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('hotelamenities')
            .doc(documentId)
            .update({'restaurant': value});
      } else {
        firestoreInstance.collection('hotelamenities').add({
          'email': user!.email,
          'wifi': _wifiEnabled,
          'bar': _barEnabled,
          'parking': _parkingEnabled,
          'spa': _spaEnabled,
          'pool': _poolEnabled,
          'restaurant': value,
        });
      }
    });
  }





  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          SwitchListTile(
            title: Text('WiFi'),
            value: _wifiEnabled,
            onChanged: _onWifiChanged,
          ),
          SwitchListTile(
            title: Text('Bar'),
            value: _barEnabled,
            onChanged: _onBarChanged,
          ),
          SwitchListTile(
            title: Text('Parking'),
            value: _parkingEnabled,
            onChanged: _onParkingChanged,
          ),


          SwitchListTile(
            title: Text('Spa'),
            value: _spaEnabled,
            onChanged: _onSpaChanged,
          ),
          SwitchListTile(
            title: Text('Pool'),
            value: _poolEnabled,
            onChanged: _onPoolChanged,
          ),
          SwitchListTile(
            title: Text('Restaurant'),
            value: _restaurantEnabled,
            onChanged: _onRestaurantChanged,
          ),
        ],

      ),
    );
  }
}





class ImageUploaderPage extends StatefulWidget {
  @override
  _ImageUploaderPageState createState() => _ImageUploaderPageState();
}

class _ImageUploaderPageState extends State<ImageUploaderPage> {
  List<File> _imageFiles = [];
  List<String> _uploadedImageUrls = [];
  bool _uploadInProgress = false;
  double _uploadProgress = 0.0;

  Future<void> _selectImages() async {
    final int maxImages = 5 - _imageFiles.length;
    for (int i = 0; i < maxImages; i++) {
      final XFile? selected = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (selected != null) {
        final File file = File(selected.path);
        setState(() {
          _imageFiles.add(file);
        });
      } else {
        break;
      }
    }
  }



  Future<void> _uploadImages() async {
    setState(() {
      _uploadInProgress = true;
      _uploadProgress = 0.0;
    });

    // create a multipart request
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://markiniltd.com/upload'));

    // add image files to request
    for (var i = 0; i < _imageFiles.length; i++) {
      final file = _imageFiles[i];
      final stream = http.ByteStream(file.openRead());
      final length = await file.length();
      final multipartFile = http.MultipartFile(
        'images[]', // field name on server
        stream,
        length,
        filename: basename(file.path),
      );
      request.files.add(multipartFile);

      // listen to upload progress
      multipartFile.finalize().asBroadcastStream().listen((event) {
        final progress = event.length / length;
        setState(() {
          _uploadProgress = (_uploadProgress + progress) / 2; // calculate average progress
        });
      });
    }

    // send request and get response
    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    // check response status code
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(responseString);
      final List<String> uploadedUrls =
      List<String>.from(jsonResponse['uploaded_urls']);
      setState(() {
        _uploadedImageUrls.addAll(uploadedUrls);
        _imageFiles.clear();
        _uploadInProgress = false;
        _uploadProgress = 0.0;
      });
    } else {
      // handle error
      setState(() {
        _uploadInProgress = false;
        _uploadProgress = 0.0;
      });

    }
  }


  Future<void> _uploadImagesOnline() async {
    setState(() {
      _uploadInProgress = true;
      _uploadProgress = 0.0;
    });

    // create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://markiniltd.com/easafaris.php'),
    );

    // add user ID to request
    request.fields['user_id'] = '123';

    // add image files to request
    for (var i = 0; i < _imageFiles.length; i++) {
      final file = _imageFiles[i];
      final stream = http.ByteStream(file.openRead());
      final length = await file.length();
      final multipartFile = http.MultipartFile(
        'images[]', // field name on server
        stream,
        length,
        filename: basename(file.path),
      );
      request.files.add(multipartFile);

      // listen to upload progress
      multipartFile.finalize().asBroadcastStream().listen((event) {
        final progress = event.length / length;
        setState(() {
          _uploadProgress = (_uploadProgress + progress) / 2; // calculate average progress
        });
      });
    }

    // send request and get response
    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    // check response status code
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(responseString);
      final List<String> uploadedUrls = List<String>.from(jsonResponse['uploaded_urls']);
      setState(() {
        _uploadedImageUrls.addAll(uploadedUrls);
        _imageFiles.clear();
        _uploadInProgress = false;
        _uploadProgress = 0.0;
      });
    } else {
      // handle error
      setState(() {
        _uploadInProgress = false;
        _uploadProgress = 0.0;
      });
    }
  }





  void _removeImage(int index) {
    setState(() {
      _imageFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              itemCount: _imageFiles.length,
              itemBuilder: (BuildContext context, int index) {
                final file = _imageFiles[index];
                return Stack(
                  children: [
                    Image.file(
                      file,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onPressed: () => _removeImage(index),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _selectImages,
              child: Text('Select Images'),
            ),
          ),
          _uploadInProgress
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearProgressIndicator(
              value: _uploadProgress,
            ),
          )
              : SizedBox.shrink(),
          _imageFiles.isNotEmpty
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _uploadImages,
              child: Text('Upload Images'),
            ),
          )
              : SizedBox.shrink(),
        ],
      ),
    );
  }}




class BadgeScreen extends StatelessWidget {
  final String name;
  final String email;
  final String location;
  final String price;

  const BadgeScreen({required this.name,required this.email,required this.location,required this.price});

  @override
  Widget build(BuildContext context) {
    final qrData = 'name:,$name, email:$email, location:$location, price:$price';

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: qrData,
              version: QrVersions.auto,
              size: 250.0,
            ),
            SizedBox(height: 16),
            Text('Scan this QR code to get the badge'),
          ],
        ),
      ),
    );
  }
}



