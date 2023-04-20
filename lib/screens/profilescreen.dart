import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'package:intl/intl.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:vibration/vibration.dart';





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import '../widgets/routes.dart';
import 'barcode_screen.dart';

import 'cardscreen.dart';
import 'safari_screen.dart';
import 'hotel_screen.dart';
import 'car_screen.dart';




import 'dart:convert';

import 'package:http/http.dart' as http;







import 'package:qr_code_scanner/qr_code_scanner.dart';






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
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
        ),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 70.0,

                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0,),bottomLeft: Radius.circular(75.0,)



                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0,left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 5,),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Text(
                        'My Wishlist',
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {

                        },
                        child: Lottie.asset('assets/icons/133390-hotel-pop-up.json',height: 50,)),
                    SizedBox(width: 5,),
                  ],
                ),


              ),


            ],
          ),

          TabBar(
            controller: tabController,
            indicatorColor: Theme.of(context).primaryColor.withOpacity(0.8),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            isScrollable: true,
            labelColor: Color(0xFF440206),
            unselectedLabelColor: Color(0xFF440206),
            tabs: const [
              Tab(
                child: Text(
                  'Hotels',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                ),
                ),
              ),
              Tab(
                child: Text(
                  'Safaris',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
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
                  'Settings',style: TextStyle(
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
              children:   <Widget>[

                HotelWishlist(),
                SafariWishlist(),
                CarWishlist(),
                CarWishlist(),

               // ImageLabelView(),
               // MapsRoutesExample(title: 'f',),

               //Row(children: [CustomCard('Earn Badge', ReadQrPage()),],),
               // TravelPlannerPage(),





             //   CustomCard('Barcode Scanning', BarcodeScannerView()),











              ],
            ),
          ),


        ],
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
      height: 600,

      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('wishlistsafaris')
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
                    //onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditHotelPage(docId: document.id,)),);},
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
                                             // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EditRoomPage(docId: document.id,)),);},
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
                            )

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


class HotelWishlist extends StatefulWidget {
  const  HotelWishlist({Key? key}) : super(key: key);

  @override
  State< HotelWishlist> createState() => _HotelWishlistState();
}

class _HotelWishlistState extends State< HotelWishlist> {
  final user = FirebaseAuth.instance.currentUser!;

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _hotels = [];
  List<DocumentSnapshot> _filteredHotels = [];


  void deleteHotel(String hotelId) {
    FirebaseFirestore.instance
        .collection('wishlisthotels')
        .doc(hotelId)
        .delete()
        .then((value) => print('Hotel deleted'))
        .catchError((error) => print('Failed to delete car: $error'));
  }



  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('wishlisthotels')
        .where('email', isEqualTo: user!.email)
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
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Hotel Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredHotels = _hotels.where((hotel) {
                final name = hotel['name'] as String;

                final address = hotel['name'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
          },




        ),
        actions: [


        ],


      ),
      body:_filteredHotels.isEmpty
          ? Center(child: CircularProgressIndicator())
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





          return InkWell(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Remove Hotel'),
                    content: Text('Are you sure you want to delete this hotel from your wishlist?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          deleteHotel(hotelId);
                          setState(() {
                            _hotels.remove(hotel);
                            _filteredHotels = _hotels;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotel['id'],),),);},
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
                    bottom: 35,
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
                    top: 5,
                    left: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: (){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('${hotel['name']}'),
                                        content: Text('Are you sure you want to remove ${hotel['name']}  from your wishlist?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              deleteHotel(hotelId);
                                              setState(() {
                                                _hotels.remove(hotel);
                                                _filteredHotels = _hotels;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete),color:Colors.red.shade900 ,),



                          ],
                        ),
                      ],
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


class SafariWishlist extends StatefulWidget {
  const SafariWishlist({Key? key}) : super(key: key);

  @override
  State<SafariWishlist> createState() => _SafariWishlistState();
}

class _SafariWishlistState extends State<SafariWishlist> {
  final user = FirebaseAuth.instance.currentUser!;

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _hotels = [];
  List<DocumentSnapshot> _filteredHotels = [];

  void deleteSafari(String hotelId) {
    FirebaseFirestore.instance
        .collection('wishlistsafaris')
        .doc(hotelId)
        .delete()
        .then((value) => print('Safari deleted'))
        .catchError((error) => print('Failed to delete Safari: $error'));
  }



  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('wishlistsafaris')
        .where('email', isEqualTo: user!.email)
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
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Safari Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredHotels = _hotels.where((hotel) {
                final name = hotel['name'] as String;
                final address = hotel['name'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
          },




        ),
        actions: [


        ],


      ),
      body:_filteredHotels.isEmpty
          ? Center(child: CircularProgressIndicator())
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






          return InkWell(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Safari'),
                    content: Text('Are you sure you want to delete this Safari from your wishlist?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          deleteSafari(hotelId);
                          setState(() {
                            _hotels.remove(hotel);
                            _filteredHotels = _hotels;
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariScreen(safari: hotel['id'],),),);},
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
                    bottom: 35,
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
                    top: 5,
                    left: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('${hotel['name']}'),
                                      content: Text('Are you sure you want to remove ${hotel['name']}  from your wishlist?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            deleteSafari(hotelId);
                                            setState(() {
                                              _hotels.remove(hotel);
                                              _filteredHotels = _hotels;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete),color:Colors.red.shade900 ,),



                          ],
                        ),
                      ],
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

class CarWishlist extends StatefulWidget {
  const CarWishlist({Key? key}) : super(key: key);

  @override
  State<CarWishlist> createState() => _CarWishlistState();
}

class _CarWishlistState extends State<CarWishlist> {
  final user = FirebaseAuth.instance.currentUser!;

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _cars = [];
  List<DocumentSnapshot> _filteredCars = [];

  void deleteCar(String carId) {
    FirebaseFirestore.instance
        .collection('wishlistcars')
        .doc(carId)
        .delete()
        .then((value) => print('Car deleted'))
        .catchError((error) => print('Failed to delete car: $error'));
  }



  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('wishlistcars')
        .where('email', isEqualTo: user!.email)
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _cars = snapshot.docs;
        _filteredCars = _cars;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Car Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredCars = _cars.where((hotel) {
                final name = hotel['name'] as String;
                final address = hotel['name'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
          },




        ),
        actions: [],


      ),
      body:_filteredCars.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 10,

        ),
        padding: const EdgeInsets.all(8),

        itemCount: _filteredCars.length,
        itemBuilder: (BuildContext content,int index){
          final car = _filteredCars[index];


          final carId = car.id;
          final user = FirebaseAuth.instance.currentUser;





          return InkWell(


              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CarScreen(car: car['id'],),),);},
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
                      tag: car['imageurl'],
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
                    bottom: 35,
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
                            car['address'],
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
                                '${car['price']} \$',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('${car['name']}'),
                                      content: Text('Are you sure you want to remove ${car['name']} from your wishlist?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            deleteCar(carId);
                                            setState(() {
                                              _cars.remove(car);
                                              _filteredCars = _cars;
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete),color:Colors.red.shade900 ,),



                          ],
                        ),
                      ],
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



class ReadQrPage extends StatefulWidget {
  @override
  _ReadQrPageState createState() => _ReadQrPageState();
}

class _ReadQrPageState extends State<ReadQrPage> {
  final fem=0.9;
  final ffem=0.9;
  final user = FirebaseAuth.instance.currentUser!;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;


  

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreatedd(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
     // if (scanData.code!.isNotEmpty)
        if (scanData.code != null && scanData.code!.isNotEmpty)

        {
        _addDataToFirebase(scanData.code!);
      }
    });
  }


  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isScanning && scanData.code != null && scanData.code!.isNotEmpty) {
        isScanning = true;
        _addDataToFirebase(scanData.code!);
        controller.pauseCamera();
        Vibration.vibrate(duration: 200);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('QR code scanned'),
              content: Text('The QR code has been successfully scanned.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    controller.resumeCamera();
                    isScanning = false;
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  bool isScanning = false;


  bool isSnackBarShown = false;

      Future<void> _addDataToFirebase(String qrData) async {
        CollectionReference badgesCollection =
        FirebaseFirestore.instance.collection('badges');

        // Check if a document with the same name field value already exists
        QuerySnapshot querySnapshot = await badgesCollection
            .where('name', isEqualTo: user.email!)
            .where('data', isEqualTo: qrData)

            .get();

        if (querySnapshot.docs.isNotEmpty) {
          if (!isSnackBarShown) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Data already exists in Firebase: $qrData')));
            isSnackBarShown = true;

            Navigator.pop(context);



          }
        } else {
          // Add a new document if one with the same name field value does not exist
          await badgesCollection.add({'data': qrData, 'name': user.email!});
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Added data to Firebase: $qrData')));
          isSnackBarShown = false;

          // Navigate to a new page showing only the data related to the user
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => UserBadgesPage(name: user.email!)));

          // Dispose the QRViewController and close the camera
          controller?.dispose();
        }
      }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 200,
                width: 200,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Hold the camera steady, and align the QR code within the frame.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Center(
            child:  AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: controller != null ? 0.0 : 1.0,
              child: Lottie.asset('assets/icons/qrcode.json',height: 70),
            ),
          ),
        ],
      ),
    );
  }
}







class UserBadgesPage extends StatelessWidget {
  final String name;
  UserBadgesPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('badges')
            .where('name', isEqualTo: name)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No badges found for $name'));
          }
          final fem=0.9;
          final ffem=0.9;

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return Container(
                // estatescardhorizontalfullVD2 (2:3991)
                margin:  EdgeInsets.fromLTRB(11, 0, 0, 10),
                padding:  EdgeInsets.fromLTRB(8, 8, 60, 8),
                width:  double.infinity,
                height:  156,
                decoration:  BoxDecoration (
                  color:  Color(0xfff5f4f7),
                  borderRadius:  BorderRadius.circular(25),
                ),
                child:
                Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      // shapei5n (I2:3991;344:2737)
                      margin:  EdgeInsets.fromLTRB(0, 0, 16, 0),
                      padding:  EdgeInsets.fromLTRB(8, 8, 8, 8),
                      width:  128,
                      height:  double.infinity,
                      decoration:  BoxDecoration (
                        color:  Color(0x14884af6),
                        borderRadius:  BorderRadius.circular(18),
                        image:  DecorationImage (
                          fit:  BoxFit.cover,
                          image:  AssetImage (
                              'assets/images/gondola.jpg'
                          ),
                        ),
                      ),
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // component8vhe (I2:3991;344:2740)
                            margin:  EdgeInsets.fromLTRB(0, 0, 0, 75),
                            width:  25,
                            height:  25,
                            child:
                            Image.network(
                              '[Image url]',
                              width:  25,
                              height:  25,
                            ),
                          ),
                          ClipRect(
                            // buttoncategorysquaretextsmallP (I2:3991;344:2739)
                            child:
                            BackdropFilter(
                              filter:  ImageFilter.blur (
                                sigmaX:  4,
                                sigmaY:  4,
                              ),
                              child:
                              Container(
                                padding:  EdgeInsets.fromLTRB(7, 7, 6, 4),
                                width:  90,
                                height:  24,
                                decoration:  BoxDecoration (
                                  color:  Color(0xaf1f4c6b),
                                  borderRadius:  BorderRadius.circular(8),
                                ),
                                child:
                                Container(
                                  // layoutxnk (I2:3991;344:2739;251:539)
                                  width:  double.infinity,
                                  height:  double.infinity,
                                  child:
                                  Text(
                                    '$name',
                                    style:  GoogleFonts.lato (

                                      fontSize:  8,
                                      fontWeight:  FontWeight.w500,
                                      height:  1.2,
                                      letterSpacing:  0.24,
                                      color:  Color(0xfff5f4f7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupn2redtt (US8BknLiwQPy7qUcWBn2RE)
                      margin:  EdgeInsets.fromLTRB(0, 8, 0, 12),
                      width:  110,
                      height:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // layoutWxg (I2:3991;344:2744)
                            margin:  EdgeInsets.fromLTRB(0, 0, 0, 47),
                            width:  double.infinity,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [

                                Container(

                                  // text2RE (I2:3991;344:2745)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                                  child:
                                  Text(
                                    data['data'],
                                    style:  GoogleFonts.lato (

                                      fontSize:  12*ffem,
                                      fontWeight:  FontWeight.w700,
                                      height:  1.5*ffem/fem,
                                      letterSpacing:  0.36*fem,
                                      color:  Color(0xff252b5c),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}








const String WEATHER_API_KEY = 'df27ad0a3b574e35884173304231403';

class WeatherData {
  final String location;
  final double temp;
  final String condition;
  final int humidity;
  final double precipitation;
  final double wind;

  WeatherData({
    required this.location,
    required this.temp,
    required this.condition,
    required this.humidity,

    required this.precipitation,
    required this.wind,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      location: json['location']['name'],
      temp: double.parse(json['current']['temp_c'].toString()),
      condition: json['current']['condition']['text'],
      humidity: int.parse(json['current']['humidity'].toString()),
      precipitation: double.parse(json['current']['precip_mm'].toString()),
      wind: double.parse(json['current']['wind_kph'].toString()),
    );
  }

  String get temperatureMessage {
    if (temp <= 15) {
      return 'It\'s too cold';
    } else if (temp <= 25) {
      return 'Moderate temperature';
    } else {
      return 'It\'s too hot';
    }
  }


  String get temperatureIcon {
    if (temp <= 15) {
      return '🥶';
    } else if (temp <= 25) {
      return '🙂';
    } else {
      return '🥵☀️';
    }
  }

  String get precipitationMessage {
    if (precipitation == 0) {
      return 'No rain expected';
    } else if (precipitation < 0.5) {
      return 'Expect some slight rain';
    }
    else if (precipitation < 4.0) {
      return 'Expect Moderate Rain';
    }
    else if (precipitation < 8.0) {
      return 'Expect Heavy Rain';
    }
    else if (precipitation >= 8.0) {
      return 'Expect Very Heavy Rain';
    }
    else{
      return 'Stay At Home';
    }
  }


  String get precipitationIcon {
    if (precipitation == 0) {
      return '☁️';
    } else if (precipitation < 0.5) {
      return '🌩️';
    }
    else if (precipitation < 4.0) {
      return '🌧️';
    }
    else if (precipitation < 8.0) {
      return '⛈️';
    }
    else if (precipitation >= 8.0) {
      return '🌪️';
    }
    else{
      return '🌪️⛈️🌧️🌩️';
    }
  }



  String get windMessage {
    if (wind == 0) {
      return 'Calm Wind';
    } else if (wind < 3.0) {
      return 'Expect some Light Air';
    }
    else if (wind < 7.0) {
      return 'Expect some Light Breeze';
    }
    else if (wind < 12.0) {
      return 'Expect some Gentle Breeze';
    }
    else if (wind < 18.0) {
      return 'Expect some Moderate Breeze';
    }
    else if (wind < 24.0) {
      return 'Expect some Fresh Breeze';
    }
    else if (wind < 31.0) {
      return 'Expect Strong Breeze';
    }
    else if (wind < 38.0) {
      return 'Expect Some Near Gale';
    }
    else if (wind < 46.0) {
      return 'Expect  Gale';
    }
    else if (wind < 54.0) {
      return 'Expect Strong Gale';
    }
    else if (wind < 63.0) {
      return 'Expect Whole Gale';
    }
    else if (wind < 75.0) {
      return 'Expect Storm Force';
    }
    else if (wind >= 75.0) {
      return 'Expect Hurricane';
    }
    else{
      return 'Stay At Home';
    }
  }


  String get windIcon {
    if (wind == 0) {
      return 'assets/icons/nowind.json';
    } else if (wind < 3.0) {
      return 'assets/icons/calmwind.json';
    }
    else if (wind < 7.0) {
      return 'assets/icons/calmwind.json';
    }
    else if (wind < 12.0) {
      return'assets/icons/moderatewind.json';
    }
    else if (wind < 18.0) {
      return 'assets/icons/moderatewind.json';
    }
    else if (wind < 24.0) {
      return 'assets/icons/moderatewind.json';
    }
    else if (wind < 31.0) {
      return 'assets/icons/strongwind.json';
    }
    else if (wind < 38.0) {
      return 'assets/icons/strongwind.json';
    }
    else if (wind < 46.0) {
      return 'assets/icons/strongwind.json';
    }
    else if (wind < 54.0) {
      return 'assets/icons/strongwind.json';
    }
    else if (wind < 63.0) {
      return 'assets/icons/strongwind.json';
    }
    else if (wind < 75.0) {
      return 'assets/icons/strongwind.json';
    }
    else if (wind >= 75.0) {
      return 'assets/icons/strongwind.json';
    }
    else{
      return 'assets/icons/strongwind.json';
    }
  }
}




class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  FlutterTts _tts = FlutterTts();
  late Future<WeatherData> _weatherData;
  late String _selectedRegion;
  final stt.SpeechToText _speech = stt.SpeechToText();
  String? _voiceInput;

  List<String> _regions = [
    'Nairobi',
    'Mombasa',
    'Kisumu',
    'Eldoret',
    'Malindi',
    'Nakuru',
    'Thika',
    'Machakos',
    'Meru',
    'Kitale',
    'Embu',
    'Garissa',
    'Nyeri',
    'Kakamega',
    'Kilifi',
    'Wajir',
    'Nyali',
    'Bungoma',
    'Kericho',
    'Naivasha',
    'Kapenguria',
    'Nanyuki',
    'Mumias',
    'Voi',
    'Kabarnet',
    'Siaya',
    'Isiolo',
    'Narok',
    'Kitui',
    'Kajiado',
    'Kimilili',
    'Mandera',
    'Homa Bay',
    'Lamu',
    'Lodwar',
    'Marsabit',
    'Moyale',
    'Taveta',
    'Busia',
    'Chuka',
    'Kwale',
    'Rongai',
    'Kerugoya',
    'Bomet',
    'Luanda',
    'Kapsabet',
    'Hola',
    'Chavakali',
    'Kinango',
    'Mwingi',
    'Oyugis',
    'Litein',
    'Molo',
    'Maragua',
    'Kabati',
    'Kangundo-Tala',
    'Ngong',
    'Kapsowar',
    'Kipini',
    'Ahero',
    'Wundanyi',
    'Namanga',
    'Turkana',
    'Tsavo',
    'Amboseli',
    'Samburu',
  ];

  @override
  void initState() {
    super.initState();
    _selectedRegion = _regions[0];
    _weatherData = _fetchWeatherData(_selectedRegion);
    _initSpeechRecognition();
  }

  void _handleVoiceInput() {
    if (_voiceInput != null) {
      String normalizedInput = _voiceInput!.toLowerCase();
      for (String region in _regions) {
        if (normalizedInput.contains(region.toLowerCase())) {
          _selectedRegion = region;
          _voiceInput = null;
          _weatherData = _fetchWeatherData(_selectedRegion);
          break;
        }
      }
    }
  }
  void _onVoiceInputButtonPressed() {
    // Code to trigger voice input recognition
    // ...

    if (_voiceInput != null) {
      String normalizedInput = _voiceInput!.toLowerCase();
      for (String region in _regions) {
        if (normalizedInput.contains(region.toLowerCase())) {
          _selectedRegion = region;
          _voiceInput = null;
          _weatherData = _fetchWeatherData(_selectedRegion);
          break;
        }
      }
    }
  }



  void _initSpeechRecognition() async {
    bool isAvailable = await _speech.initialize();
    if (isAvailable) {
      _speech.listen(onResult: (result) {
        setState(() {
          _voiceInput = result.recognizedWords;
        });
      });
    }
  }
  Future<WeatherData> _fetchWeatherData(String region) async {
    final response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=$WEATHER_API_KEY&q=$region,Kenya&aqi=no'));
    if (response.statusCode == 200) {
      return WeatherData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }


  void _processVoiceInput(String input) {
    String normalizedInput = input.toLowerCase();
    for (String region in _regions) {
      if (normalizedInput.contains(region.toLowerCase())) {
        setState(() {
          _selectedRegion = region;
          _weatherData = _fetchWeatherData(_selectedRegion);
        });
        break;
      }
    }
  }




  bool _isListening = false;

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        setState(() {
          _voiceInput = result.recognizedWords;
        });
        _processVoiceInput;
      },

    );
    setState(() {
      _isListening = true;
    });
  }






  void _speak(String text) {
    _tts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: DropdownButton<String>(
        value: _selectedRegion,
        onChanged: (String? newValue) {
          setState(() {
            _selectedRegion = newValue!;
            _weatherData = _fetchWeatherData(_selectedRegion);
          });
        },
        items: _regions
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),actions: [
        IconButton(
          icon: Icon(Icons.mic),
            onPressed: () {
              if (_speech.isAvailable) {
                _speech.listen(
                  onResult: (result) {
                    setState(() {
                      _voiceInput = result.recognizedWords;
                      String normalizedInput = _voiceInput!.toLowerCase();
                      for (String region in _regions) {
                        if (normalizedInput.contains(region.toLowerCase())) {
                          _selectedRegion = region;
                          _voiceInput = null;
                          _weatherData = _fetchWeatherData(_selectedRegion);

                          break;
                        }
                      }
                    });
                  },
                );
              }

              _startListening;

              _speak('Please speak now');

            },
        ),


      ],),
      body:    FutureBuilder<WeatherData>(
        future: _weatherData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      snapshot.data!.location,
                      style: GoogleFonts.abrilFatface(fontSize: 20),
                    ),
                  ),
                ),



               Row(
                 children: [

                   //Temp
                   Card(
                     child: Container(

                       height: 150,
                       child: Column(
                         children: [
                           Row(


                             children: [

                               Text(
                                 'Temp',
                                 style: GoogleFonts.abrilFatface(fontSize: 20),
                               ),

                             ],
                             crossAxisAlignment: CrossAxisAlignment.center,
                           ),
                           Row(

                             children: [
                               Text(
                                 '${snapshot.data!.temp}°C',
                                 style: GoogleFonts.abrilFatface(fontSize: 20),
                               ),
                               Container(


                                 child: Lottie.asset('assets/icons/temp.json',height: 70,),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20)
                                 ),
                                 height: 40,),
                             ],
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           ),
                           Row(
                             children: [
                               Text(
                                 snapshot.data!.temperatureMessage,
                                 style: GoogleFonts.abrilFatface(fontSize: 20),
                               ),
                             ],
                           ),
                           Row(
                             children: [
                               Text(
                                 snapshot.data!.temperatureIcon,
                                 style: GoogleFonts.abrilFatface(fontSize: 20),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),




                   //Humidity
                   Card(
                     child: Container(


                       child: Column(
                         children: [
                           Row(


                             children: [

                               Text(
                                 'Humidity',
                                 style: GoogleFonts.abrilFatface(fontSize: 20),
                               ),

                             ],
                             crossAxisAlignment: CrossAxisAlignment.center,
                           ),
                           Row(

                             children: [
                               Text(
                                 '${snapshot.data!.humidity}%',
                                 style: GoogleFonts.abrilFatface(fontSize: 20),
                               ),
                               Container(


                                 child: Lottie.asset('assets/icons/72236-humidly.json',height: 70,),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20)
                                 ),
                                 height: 40,),
                             ],
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           ),
                           Row(
                             children: [

                             ],
                           )
                         ],
                       ),
                     ),
                   ),
                 ],
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               ),
                Row(
                  children: [

                    //Rain
                    Card(
                      child: Container(

                        height: 100,
                        child: Column(
                          children: [
                            Row(


                              children: [

                                Text(
                                  'Rain',
                                  style: GoogleFonts.abrilFatface(fontSize: 20),
                                ),

                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            Row(

                              children: [
                                Text(
                                  '${snapshot.data!.precipitation}%',
                                  style: GoogleFonts.abrilFatface(fontSize: 20),
                                ),
                                Container(


                                  child: Text(
          '${snapshot.data!.precipitationIcon}',
          style: GoogleFonts.abrilFatface(fontSize: 20),
          ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  height: 40,),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data!.precipitationMessage,
                                  style: GoogleFonts.abrilFatface(fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    //Clouds
                    Card(
                      child: Container(

                        height: 100,
                        child: Column(
                          children: [
                            Row(


                              children: [

                                Text(
                                  'Clouds',
                                  style: GoogleFonts.abrilFatface(fontSize: 20),
                                ),

                              ],
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                            Row(

                              children: [
                                Text(
                                  '${snapshot.data!.condition}',
                                  style: GoogleFonts.abrilFatface(fontSize: 20),
                                ),

                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data!.windMessage,
                                  style: GoogleFonts.abrilFatface(fontSize: 15),
                                ),
                                Container(


                                  child: Lottie.asset('${snapshot.data!.windIcon}'),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  height: 40,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),


                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )











              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      ),


    );
  }
}







class TravelPlannerPage extends StatefulWidget {

  @override
  _TravelPlannerPageState createState() => _TravelPlannerPageState();
}

class _TravelPlannerPageState extends State<TravelPlannerPage> {
  final _formKey = GlobalKey<FormState>();
  late String _location;
  late String loc;
  late int _days;


  DateTime checkinDate = DateTime.now();
  DateTime checkoutDate = DateTime.now().add(Duration(days: 1));

  final _locationController = TextEditingController();



  @override
  void dispose() {
    // Make sure to dispose the controller when the widget is disposed
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _locationController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Type your destination',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),


                  ),
                  suggestionsCallback: (pattern) {
                    // This function is called every time the user types a character in the field
                    // It should return a list of suggestions based on the current input pattern
                    List<String> suggestions = [];
                    for (String city in ['nairobi', 'maasaiMara', 'nakuru', 'mombasa',]) {
                      if (city.startsWith(pattern.toLowerCase())) {
                        suggestions.add(city);
                      }
                    }
                    return suggestions;
                  },
                  itemBuilder: (context, String suggestion) {
                    // This function is called to build each suggestion item
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  onSuggestionSelected: (String suggestion) {
                    // This function is called when the user selects a suggestion
                    // You can use it to set the value of the field to the selected suggestion
                    _location = suggestion;
                    _locationController.text = suggestion;
                  },
                ),



                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('Check-in Date'),
                        ElevatedButton(
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: checkinDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                            );
                            if (date != null) {
                              setState(() {
                                checkinDate = date;
                              });
                            }
                          },
                          child: Text('${DateFormat('MM/dd/yyyy').format(checkinDate)}'),
                        ),
                      ],
                    ),
                   // SizedBox(height: 16.0),
                    Column(
                      children: [
                        Text('Check-out Date'),
                        MaterialButton(
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: checkoutDate,
                              firstDate: checkinDate.add(Duration(days: 1)),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                            );
                            if (date != null) {
                              setState(() {
                                checkoutDate = date;
                              });
                            }
                          },
                          child: Text('${DateFormat('MM/dd/yyyy').format(checkoutDate)}'),
                        ),
                      ],
                    ),
                  ],
                ),



                SizedBox(height: 16.0),
                Text('Number of days'),
                Text('${checkoutDate.difference(checkinDate).inDays}'),
                SizedBox(height: 16.0),
                MaterialButton(

                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final hotels = await _getHotels();
                      final cars = await _getCars();
                      final placestovisit = await _getPlaces();
                      final parks = await _getParks();
                      final days= checkoutDate.difference(checkinDate).inDays;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPagee(
                            hotels: hotels,
                            cars: cars,
                            placestovisit: placestovisit,
                            parks: parks,


                          ),
                        ),
                      );
                    }
                  },

                  child: Text('Search'),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _getHotels() async {
// Query the Firebase collection for hotels in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('hotels')

       // .where('address', isEqualTo: _location.toString())

        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of hotel data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> _getCars() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('cars')
       // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }


  Future<List<Map<String, dynamic>>> _getPlaces() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('placestovisit')
       // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }




  Future<List<Map<String, dynamic>>> _getParks() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('parks')
    // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }




}





class Travelplanner extends StatefulWidget {


  Travelplanner({Key? key}) : super(key: key);



  @override
  State<Travelplanner> createState() => _TravelplannerState();
}



class _TravelplannerState extends State<Travelplanner> {

  final _formKey = GlobalKey<FormState>();
  late String _location;
  late String loc;
  late int _days;


  DateTime checkinDate = DateTime.now();
  DateTime checkoutDate = DateTime.now().add(Duration(days: 1));

  final _locationController = TextEditingController();








  double fem=0.7;
  double ffem= 0.7;

  @override
  void dispose() {
    // Make sure to dispose the controller when the widget is disposed
    _locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      // attractiondetailspagecQ3 (10:3372)
      padding:  EdgeInsets.fromLTRB(21*fem, 77.29*fem, 16*fem, 39*fem),
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        image:  DecorationImage (
          fit:  BoxFit.cover,
          image:  AssetImage('assets/images/kozi3.jpg'),
        ),
      ),
      child:
      Card(
        color: Colors.black.withOpacity(0.2),

        child: Column(
          children: [
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [

                Text(
                  // nordiccottageSnP (10:3374)
                  'Travel Planner',
                  style:  GoogleFonts.andika(

                    fontSize:  42*ffem,
                    fontWeight:  FontWeight.w400,
                    height:  1.61*ffem/fem,
                    color:  Color(0xffffffff),
                  ),
                ),
                Container(
                  // bluelagoondrivefromreykjavkthe (10:3375)
                  margin:  EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 15*fem),
                  constraints:  BoxConstraints (
                    maxWidth:  365*fem,
                  ),
                  child:
                  Text(
                    'Blue Lagoon Drive from Reykjavík, the capital of Iceland, to the southeast for about an hour, you can reach Blue Lagoon, the famous',
                    style:  GoogleFonts.poppins(

                      fontSize:  16*ffem,
                      fontWeight:  FontWeight.w400,
                      height:  1.6449999809*ffem/fem,
                      color:  Color(0xccffffff),
                    ),
                  ),
                ),
                Container(
                  // autogroup52kd7X9 (LzhV48jtttg2uB8sm252KD)
                  margin:  EdgeInsets.fromLTRB(3.33*fem, 0*fem, 7*fem, 36*fem),
                  width:  double.infinity,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // group128bhD (10:3376)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 5.67*fem, 1*fem),
                        width:  23.33*fem,
                        height:  12.67*fem,
                        child:
                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                      ),
                      Container(
                        // group129TjR (10:3377)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 5.67*fem, 1*fem),
                        width:  13.33*fem,
                        height:  12.67*fem,
                        child:
                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                      ),
                      Container(
                        // group130M47 (10:3378)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 5.67*fem, 1*fem),
                        width:  13.33*fem,
                        height:  12.67*fem,
                        child:
                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                      ),
                      Container(
                        // group131qEB (10:3379)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 5.67*fem, 1*fem),
                        width:  13.33*fem,
                        height:  12.67*fem,
                        child:
                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                      ),
                      Container(
                        // group1326A7 (10:3380)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 11.33*fem, 1*fem),
                        width:  13.33*fem,
                        height:  12.67*fem,
                        child:
                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                      ),
                      Container(
                        // Afm (10:3381)
                        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 1*fem, 0*fem),
                        child:
                        Text(
                          '4.79',
                          style:  GoogleFonts.poppins(

                            fontSize:  14*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.6449999128*ffem/fem,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        // reviews3jZ (10:3383)
                        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 58*fem, 0*fem),
                        child:
                        Text(
                          '(78 reviews)',
                          style:  GoogleFonts.poppins(

                            fontSize:  14*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.6449999128*ffem/fem,
                            color:  Color(0xccffffff),
                          ),
                        ),
                      ),
                      Container(
                        // seereviewsiqh (10:3382)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                        child:
                        Text(
                          'See reviews',
                          style:  GoogleFonts.poppins(

                            fontSize:  14*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.6449999128*ffem/fem,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroup54v7ZbR (LzhVdXwuguNmpjCCxD54v7)
                  margin:  EdgeInsets.fromLTRB(3*fem, 0*fem, 7*fem, 0*fem),
                  width:  double.infinity,
                  height:  54*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // autogroupfmudf8f (LzhVocVT2RpNcgaBf3fMuD)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
                        width:  168*fem,
                        height:  double.infinity,
                        decoration:  BoxDecoration (
                          color:  Color(0x19ffffff),
                          borderRadius:  BorderRadius.circular(41*fem),
                        ),
                        child:
                        Center(
                          child:
                          Text(
                            'Enter Location',
                            style:  GoogleFonts.poppins(

                              fontSize:  16*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.6449999809*ffem/fem,
                              color:  Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupmhnsskX (LzhVvGy1j92z5iCHWaMHns)
                        width:  168*fem,
                        height:  double.infinity,
                        decoration:  BoxDecoration (
                          color:  Color(0xffffffff),
                          borderRadius:  BorderRadius.circular(41*fem),
                        ),
                        child:
                        Center(
                          child:
                          Text(
                            'We Plan',
                            style:  GoogleFonts.poppins(

                              fontSize:  16*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.6449999809*ffem/fem,
                              color:  Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
            SizedBox(height:20),

            Container(

              // autogroupfzgxPp7 (LzhUptcxmvrVZXqVyWFZgX)
              //  margin:  EdgeInsets.fromLTRB(4.5*fem, 0*fem, 0*fem, 462*fem),
              width:  500.10*fem,
              height:  490.10*fem,
              child:
              Column(
                children: [
                  // Lottie.asset('assets/icons/travelone.json'),




                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            TypeAheadFormField(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: _locationController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurple),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Type your destination',
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                ),


                              ),
                              suggestionsCallback: (pattern) {
                                // This function is called every time the user types a character in the field
                                // It should return a list of suggestions based on the current input pattern
                                List<String> suggestions = [];
                                for (String city in ['nairobi', 'maasaiMara', 'nakuru', 'mombasa',]) {
                                  if (city.startsWith(pattern.toLowerCase())) {
                                    suggestions.add(city);
                                  }
                                }
                                return suggestions;
                              },
                              itemBuilder: (context, String suggestion) {
                                // This function is called to build each suggestion item
                                return ListTile(

                                  title: Text(suggestion, style: TextStyle(color: Colors.black)),
                                  tileColor: Colors.transparent,
                                );
                              },
                              onSuggestionSelected: (String suggestion) {
                                // This function is called when the user selects a suggestion
                                // You can use it to set the value of the field to the selected suggestion
                                _location = suggestion;
                                _locationController.text = suggestion;
                              },
                            ),



                            SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text('Check-in Date',style: TextStyle(color: Colors.white),),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final date = await showDatePicker(
                                          context: context,
                                          initialDate: checkinDate,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now().add(Duration(days: 365)),
                                        );
                                        if (date != null) {
                                          setState(() {
                                            checkinDate = date;
                                          });
                                        }
                                      },
                                      child: Text('${DateFormat('MM/dd/yyyy').format(checkinDate)}'),
                                    ),
                                  ],
                                ),
                                // SizedBox(height: 16.0),
                                Column(
                                  children: [
                                    Text('Check-out Date',style: TextStyle(color: Colors.white),),
                                    MaterialButton(
                                      onPressed: () async {
                                        final date = await showDatePicker(
                                          context: context,
                                          initialDate: checkoutDate,
                                          firstDate: checkinDate.add(Duration(days: 1)),
                                          lastDate: DateTime.now().add(Duration(days: 365)),
                                        );
                                        if (date != null) {
                                          setState(() {
                                            checkoutDate = date;
                                          });
                                        }
                                      },
                                      child: Card(child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('${DateFormat('MM/dd/yyyy').format(checkoutDate)}',style: TextStyle(color: Colors.blue),),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),



                            SizedBox(height: 16.0),
                            Text('Number of days',style: TextStyle(color: Colors.white),),
                            Text('${checkoutDate.difference(checkinDate).inDays}',style: TextStyle(color: Colors.white),),
                            SizedBox(height: 16.0),
                            MaterialButton(

                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  final hotels = await _getHotels();
                                  final cars = await _getCars();
                                  final placestovisit = await _getPlaces();
                                  final parks = await _getParks();
                                  final days= checkoutDate.difference(checkinDate).inDays;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultsPagee(
                                        hotels: hotels,
                                        cars: cars,
                                        placestovisit: placestovisit,
                                        parks: parks,


                                      ),
                                    ),
                                  );
                                }
                              },

                              child: Text('Search'),
                              color: Colors.blue,
                            ),





                          ],
                        ),
                      ),
                    ),
                  )





                ],
              ),
            ),
          ],
        ),
      ),
    );
  }




  Future<List<Map<String, dynamic>>> _getHotels() async {
// Query the Firebase collection for hotels in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('hotels')

    // .where('address', isEqualTo: _location.toString())

        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of hotel data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> _getCars() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('cars')
    // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }


  Future<List<Map<String, dynamic>>> _getPlaces() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('placestovisit')
    // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }




  Future<List<Map<String, dynamic>>> _getParks() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('parks')
    // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }





}

class TravelP extends StatefulWidget {
  const TravelP({Key? key}) : super(key: key);

  @override
  State<TravelP> createState() => _TravelPState();
}

class _TravelPState extends State<TravelP> {
  final _formKey = GlobalKey<FormState>();
  late String _location;
  late String loc;
  late int _days;


  DateTime checkinDate = DateTime.now();
  DateTime checkoutDate = DateTime.now().add(Duration(days: 1));

  final _locationController = TextEditingController();








  double fem=0.7;
  double ffem= 0.7;

  @override
  void dispose() {
    // Make sure to dispose the controller when the widget is disposed
    _locationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _locationController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Travel Planner,type in your destination',

                fillColor: Colors.grey[200],
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final hotels = await _getHotels();
                      final cars = await _getCars();
                      final placestovisit = await _getPlaces();
                      final parks = await _getParks();
                      final days= checkoutDate.difference(checkinDate).inDays;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPagee(
                            hotels: hotels,
                            cars: cars,
                            placestovisit: placestovisit,
                            parks: parks,


                          ),
                        ),
                      );
                    }
                  },
                ),
              ),


            ),
            suggestionsCallback: (pattern) {
              // This function is called every time the user types a character in the field
              // It should return a list of suggestions based on the current input pattern
              List<String> suggestions = [];
              for (String city in ['nairobi', 'maasaiMara', 'nakuru', 'mombasa',]) {
                if (city.startsWith(pattern.toLowerCase())) {
                  suggestions.add(city);
                }
              }
              return suggestions;
            },
            itemBuilder: (context, String suggestion) {
              // This function is called to build each suggestion item
              return ListTile(

                title: Text(suggestion, style: TextStyle(color: Colors.black)),
                tileColor: Colors.transparent,
              );
            },
            onSuggestionSelected: (String suggestion) {
              // This function is called when the user selects a suggestion
              // You can use it to set the value of the field to the selected suggestion
              _location = suggestion;
              _locationController.text = suggestion;
            },
          ),








        ],
      ),
    );
  }





  Future<List<Map<String, dynamic>>> _getHotels() async {
// Query the Firebase collection for hotels in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('hotels')

    // .where('address', isEqualTo: _location.toString())

        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of hotel data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> _getCars() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('cars')
    // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> _getPlaces() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('placestovisit')
    // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> _getParks() async {
// Query the Firebase collection for cars in the selected location
    final snapshot = await FirebaseFirestore.instance
        .collection('parks')
    // .where('address', isEqualTo: _location)
        .where('address', isGreaterThanOrEqualTo: _location.toLowerCase())
        .where('address', isLessThan: _location.toLowerCase() + 'z')
        .orderBy('address')
        .limit(5)
        .get();
// Return a list of car data
    return snapshot.docs.map((doc) => doc.data()).toList();
  }



}

















class ResultsPagee extends StatefulWidget {

  final List<Map<String, dynamic>> hotels;
  final List<Map<String, dynamic>> cars;
  final List<Map<String, dynamic>> placestovisit;
  final List<Map<String, dynamic>> parks;

  ResultsPagee({required this.hotels, required this.cars, required this.placestovisit, required this.parks});

  @override
  _ResultsPageeState createState() => _ResultsPageeState();
}

class _ResultsPageeState extends State<ResultsPagee> {
  List<Map<String, dynamic>> selectedHotels = [];
  List<Map<String, dynamic>> selectedCars = [];
  List<Map<String, dynamic>> selectedPlacestovisit = [];
  List<Map<String, dynamic>> selectedParks = [];

  void _calculateTotal() {

    int total = 0;
    for (final hotel in selectedHotels) {
      total += hotel['price'] as int;
    }
    for (final car in selectedCars) {
      total += car['price'] as int;
    }

    for (final park in selectedPlacestovisit) {
      total += park['usd'] as int;
    }
    for (final park in selectedParks) {
      total += park['parkfeesusd'] as int;
    }


    for (final park in selectedParks) {
      total += park['vehiclefeesusd'] as int;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Total Cost'),
        content: Text('The total cost is $total'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' '),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            ExpansionTile(title: Row(
              children: [
                Icon(Icons.holiday_village,color: Colors.green,),
                AnimatedTextKit(
                  animatedTexts: [

                    TyperAnimatedText('Hotels',textStyle: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 20)),



                  ],
                  pause: const Duration(milliseconds: 7000),

                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
              ],
            ), children: [

              ...widget.hotels.map(
                    (hotel) => CheckboxListTile(

                  title: Text(hotel['name']),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.monetization_on,color: Colors.green,),
                          Text('${hotel['price']}\\night',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.yellow.shade500,),
                          Text('${hotel['rating']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.thumb_up,color: Colors.blue.shade500,),
                          Text('${hotel['likeCount']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                  value: selectedHotels.contains(hotel),
                  onChanged: (checked) {
                    setState(() {
                      if (checked!) {
                        selectedHotels.add(hotel);
                      } else {
                        selectedHotels.remove(hotel);
                      }
                    });
                  },
                  // secondary: Image.network(hotel['imageurl'], width: 48.0, height: 48.0),
                  secondary: Image.asset(hotel['imageurl'], width: 48.0, height: 48.0),
                ),
              ),



            ],),
            ExpansionTile(title: Row(
              children: [
                Icon(Icons.car_rental_rounded,color: Colors.green,),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Vehicles',textStyle: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 20)),



                  ],
                  pause: const Duration(milliseconds: 7000),

                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
              ],
            ), children: [...widget.cars.map((car) => CheckboxListTile(
                  title: Text(car['name'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.monetization_on,color: Colors.green,),
                          Text('${car['price']}\\day',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.filter_alt,color: Colors.green,),
                          Text('${car['engine']} ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.car_rental_rounded,color: Colors.green,),
                          Text('${car['type']} ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                  value: selectedCars.contains(car),
                  onChanged: (checked) {
                    setState(() {
                      if (checked!) {
                        selectedCars.add(car);
                      } else {
                        selectedCars.remove(car);
                      }
                    });
                  },

                  secondary: Image.asset(car['imageurl'], width: 48.0, height: 48.0),
                ),),],),
            ExpansionTile(title: Row(
              children: [
                Icon(Icons.local_airport_rounded,color: Colors.green,),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('PLaces To Visit',textStyle: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 20)),



                  ],
                  pause: const Duration(milliseconds: 7000),

                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
              ],
            ),children: [...widget.placestovisit.map(
                  (placestovisi) => CheckboxListTile(
                title: Text(placestovisi['name']),
                subtitle: Row(
                  children: [
                    Icon(Icons.monetization_on,color: Colors.green,),
                    Text('${placestovisi['usd']} Entrance Fee',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                  ],
                ),
                value: selectedPlacestovisit.contains(placestovisi),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      selectedPlacestovisit.add(placestovisi);
                    } else {
                      selectedPlacestovisit.remove(placestovisi);
                    }
                  });
                },
                secondary: Image.asset(placestovisi['imageurl'], width: 48.0, height: 48.0),
              ),
            ),],),
            ExpansionTile(title: Row(
              children: [
                Icon(Icons.park,color: Colors.green,),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Parks',textStyle: GoogleFonts.bebasNeue(color: Colors.black,fontSize: 20)),



                  ],
                  pause: const Duration(milliseconds: 7000),

                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
              ],
            ),children: [...widget.parks.map(
                  (park) => CheckboxListTile(
                title: Text(park['name']),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.monetization_on,color: Colors.green,),
                        Text('${park['parkfeesusd']}Park Fee',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.car_rental_rounded,color: Colors.blue,),
                        Text('${park['vehiclefeesusd']} Fees',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ],
                ),
                value: selectedParks.contains(park),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      selectedParks.add(park);
                    } else {
                      selectedParks.remove(park);
                    }
                  });
                },
                secondary: Image.asset(park['imageurl'], width: 48.0, height: 48.0),
              ),
            ),],),








            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateTotal,
              child: Text('Calculate Total'),
            ),
          ],
        ),
      ),
    );
  }
}

































