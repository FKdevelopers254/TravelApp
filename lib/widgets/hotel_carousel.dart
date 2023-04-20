import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:lottie/lottie.dart';

import '../hoteladmin/ai.dart';
import '../hoteladmin/edithotel.dart';
import '../hoteladmin/homescreen.dart';
import '../screens/hotel_screen.dart';
import '../screens/ptv.dart';
import '../screens/test.dart';
import 'hotel_tab.dart';
import 'package:eastravel/widgets/bottom_bar.dart';

import 'hoteldata.dart';


class HotelCarousel extends StatefulWidget {


  final int initialLikeCount;
  final user = FirebaseAuth.instance.currentUser;


    HotelCarousel({Key? key, this.initialLikeCount = 0, }) : super(key: key);

  @override
  State<HotelCarousel> createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {


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
                'Exclusive Hotels',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const HotelP(),),);},
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
          height: 210,

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('hotels')
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
                  final documentId = document.get('id');
                  final name = document.get('name');
                  final email = document.get('email');
                  final address = document.get('address');
                  final price = document.get('price');

                  final imageurl = document.get('imageurl');
                  final likeCount = document.get('likeCount');


                  int _likeCount = 0;
                  bool _isLiked = false;





                  final CollectionReference hotelsCollection = FirebaseFirestore.instance.collection('hotels');


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
                        .collection('hotels')
                        .doc(hotelId)
                        .get();

                    // Check if the hotel is already in the user's wishlist
                    final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
                        .collection('wishlisthotels')
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
                    await FirebaseFirestore.instance.collection('wishlisthotels').add({
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

                  }












                  return GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(document),),);},
                    // onLongPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => UploadPage(),),);},
                    //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 300.0,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                              height: 68.0,
                              width: 300.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.8),
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '$name',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),

                                    Text(
                                      '$address',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '$price'+' '+ '\$',
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          ' ''/night',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child:

                              GestureDetector(
                                onTap: () async {

                                },

                                child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 120.0,
                              width: 320.0,
                              image: AssetImage('$imageurl'),
                              fit: BoxFit.cover,
                            ),
                          ),








                          Positioned(
                            top: 10.0,
                            left: 10.0,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance.collection('wishlisthotels')
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
                                            GestureDetector(
                                                child: Lottie.asset('assets/icons/like.json',height: 350),
                                            onTap: _isLoading
                                                ? null // Disable the button while loading
                                                : () => _wishlistHotel(document.id, context),),




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




