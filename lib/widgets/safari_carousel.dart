import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastravel/widgets/safari_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/destination_screen.dart';
import '../screens/hotel_screen.dart';
import '../screens/safari_screen.dart';
import '../screens/test.dart';


class SafariCarousel extends StatefulWidget {
  final List<Map<String, String>> safaris = [
    {

      'imageUrl': 'assets/images/radissonblu.jpg',
      'name': 'Kenya at a Glance',
      'location': 'Lake Nakuru,Maasai Mara',
      'country': 'Kenya',
      'price': '1545',
      'days': '5',
      'nights': '4',
      'hotelname': 'Flamingo Hill Lodge,Zebra Plains Mara Camp',
      'pps': '800',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'Day 1 Arrival in Nairobi',
    },
    {

      'imageUrl': 'assets/images/gondola.jpg',
      'name': 'WINGS OVER SAFARI',
      'location': 'Amboseli,Maasai Mara',
      'country': 'Kenya',
      'price': '2673',
      'days': '6',
      'nights': '5',
      'hotelname': 'Kilima Safari Camp',
      'pps': '1400',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
    {

      'imageUrl': 'assets/images/murano.jpg',
      'name': 'Glimpse of Kenya',
      'location': 'Samburu,Maasai Mara',
      'country': 'Nairobi,Kenya',
      'price': '175',
      'days': '6',
      'nights': '5',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
    {

      'imageUrl': 'assets/images/newdelhi.jpg',
      'name': 'Kenya Flying Budget Safari',
      'location': 'Nairobi,Kenya',
      'country': 'Nairobi,Kenya',
      'price': '175',
      'days': '6',
      'nights': '5',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
    {

      'imageUrl': 'assets/images/newyork.jpg',
      'name': 'Toyota Axio',
      'address': 'Nairobi,Kenya',
      'price': '540',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'Axio',

    },
    {

      'imageUrl': 'assets/images/olesereni.jpg',
      'namex': 'Toyota Axio',
      'location': 'Nairobi,Kenya',
      'country': 'Nairobi,Kenya',
      'price': '175',
      'days': '6',
      'nights': '5',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
  ];
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
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariTab(),),);},
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
          height: 300,

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
                        MaterialPageRoute(builder: (context) => SafariScreen(safari: document.id)),
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
                                  top: 40.0,
                                  left: 10.0,
                                  child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: EdgeInsets.all(5.0),
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
                                              : () => _wishlistHotel(document.id, context),

                                        ),


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
                                  ),
                                ),

                                Positioned(
                                  top: 80.0,
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
                                            return Container();
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





