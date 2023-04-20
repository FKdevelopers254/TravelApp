import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:eastravel/screens/profilescreen.dart';

import 'package:eastravel/widgets/roadtrip_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';


import '../widgets/car_carousel.dart';
import '../widgets/destination_carousel.dart';
import '../widgets/hotel_carousel.dart';
import '../widgets/places_carousel.dart';
import '../widgets/safari_carousel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()
        ),
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                GestureDetector(


                  child:  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),

                    ),
                    child: GestureDetector(
                      onLongPress: (){FirebaseAuth.instance.signOut();},
                     // onLongPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  PaymentPage()));},
                    //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  PaymentPage()));},
                      child: Column(
                        children: [
                          AnimatedTextKit(
                            animatedTexts: [

                              TyperAnimatedText(user.email!,textStyle: GoogleFonts.abrilFatface(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 17)),
                              TyperAnimatedText('EAS SAFARIS',textStyle: GoogleFonts.abrilFatface(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 28,letterSpacing: 1.5)),
                              TyperAnimatedText('Book Hotels',textStyle: GoogleFonts.abrilFatface(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),

                              TyperAnimatedText('Book Travels',textStyle: GoogleFonts.abrilFatface(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
                              TyperAnimatedText('Car Hire',textStyle: GoogleFonts.abrilFatface(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),


                            ],
                            pause: const Duration(milliseconds: 5000),

                            stopPauseOnTap: true,
                            repeatForever: true,
                          ),

                 // child:  Text('EAS SAFARIS',style: GoogleFonts.sassyFrass(fontWeight: FontWeight.bold,fontSize: 28,letterSpacing: 1.5)
                            //),
                        ],
                      ),
                    ),
                  ),
                  // onTap: Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen())),
                ),


              ],),

              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: GestureDetector(
                     onTap: (){FirebaseAuth.instance.signOut();},
                  // onLongPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const BirdApp()));},
                    child:





                    Lottie.asset('assets/icons/96833-login.json',height: 50,),
              ),)

            ],),
          ),



          const TravelP(),


          DestinationCarousel(),




          HotelCarousel(),



          SafariCarousel(),

          CarCarousel(),


          PlaceCarousel(),

          RoadTripCarousel(),




          const SizedBox(height: 60.0),
        ],
      ),

    );
  }
}
