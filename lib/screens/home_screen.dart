import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastravel/screens/placestovisit.dart';
import 'package:eastravel/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../caradmin/bottombar.dart';
import '../widgets/mainpage.dart';

import '../widgets/mpesa2.dart';
import '../widgets/car_carousel.dart';
import '../widgets/destination_carousel.dart';
import '../widgets/hotel_carousel.dart';
import '../widgets/places_carousel.dart';
import '../widgets/safari_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> hotels = [
    {

      'imageUrl': 'assets/images/radissonblu.jpg',
      'name': 'Radisson Blu Hotel',
      'address': 'Nairobi,Kenya',
      'price': '175',
    },
    {

      'imageUrl': 'assets/images/kenyacomfort3.jpg',
      'name': 'Kenya Comfort Suites',
      'address': 'Nairobi,Kenya',
      'price': '300',
    },
    {

      'imageUrl': 'assets/images/olesereni.jpg',
      'name': 'Ole Sereni-Nairobi ',
      'address': 'Nairobi,Kenya',
      'price': '140',
    },
    {

      'imageUrl': 'assets/images/fourpoints.jpg',
      'name': 'Four Points Sheraton',
      'address': 'Nairobi,Kenya',
      'price': '200',
    },
    {

      'imageUrl': 'assets/images/sarovastanley.jpg',
      'name': 'Sarova Stanley',
      'address': 'Nairobi,Kenya',
      'price': '540',
    },
    {

      'imageUrl': 'assets/images/kozi3.jpg',
      'name': 'Kozi Suites Nairobi',
      'address': 'Nairobi,Kenya',
      'price': '124',
    },
  ];


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
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>  PaymentPage()));},
                      child: Text('EAS SAFARIS',style: GoogleFonts.abrilFatface(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 28,letterSpacing: 1.5)
                 // child:  Text('EAS SAFARIS',style: GoogleFonts.sassyFrass(fontWeight: FontWeight.bold,fontSize: 28,letterSpacing: 1.5)
                        ,),
                    ),
                  ),
                  // onTap: Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen())),
                ),
                const SizedBox(height:8),
                Wrap(
                  children:  [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText('Book Hotels',textStyle: GoogleFonts.abrilFatface(color: Colors.black,fontSize: 22)),

                        TyperAnimatedText('Book Travels',textStyle: GoogleFonts.abrilFatface(color: Colors.black,fontSize: 22)),
                        TyperAnimatedText('Car Hire',textStyle: GoogleFonts.abrilFatface(color: Colors.black,fontSize: 22)),

                      ],
                      pause: const Duration(milliseconds: 5000),

                      stopPauseOnTap: true,
                      repeatForever: true,
                    ),

                  ],
                ),
              ],),

              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: GestureDetector(
                  //   onTap: (){FirebaseAuth.instance.signOut();},
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));},
                    child:





                    Lottie.asset('assets/icons/96833-login.json',height: 70,),
              ),)

            ],),
          ),



          const SizedBox(height: 10.0),
          DestinationCarousel(),
          const SizedBox(height: 20.0),
          HotelCarousel(),
          const SizedBox(height: 20.0),
          SafariCarousel(),
          SizedBox(height: 20.0),
          CarCarousel(),
          SizedBox(height: 20.0),
          PlaceCarousel(),

          SizedBox(height: 60.0),
        ],
      ),

    );
  }
}
