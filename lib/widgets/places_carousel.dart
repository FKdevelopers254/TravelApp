import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastravel/widgets/safari_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../hoteladmin/edithotel.dart';
import '../hoteladmin/editroom.dart';
import '../screens/destination_screen.dart';
import '../screens/hotel_screen.dart';
import '../screens/ptv.dart';
import '../screens/safari_screen.dart';
import '../screens/test.dart';

class PlaceCarousel extends StatelessWidget {


  PlaceCarousel({Key? key}) : super(key: key);

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
                'Places to Visit',
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
               // onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariTab()}
               // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariTab(),),);},
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
          height: 205,

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('places')
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
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlacetoVisit(safari: document.id,)),
                      );
                    },
                    //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 419.0,
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
                                        Icon(Icons.favorite,color: Theme.of(context).primaryColor,),
                                        SizedBox(width: 5.0,),
                                        Text('76'.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),
                                        SizedBox(width: 25.0,),
                                        Icon(Icons.account_box,color: Theme.of(context).primaryColor,),
                                        Text('67'.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),

                                        SizedBox(width: 25.0,),
                                        Icon(Icons.plus_one,color: Theme.of(context).primaryColor,),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => EditRoomPage(docId: document.id,)),
                                            );
                                          },
                                          child: Text('Read More',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'Montserrat',
                                                fontSize: 15.0
                                            ),

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
                              width: MediaQuery.of(context).size.width + 5.0,
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
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,


                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          width: 175,
                                          child: Text('$address', style:  GoogleFonts.montserrat(
                                              color: Color(0xFFB2A9A9),
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 1.2,
                                            )



                                            ,),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text('$address'.toString(),
                                              style:

                                                GoogleFonts.montserrat(
                                                  color: Color(0xFFF76053),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.2,
                                                )

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
        ),
      ],
    );
  }
}



