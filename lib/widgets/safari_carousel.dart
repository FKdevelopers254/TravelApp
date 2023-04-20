import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastravel/widgets/safari_tab.dart';
import 'package:eastravel/widgets/safaridata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../screens/destination_screen.dart';
import '../screens/hotel_screen.dart';
import '../screens/safari_screen.dart';
import '../screens/test.dart';


class SafariCarousel extends StatefulWidget {

   SafariCarousel({Key? key}) : super(key: key);

  @override
  State<SafariCarousel> createState() => _SafariCarouselState();
}

class _SafariCarouselState extends State<SafariCarousel> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Popular Places',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariP(),),);},
                // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariTab(),),);},
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
          height: 170,

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('safaris')
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
                  final location = document.get('location');
                  final email = document.get('email');
                  final days = document.get('days');
                  final price = document.get('price');

                  final imageurl = document.get('imageUrl');


                  final hotelId = document.get('id'); // <-- Get the hotel ID



                  bool _isLoading = false;


                  void _wishlistHotel(String hotelId, BuildContext context) async {
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
                        .collection('safaris')
                        .doc(hotelId)
                        .get();

                    // Check if the hotel is already in the user's wishlist
                    final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
                        .collection('wishlistsafaris')
                        .where('email', isEqualTo: email)
                        .where('name', isEqualTo: snapshot['name'])
                        .get();
                    final isWishlisted = wishlistSnapshot.docs.isNotEmpty;
                    if (isWishlisted) {
                      // Hotel is already in the wishlist, show a snackbar and return
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Safari is already in wishlist!'),
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
                    await FirebaseFirestore.instance.collection('wishlistsafaris').add({
                      'email': email,
                      'name': snapshot['name'],
                      'address': snapshot['address'],
                      'price': snapshot['price'],
                      'imageurl': snapshot['imageUrl'],
                      'id': document.id,
                    });

                    // Show a snackbar to the user
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(

                        content: Text('Safari added to wishlist!'),
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
                        MaterialPageRoute(builder: (context) => SafariDetailScreen(document)),
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
                                                '$location',
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
                                                children: <Widget>[
                                                  const Icon(
                                                    FontAwesomeIcons.calendarDay,
                                                    size: 10.0,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 5.0),
                                                  Text(
                                                    '$days',
                                                    style: GoogleFonts.abrilFatface(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' Days',
                                                    style: GoogleFonts.abrilFatface(
                                                      color: Colors.white,
                                                    ),
                                                  )

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
                                  top: 50.0,
                                  left: 10.0,
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection('wishlistsafaris')
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
                                              height: 40,

                                              padding: EdgeInsets.all(5.0),
                                              child: Row(
                                                children: [
                                                  Lottie.asset('assets/icons/like.json',height: 350),


                                                  if (_isLoading)
                                                    Positioned.fill(
                                                      child: Container(
                                                        color: Colors.black54.withOpacity(0.5),
                                                        child: Center(
                                                          child: Lottie.asset('assets/icons/like.json',height: 350),
                                                         // child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
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





