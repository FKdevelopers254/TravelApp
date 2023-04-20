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
import 'car_tab.dart';
import 'hotel_tab_location.dart';
import 'hotel_tab_price.dart';

class CarTabLocation extends StatefulWidget {
  const CarTabLocation({Key? key}) : super(key: key);

  @override
  State<CarTabLocation> createState() => _CarTabLocationState();
}

class _CarTabLocationState extends State<CarTabLocation> {

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _cars = [];
  List<DocumentSnapshot> _filteredCars = [];



  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('cars')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _cars = snapshot.docs.where((doc) => doc['availability'] == true).toList();
        _filteredCars = _cars;
      });
    });

  }


  Widget _buildGridView(){
    return GridView.builder(
      itemCount: _filteredCars.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => _buildItem(index),
    );
  }

  Widget _buildListView(){
    return ListView.builder(
      itemCount: _filteredCars.length,

      itemBuilder: (context, index) => _buildItem(index),
    );

  }

  Widget _buildItem(int index) {
    final car = _filteredCars[index];
    final hotelId = car.id;
    final user = FirebaseAuth.instance.currentUser;

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
          .collection('cars')
          .doc(hotelId)
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
          const SnackBar(

            content: Text('Car is already in wishlist!'),
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
        'id': hotelId,
      });

      // Show a snackbar to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(

          content: Text('Car added to wishlist!'),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailScreen(car),
          ),
        );
      },
      child: Card(
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
                tag:  car['imageurl'],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    height: 180.0,
                    width: 180.0,
                    image: AssetImage(car['imageurl']),
                    fit: BoxFit.cover,
                  ),
                ),
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
                      car['name'],
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 16.0,
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
                      car['address'],
                      style: GoogleFonts.bebasNeue(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        // letterSpacing: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              left: 5,
              child: RatingBar.builder(
                initialRating: 2.5,
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
                    });
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
                          car['price'].toString(),
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
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(2),
                ),


                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.luggage_outlined,size: 15,),
                              Text(
                                car['luggage'].toString(),
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          Row(
                            children: [
                              const Icon(Icons.person_2,size: 15,),
                              Text(
                                car['pass'].toString(),
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10,),
                          Row(
                            children: [
                              const Icon(Icons.door_front_door_outlined,size: 15,),
                              Text(
                                'b',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),



                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),






            Positioned(
              top: 50.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('wishlistcars')
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
                          height: 30,

                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(2),
                          ),

                          child: Row(
                            children: [
                              IconButton(


                                icon: Icon(


                                  Icons.favorite ,
                                  color: Colors.white,
                                ),
                                iconSize: 20,

                                onPressed: _isLoading
                                    ? null // Disable the button while loading
                                    : () => _wishlistHotel(hotelId, context),

                              ),


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
  }
  bool _isGridView = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Car Location",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredCars = _cars.where((car) {
                final name = car['address'] as String;
                final address = car['adrress'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
            _filteredCars.sort((a, b) => a['price'].compareTo(b['price']));
          },




        ),
        actions: [

          MaterialButton(
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            child: Icon(_isGridView ? Icons.view_list : Icons.view_module),

          )


        ],


      ),
      body: _filteredCars.isEmpty
          ? Center(child: Lottie.asset('assets/icons/36352-lion-running.json',height: 350))
          : _isGridView ? _buildGridView() : _buildListView(),

    );
  }
}

