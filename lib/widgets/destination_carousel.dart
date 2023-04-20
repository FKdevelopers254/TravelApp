import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:eastravel/screens/destination_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class DestinationCarousel extends StatefulWidget {

  final user = FirebaseAuth.instance.currentUser;
   DestinationCarousel({Key? key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Top Things to Do',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'In Kenya',
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
          height: 130,

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('placestovisit')
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

                  final address = document.get('address');


                  final imageurl = document.get('imageurl');















                  return GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationDetailScreen(document),),);},
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 130.0,
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
                                  tag: '$imageurl',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      height: 130.0,
                                      width: 130.0,
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

                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.searchLocation,
                                              size: 10.0,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5.0),
                                            Container(
                                              width: 100,
                                              child: Wrap(
                                                children: [
                                                  Text(
                                                    '$name',
                                                    style: GoogleFonts.inter(
                                                      color: Colors.white,
                                                      fontSize: 15.0,
                                                      fontWeight: FontWeight.w600,
                                                      //letterSpacing: 1.2,
                                                    ),
                                                    maxLines: 2,
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              FontAwesomeIcons.locationArrow,
                                              size: 10.0,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5.0),
                                            Text(
                                              '$address',
                                              style: GoogleFonts.abrilFatface(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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


class DestinationDetailScreen extends StatelessWidget {


  final DocumentSnapshot document;



  bool isLoading = false;

  DestinationDetailScreen(this.document);



  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _hotelname;




  void _submitForm() {


    _formKey.currentState?.save();

    _uploadData();

  }

  void _uploadData() async {

    final url = Uri.https('markiniltd.com', '/add.php');
    final response = await http.post(url,
        body: {'title': _title, 'description': _description});

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == 'success') {

        print('Succesfull');
      }

      else {
        print('Error');
      }
    } else {
      print('Error');
    }
  }




  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }











  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  DefaultTabController(
        length: 1,
        child: CustomScrollView(

          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
              pinned: true,
              stretch: true,
              onStretchTrigger: () {
                // Function callback for stretch
                return Future<void>.value();
              },
              expandedHeight: 300.0,
              shadowColor: Colors.red[100],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,

                ],
                centerTitle: true,
                title:  AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(document['name'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),



                  ],
                  pause: const Duration(milliseconds: 3000),

                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', fit: BoxFit.cover,),

                    CarouselSlider(
                      items: [
                        Image.asset(
                          document['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          document['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          document['imageurl'],
                          fit: BoxFit.cover,
                        ),
                      ],
                      options: CarouselOptions(
                        height: 355,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        enlargeCenterPage: false,
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        '${3} Pictures', // replace 3 with the actual count of images
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
            ),


            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[

                  Wrap(
                    children: [










                      Container(

                        child: ExpansionTile(
                          title:  Text('Amenities',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

                          children: [
                            Column(
                              children: [
                                Row(
                                  children: <Widget>[



                                    ElevatedButton(

                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.wifi,
                                          size: 21.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Wifi',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(

                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.spa,
                                          size: 21.0,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Spa',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.swimmingPool,
                                          size: 21.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Pool',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.wineBottle,
                                          size: 21.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Bar',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                  ],
                                ),

                                Row(
                                  children: <Widget>[



                                    ElevatedButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            FontAwesomeIcons.windows,
                                            size: 21.0,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Balcony',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.parking,
                                          size: 21.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Parking',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.wineGlassAlt,
                                          size: 21.0,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Restaurant',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        )

                                      ],
                                    ),

                                    ),

                                  ],
                                ),
                                SizedBox(height: 30,),
                              ],
                            ),


                          ],
                        ),
                      ),
                    ],

                  ),

















                  ExpansionTile(
                    title: Text('Description',style:GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

                    children: [

                      Stack(
                        children: <Widget>[
                          Container(



                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 300.0,
                                        child: Text(
                                          document['description'],
                                          style: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2000,
                                        ),
                                      ),

                                    ],
                                  ),




                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 30,),


                    ],),













                  // ListTiles++
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}