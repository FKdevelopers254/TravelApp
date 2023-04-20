import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eastravel/screens/placestovisit.dart';
import 'package:eastravel/screens/test.dart';
import 'package:eastravel/templates/profilepage.dart';
import 'package:eastravel/widgets/roadtrip_carousel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';


import '../caradmin/bottombar.dart';
import '../money/detailspage.dart';
import '../money/mainpage.dart';
import '../money/moneypage.dart';
import '../realestate/chooselocation.dart';
import '../realestate/commentspage.dart';
import '../realestate/homepage.dart';
import '../realestate/loginpage.dart';
import '../realestate/nodatafoundpage.dart';
import '../realestate/overallpage.dart';
import '../realestate/reviewspage.dart';
import '../realestate/viewroompage.dart';
import '../travelplanner/intropage.dart';
import '../widgets/mainpage.dart';

import '../widgets/mpesa2.dart';
import '../widgets/car_carousel.dart';
import '../widgets/destination_carousel.dart';
import '../widgets/hotel_carousel.dart';
import '../widgets/places_carousel.dart';
import '../widgets/safari_carousel.dart';
import 'detailpage.dart';
import 'detailspage.dart';
import 'homepage.dart';
import 'intro.dart';
import 'intropae.dart';
import 'itinerary.dart';
import 'mappage.dart';



class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  late TabController tabController;
  @override
  void  initState(){
    super.initState();
    tabController = TabController(length: 8, vsync: this);
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
                  'Badges',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Travel Planner',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Weather',style: TextStyle(
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


               // RChooseLocation(),
                //RCommentsPage(),
               // RHomePage(),
               // RLoginPage(),
              //  RNoResults(),
              //  ROverallPage(),
              //  RViewRoom(),
               // RReviewsPage(),


                Temp1(),
                Temp2(),
                Temp3(),
                Temp4(),
                Temp5(),
                Temp6(),
                Temp7(),
                Temp8(),




                //   CustomCard('Barcode Scanning', BarcodeScannerView()),











              ],
            ),
          ),


        ],
      ),
    );
  }


}

