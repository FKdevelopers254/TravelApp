import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../models/car_model.dart';
import '../screens/car_screen.dart';
import 'car_tab.dart';
import 'cardata.dart';


class CarCarousel extends StatefulWidget {
  final List<Map<String, String>> cars = [
    {

      'imageUrl': 'assets/images/subaru.jpeg',
      'name': 'Subaru',
      'address': 'Kitengela,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyoavoxy.jpeg',
      'name': 'Voxy',
      'address': 'Kikuyu,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/pajero.jpeg',
      'name': 'Pajero',
      'address': 'Machakos,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/prado.jpeg',
      'name': 'Subaru',
      'address': 'Kitengela,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotaaxio.jpg',
      'name': 'Toyota Axio',
      'address': 'Nairobi,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotaprius.jpg',
      'name': 'Toyota Prius',
      'address': 'Nairobi,Kenya',
      'price': '300',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotamarkx.jpg',
      'name': 'Toyota Mark X',
      'address': 'Nairobi,Kenya',
      'price': '140',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotahiace.jpeg',
      'name': 'Toyota Hiace ',
      'address': 'Nairobi,Kenya',
      'price': '200',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotahilux.jpg',
      'name': 'Toyota Hilux',
      'address': 'Nairobi,Kenya',
      'price': '540',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'Pick Up',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/bushire.jpg',
      'name': 'Bus HINO 500',
      'address': 'Nairobi,Kenya',
      'price': '124',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'Bus',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '4',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
  ];
   CarCarousel({Key? key}) : super(key: key);

  @override
  State<CarCarousel> createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Car Rentals',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CarP(),),);},
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 200,

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('cars')
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
                scrollDirection: Axis.horizontal,
                children: snapshot.data!.docs.map((document) {
                  final name = document.get('name');
                  final email = document.get('email');
                  final adrress = document.get('address');
                  final geartype = document.get('geartype');

                  final price = document.get('price');
                  final engine = document.get('engine');

                  final imageurl = document.get('imageurl');





                  final carId = document.get('id'); // <-- Get the hotel ID






                  bool _isLoading = false;


                  void _wishlistCar(String carId, BuildContext context) async {
                    // Set the loading state to true
                    setState(() {
                      _isLoading = true;
                    });
                    // Get the current user's email and name
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final User? user = auth.currentUser;
                    final String? email = user!.email;
                    // final String email = user?.email ?? 'nashtunic@gmail.com';


                    // Get the hotel data using its ID
                    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
                        .collection('cars')
                        .doc(carId)
                        .get();

                    // Check if the hotel is already in the user's wishlist
                    final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
                        .collection('wishlistcars')
                        .where('email', isEqualTo: email)
                        .where('name', isEqualTo: snapshot['name'])
                        .get();
                    final isWishlisted = wishlistSnapshot.docs.isNotEmpty;
                    if (isWishlisted) {
                      // Hotel is already in the wishlist, show a snackbar and return
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Hotel is already in wishlist!'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // Set the loading state back to false
                      setState(() {
                        _isLoading = false;
                      });
                      return;
                    }

                    // Add the hotel data to the wishlisthotels collection
                    await FirebaseFirestore.instance.collection('wishlistcars').add({
                      'email': email,
                      'name': snapshot['name'],
                      'address': snapshot['address'],
                      'price': snapshot['price'],
                      'imageurl': snapshot['imageurl'],
                      'id': document.id,
                    });

                    // Show a snackbar to the user
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(

                        content: Text('Hotel added to wishlist!'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Set the loading state back to false
                    setState(() {
                      _isLoading = false;
                    });
                  }











                  return GestureDetector(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CarScreen(car: document.id)),
                      );
                    },
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EventSingles(safari: safaris[index]),),);},
                    //    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariScreen(safari: safaris[index]),),);},
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: 300.0,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                Hero(
                                  tag:
                                  '$imageurl',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      height: 250.0,
                                      width: 300.0,
                                      image: AssetImage('$imageurl'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 5.0,
                                  bottom: 5.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //  color: Colors.deepPurple.shade900.withOpacity(0.6),
                                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(10)
                                    ),

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Row(
                                            children: <Widget>[
                                              const Icon(
                                                FontAwesomeIcons.safari,
                                                size: 10.0,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                '$adrress',
                                                style: GoogleFonts.abrilFatface(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),

                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      const Icon(
                                                        Icons.settings,
                                                        size: 13.0,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(width: 5.0),
                                                      Text(
                                                        '$geartype',
                                                        style: GoogleFonts.abrilFatface(
                                                          color: Colors.white,
                                                        ),
                                                      ),


                                                    ],
                                                  ),
                                                  SizedBox(width: 5,),
                                                  Row(
                                                    children: <Widget>[
                                                      const Icon(
                                                        Icons.filter_alt,
                                                        size: 13.0,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(width: 5.0),
                                                      Text(
                                                        '$engine',
                                                        style: GoogleFonts.abrilFatface(
                                                          color: Colors.white,
                                                        ),
                                                      ),


                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 30,),
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    FontAwesomeIcons.moneyBill,
                                                    size: 10.0,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    '$price',
                                                    style: GoogleFonts.bebasNeue(
                                                      color: Colors.white,
                                                    ),
                                                  ),

                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 5.0,
                                  top: 5.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      //  color: Colors.deepPurple.shade900.withOpacity(0.6),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(2)
                                    ),

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Wrap(
                                          children: [
                                            Text(
                                              '$name',
                                              style: GoogleFonts.bebasNeue(
                                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),






                                Positioned(
                                  top: 10.0,
                                  right: 10.0,
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection('wishlistcars')
                                        .where('email', isEqualTo: email)
                                        .where('id', isEqualTo: document.id)
                                        .snapshots(),
                                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      }

                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                          return CircularProgressIndicator();
                                        default:
                                          if (snapshot.data!.docs.isNotEmpty) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(2.0),
                                                color: Colors.white,
                                              ),
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                'Wishlisted',
                                                style: TextStyle(
                                                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              height: 70,

                                              padding: EdgeInsets.all(5.0),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    child: Lottie.asset('assets/icons/like.json',height: 350),
                                                    onTap: _isLoading
                                                        ? null // Disable the button while loading
                                                        : () => _wishlistCar(document.id, context),),


                                                  if (_isLoading)
                                                    Positioned.fill(
                                                      child: Container(
                                                        color: Colors.black54.withOpacity(0.5),
                                                        child: Center(
                                                          child: CircularProgressIndicator(
                                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),


                                                ],
                                              ),
                                            );
                                          }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}


