import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert';


import '../screens/hotel_screen.dart';
import 'hotel_tab.dart';
import 'hotel_tab_location.dart';
import 'hotel_tab_price.dart';

class HotelTabPrice extends StatefulWidget {
  const HotelTabPrice({Key? key}) : super(key: key);

  @override
  State<HotelTabPrice> createState() => _HotelTabPriceState();
}

class _HotelTabPriceState extends State<HotelTabPrice> {

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _hotels = [];
  List<DocumentSnapshot> _filteredHotels = [];
  RangeValues _selectedPriceRange = const RangeValues(0.0, 1000.0);



  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('hotels')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _hotels = snapshot.docs;
        _filteredHotels = _hotels;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),

        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('${_selectedPriceRange.start.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold),),


              RangeSlider(
                values: _selectedPriceRange,
                min: 0.0,
                max: 1000.0,
                onChanged: (RangeValues values) {
                  setState(() {
                    _selectedPriceRange = values;
                    _filteredHotels = _hotels.where((hotel) {
                      final price = hotel['price'].toDouble();
                      return price >= _selectedPriceRange.start && price <= _selectedPriceRange.end;
                    }).toList();
                  });
                },
              ),

              Text('${_selectedPriceRange.end.toStringAsFixed(2)}',style: TextStyle(fontWeight: FontWeight.bold),),

            ],
          ),


        ],


      ),
      body:_filteredHotels.isEmpty
          ? Center(child: Lottie.asset('assets/icons/36352-lion-running.json',height: 300))
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 10,

        ),
        padding: const EdgeInsets.all(8),

        itemCount: _filteredHotels.length,
        itemBuilder: (BuildContext content,int index){
          final hotel = _filteredHotels[index];


          final hotelId = hotel.id;
          final user = FirebaseAuth.instance.currentUser;
          final CollectionReference _ratingsRef =
          FirebaseFirestore.instance.collection('ratinghotel');







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
              'id': hotelId,
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

          return InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
            child: Container(
              margin: const EdgeInsets.only(top: 5.0,bottom: 5.0),

              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[



                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: hotel['imageurl'],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          height: 180.0,
                          width: 180.0,
                          image: AssetImage(hotel['imageurl']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),






                  Positioned(
                    bottom: 48,
                    left: 5,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _ratingsRef.where('email', isEqualTo: hotel['email']).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Lottie.asset('assets/icons/2523-loading.json', height: 30);
                        }

                        List<DocumentSnapshot> documents = snapshot.data!.docs;
                        double averageRating =
                        (documents.fold(0.0, (acc, doc) => acc + doc['rating']) / documents.length);

                        return RatingBar.builder(
                          initialRating: averageRating,
                          itemSize: 17,
                          minRating: 0,
                          maxRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) async {
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final User? user = auth.currentUser;
                            final String? email = user!.email;

                            final DocumentReference hotelRef = FirebaseFirestore.instance
                                .collection('hotels')
                                .doc(hotelId);

                            final QuerySnapshot ratingSnapshot = await FirebaseFirestore.instance
                                .collection('ratinghotel')
                                .where('hotelId', isEqualTo: hotelId)
                                .where('email', isEqualTo: email)
                                .get();

                            final bool isRated = ratingSnapshot.docs.isNotEmpty;

                            if (isRated) {
                              // Update the existing rating document
                              ratingSnapshot.docs.first.reference.update({'rating': rating});
                            } else {
                              // Create a new rating document
                              await FirebaseFirestore.instance.collection('ratinghotel').add({
                                'email': email,
                                'hotelId': hotelId,
                                'rating': rating,
                              })  ;
                            }

                            // Update the hotel rating
                            final QuerySnapshot ratings = await FirebaseFirestore.instance
                                .collection('ratinghotel')
                                .where('hotelId', isEqualTo: hotelId)
                                .get();

                            final int numRatings = ratings.docs.length;
                            final double totalRating = ratings.docs.fold(0, (acc, doc) => acc + doc['rating']);
                            final double newRating = totalRating / numRatings;

                            await hotelRef.update({'rating': newRating});
                          },
                        );
                      },
                    ),

                  ),


                  Positioned(
                    bottom: 24,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(2),
                      ),


                      child: Wrap(
                        children: [
                          Text(
                            hotel['name'],
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),


                      child: Wrap(
                        children: [
                          Text(
                            hotel['address'],
                            style: GoogleFonts.bebasNeue(
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(2),
                      ),


                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                '${hotel['price']} \$',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
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
                    left: 10.0,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('wishlisthotels')
                          .where('email', isEqualTo: user!.email)
                          .where('id', isEqualTo: hotelId)
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
                                height: 80,



                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(

                                      child: Lottie.asset('assets/icons/wishlist.json',height: 230,),
                                      onTap:_isLoading
                                          ? null // Disable the button while loading
                                          : () => _wishlistHotel(hotelId, context),),



                                    if (_isLoading)
                                      Positioned.fill(
                                        child: Container(
                                          color: Theme.of(context).primaryColor.withOpacity(0.5),
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


          );
        },


      ),

    );
  }
}

