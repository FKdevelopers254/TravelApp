import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

import '../hoteladmin/editroom.dart';
import '../safariadmin/homescreen.dart';
import 'editcar.dart';
import 'addcar.dart';









class CarHomeP extends StatefulWidget {
  const CarHomeP({Key? key}) : super(key: key);

  @override
  State<CarHomeP> createState() => _CarHomePState();
}

class _CarHomePState extends State<CarHomeP> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  late TabController tabController;
  @override
  void  initState(){
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
                    MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      },
                      child: Text(
                        'Add Car',
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),

                    GestureDetector(
                        onTap: (){FirebaseAuth.instance.signOut();},


                        child: Lottie.asset('assets/icons/92893-man-waiting-car.json',height: 70,)),
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
                  'Cars',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Rates',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Features',style: TextStyle(
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



                RoomP(),


                MilkPage(),
                SwitchScreen(),









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

          return Column();
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
            .collection('cars')
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
              bool carAvailability = document.get('availability');
              bool _isAvailable = carAvailability;












              void deleteCar(String carId) {
                FirebaseFirestore.instance
                    .collection('cars')
                    .doc(carId)
                    .delete()
                    .then((value) => print('Car deleted'))
                    .catchError((error) => print('Failed to delete car: $error'));
              }


              return Column(
                children: [


                  GestureDetector(

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditCarPage(docId: document.id,)),
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
                                                  title: Text('Delete Car'),
                                                  content: Text('Are you sure you want to delete this car?'),
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
                                              MaterialPageRoute(builder: (context) => EditCarPage(docId: document.id,)),
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
                                            carAvailability ? Icons.toggle_on : Icons.toggle_off,
                                            color: carAvailability ? Colors.green : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isAvailable = !_isAvailable;
                                            });
                                            FirebaseFirestore.instance
                                                .collection('cars')
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

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool _payatpickupEnabled = false;
  bool _unlimitedmileageEnabled = false;
  bool _freecancellationEnabled = false;
  bool _doorstepdeliveryEnabled = false;
  bool _driverincludedEnabled = false;


  final firestoreInstance = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // Initialize switch button values from Firestore database
    firestoreInstance
        .collection('caramenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        Map<String, dynamic> data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        setState(() {
          _payatpickupEnabled = data['payatpickup'] ?? false;
          _unlimitedmileageEnabled = data['unlimitedmileage'] ?? false;
          _freecancellationEnabled = data['freecancellation'] ?? false;
          _doorstepdeliveryEnabled = data['doorstepdelivery'] ?? false;
          _driverincludedEnabled = data['driverincluded'] ?? false;


        });
      }
    });
  }






  void _onpayatpickupChanged(bool value) {
    setState(() {
      _payatpickupEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('caramenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('caramenities')
            .doc(documentId)
            .update({'payatpickup': value});
      } else {
        firestoreInstance.collection('caramenities').add({
          'email': user!.email,
          'payatpickup': value,
          'unlimitedmileage': _unlimitedmileageEnabled,
          'freecancellation': _freecancellationEnabled,
          'doorstepdelivery': _doorstepdeliveryEnabled,
          'driverincluded': _driverincludedEnabled,

        });
      }
    });
  }

  void _unlimitedmileageChanged(bool value) {
    setState(() {
      _unlimitedmileageEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('caramenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('caramenities')
            .doc(documentId)
            .update({'unlimitedmileage': value});
      } else {
        firestoreInstance.collection('caramenities').add({
          'email': user!.email,
          'payatpickup': _payatpickupEnabled,
          'unlimitedmileage': value,
          'freecancellation': _freecancellationEnabled,
          'doorstepdelivery': _doorstepdeliveryEnabled,
          'driverincluded': _driverincludedEnabled,
        });
      }
    });
  }
  void _freecancellationChanged(bool value) {
    setState(() {
      _freecancellationEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('caramenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('caramenities')
            .doc(documentId)
            .update({'freecancellation': value});
      } else {
        firestoreInstance.collection('caramenities').add({
          'email': user!.email,
          'payatpickup': _payatpickupEnabled,
          'unlimitedmileage': _unlimitedmileageEnabled,
          'freecancellation': value,
          'doorstepdelivery': _doorstepdeliveryEnabled,
          'driverincluded': _driverincludedEnabled,
        });
      }
    });
  }


  void _doorstepdeliveryChanged(bool value) {
    setState(() {
      _doorstepdeliveryEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('caramenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('caramenities')
            .doc(documentId)
            .update({'doorstepdelivery': value});
      } else {
        firestoreInstance.collection('caramenities').add({
          'email': user!.email,
          'payatpickup': _payatpickupEnabled,
          'unlimitedmileage': _unlimitedmileageEnabled,
          'freecancellation': _freecancellationEnabled,
          'doorstepdelivery': value,
          'driverincluded': _driverincludedEnabled,
        });
      }
    });
  }
  void _driverincludedChanged(bool value) {
    setState(() {
      _driverincludedEnabled = value;
    });
    // Update Firestore database with new value
    firestoreInstance
        .collection('caramenities')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        String documentId = querySnapshot.docs.first.id;
        firestoreInstance
            .collection('caramenities')
            .doc(documentId)
            .update({'driverincluded': value});
      } else {
        firestoreInstance.collection('caramenities').add({
          'email': user!.email,
          'payatpickup': _payatpickupEnabled,
          'unlimitedmileage': _unlimitedmileageEnabled,
          'freecancellation': _freecancellationEnabled,
          'doorstepdelivery': _doorstepdeliveryEnabled,
          'driverincluded': value,
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
            title: Text('Pay At Pickup'),
            value: _payatpickupEnabled,
            onChanged: _onpayatpickupChanged,
          ),
          SwitchListTile(
            title: Text('Unlimited Mileage'),
            value: _unlimitedmileageEnabled,
            onChanged: _unlimitedmileageChanged,
          ),
          SwitchListTile(
            title: Text('Free cancellation'),
            value: _freecancellationEnabled,
            onChanged: _freecancellationChanged,
          ),


          SwitchListTile(
            title: Text('DoorStep Delivery'),
            value: _doorstepdeliveryEnabled,
            onChanged: _doorstepdeliveryChanged,
          ),
          SwitchListTile(
            title: Text('Driver Included'),
            value: _driverincludedEnabled,
            onChanged: _driverincludedChanged,
          ),

        ],

      ),
    );
  }
}




