

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:eastravel/screens/profilescreen.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../animalspotted.dart';
import '../badge.dart';
import '../hoteladmin/editroom.dart';
import '../spottedanimal.dart';
import '../templates/profilepage.dart';
import '../templates/tabpage.dart';
import 'accountingpage.dart';

class MainAccount extends StatefulWidget {

   MainAccount({Key? key}) : super(key: key);

  @override
  State<MainAccount> createState() => _MainAccountState();
}

class _MainAccountState extends State<MainAccount> {
  final user = FirebaseAuth.instance.currentUser!;
  double fem=1;
  double ffem=0.9;
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [

        Container(
          // autogroupftmnh3n (2Rx5e6o8oyEMBY4MriFtMN)
          padding:  EdgeInsets.fromLTRB(12.09*fem, 1*fem, 12.09*fem, 83*fem),
          width:  double.infinity,
          child:
          Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // profileringNzU (0:2330)
                  margin:  EdgeInsets.fromLTRB(37.91*fem, 0*fem, 37.91*fem, 4*fem),
                  child:
                  TextButton(
                    onPressed:  () {},
                    style:  TextButton.styleFrom (
                      padding:  EdgeInsets.zero,
                    ),
                    child:
                    Container(
                      width:  double.infinity,
                      height:  220*fem,
                      child:
                      Container(
                        // frame34sJ (I0:2330;74:455)
                        width:  double.infinity,
                        height:  double.infinity,
                        child:
                        Stack(
                          children:  [
                            Positioned(
                              // ellipse21oK6 (I0:2330;74:375)
                              left:  35*fem,
                              top:  25*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  160*fem,
                                  height:  160*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(105*fem),
                                      border:  Border.all(color:Color(0xffed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse22URE (I0:2330;74:376)
                              left:  30*fem,
                              top:  20*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  170*fem,
                                  height:  170*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(110*fem),
                                      border:  Border.all(color:Color(0xcced1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse23YAC (I0:2330;74:377)
                              left:  25*fem,
                              top:  15*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  180*fem,
                                  height:  180*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(115*fem),
                                      border:  Border.all(color:Color(0x99ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse24Qy6 (I0:2330;74:378)
                              left:  20*fem,
                              top:  10*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  190*fem,
                                  height:  190*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(120*fem),
                                      border:  Border.all(color:Color(0x66ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse25JHn (I0:2330;74:379)
                              left:  15*fem,
                              top:  5*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  200*fem,
                                  height:  200*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(125*fem),
                                      border:  Border.all(color:Color(0x33ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse26x7S (I0:2330;74:380)
                              left:  10*fem,
                              top:  0*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  210*fem,
                                  height:  210*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(130*fem),
                                      border:  Border.all(color:Color(0x19ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse15zpp (I0:2330;74:381)
                              left:  40*fem,
                              top:  30*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  150*fem,
                                  height:  150*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(100*fem),
                                      border:  Border.all(color:Color(0x4cffffff)),
                                      image:  DecorationImage (
                                        fit:  BoxFit.cover,
                                        image:  AssetImage('assets/images/gondola.jpg'),

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('email', isEqualTo: user.email)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if (snapshot.hasData && !(snapshot.data?.docs.isEmpty ?? true)) {
                      String firstName = snapshot.data!.docs[0].get('firstname');
                      String lastName = snapshot.data!.docs[0].get('lastname');
                      return Container(
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                        child: Text(
                          '$firstName $lastName',
                          style:  GoogleFonts.inter(
                            fontSize:  20*ffem,
                            fontWeight:  FontWeight.w800,
                            height:  1.2125*ffem/fem,
                            color:  Colors.black,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),

                //USER PROFILE IMAGE





//Email



        //Profile
        Container(
        // frame21JW4 (0:2390)

        child:
        TextButton(
        onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) => Temp8(),),);},
       // onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) => AccountingPage(),),);},
        style:  TextButton.styleFrom (
        padding:  EdgeInsets.zero,
        ),
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(
            'Profile',
            style:  GoogleFonts.inter (

              fontSize:  20*ffem,
              fontWeight:  FontWeight.w600,
              height:  1.2125*ffem/fem,
              color:  Colors.black,
            ),
          ),
          Lottie.asset('assets/icons/profile.json',height: 70),


        ],
        ),
        ),
        ),


        //Wishlist
        Container(
        // frame21JW4 (0:2390)

        child:
        TextButton(
        onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeP(),),);},
        style:  TextButton.styleFrom (
        padding:  EdgeInsets.zero,
        ),
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(
            'Wishlist',
            style:  GoogleFonts.inter (

              fontSize:  20*ffem,
              fontWeight:  FontWeight.w600,
              height:  1.2125*ffem/fem,
              color:  Colors.black,
            ),
          ),
          Lottie.asset('assets/icons/wishlist.json',height: 70),


        ],
        ),
        ),
        ),

        //Scan QR CODE AND BADGES
        Container(
        // frame21JW4 (0:2390)

        child:
        TextButton(
        onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  BadgeScreenn(),),);},
        style:  TextButton.styleFrom (
        padding:  EdgeInsets.zero,
        ),
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(
            'Badges',
            style:  GoogleFonts.inter (

              fontSize:  20*ffem,
              fontWeight:  FontWeight.w600,
              height:  1.2125*ffem/fem,
              color:  Colors.black,
            ),
          ),
          Lottie.asset('assets/icons/trophy.json',height: 70),


        ],
        ),
        ),
        ),



        //Weather
        Container(
        // frame21JW4 (0:2390)

        child:
        TextButton(
        onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherPage(),),);},
        style:  TextButton.styleFrom (
        padding:  EdgeInsets.zero,
        ),
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(
            'Weather',
            style:  GoogleFonts.inter (

              fontSize:  20*ffem,
              fontWeight:  FontWeight.w600,
              height:  1.2125*ffem/fem,
              color:  Colors.black,
            ),
          ),
          Lottie.asset('assets/icons/moderatewind.json',height: 70),


        ],
        ),
        ),
        ),

        //Animals Spotted
        Container(
        // frame21JW4 (0:2390)

        child:
        TextButton(
        onPressed:  () {Navigator.push(context, MaterialPageRoute(builder: (context) => AnimalSpottedPage(),),);},
        style:  TextButton.styleFrom (
        padding:  EdgeInsets.zero,
        ),
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text(
            'Animals Spotted',
            style:  GoogleFonts.inter (

              fontSize:  20*ffem,
              fontWeight:  FontWeight.w600,
              height:  1.2125*ffem/fem,
              color:  Colors.black,
            ),
          ),
          Lottie.asset('assets/icons/73387-tourist-travel.json',height: 50),


        ],
        ),
        ),
        ),




        Container(
        // line1pic (0:2336)
        margin:  EdgeInsets.fromLTRB(7.91*fem, 0*fem, 7.91*fem, 27*fem),
        width:  double.infinity,
        height:  1*fem,
        decoration:  BoxDecoration (
        color:  Color(0x7fffffff),
        ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12)
          ),
        // signoutXsv (0:2335)
        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 236*fem, 0*fem),
        child:
        Row(
          children: [
            Icon(Icons.logout,color: Colors.white,),
            TextButton(
            onPressed:  () {},
            style:  TextButton.styleFrom (
            padding:  EdgeInsets.zero,
            ),
            child:
            Text(
            'Log Out',
            style:  GoogleFonts.inter (

            fontSize:  20*ffem,
            fontWeight:  FontWeight.w600,
            height:  1.2125*ffem/fem,
            color:  Colors.white,
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
    );
  }
}








class BadgeScreenn extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;


   BadgeScreenn({super.key, });

  @override
  Widget build(BuildContext context) {
    final String name=user.email!;


    final qrData = '$name';
    final fem=0.9;
    final ffem =0.9;

    return Scaffold(
      appBar: AppBar(title: Text('Badges',style: GoogleFonts.inter(),),),

      body: Column(
        children: [
          Container(
            // profilepage9h1A (0:1167)
            padding:  EdgeInsets.fromLTRB(12.09*fem, 1*fem, 12.09*fem, 48*fem),
            width:  double.infinity,
            decoration:  BoxDecoration (
              color:  Colors.white,
            ),
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [

               //QR CODE
                Container(
                  // profileringRv8 (0:1188)
                  margin:  EdgeInsets.fromLTRB(37.91*fem, 0*fem, 37.91*fem, 29*fem),
                  child:
                  TextButton(
                    onPressed:  () {},
                    style:  TextButton.styleFrom (
                      padding:  EdgeInsets.zero,
                    ),
                    child:
                    Container(
                      width:  double.infinity,
                      height:  260*fem,
                      child:
                      Container(
                        // frame3L1W (I0:1188;74:455)
                        width:  double.infinity,
                        height:  double.infinity,
                        child:
                        Stack(
                          children:  [
                            Positioned(
                              // ellipse214y6 (I0:1188;74:375)
                              left:  25*fem,
                              top:  25*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  210*fem,
                                  height:  210*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(105*fem),
                                      border:  Border.all(color:Color(0xffed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse22MhJ (I0:1188;74:376)
                              left:  20*fem,
                              top:  20*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  220*fem,
                                  height:  220*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(110*fem),
                                      border:  Border.all(color:Color(0xcced1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse233q2 (I0:1188;74:377)
                              left:  15*fem,
                              top:  15*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  230*fem,
                                  height:  230*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(115*fem),
                                      border:  Border.all(color:Color(0x99ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse24NcQ (I0:1188;74:378)
                              left:  10*fem,
                              top:  10*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  240*fem,
                                  height:  240*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(120*fem),
                                      border:  Border.all(color:Color(0x66ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse25HUU (I0:1188;74:379)
                              left:  5*fem,
                              top:  5*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  250*fem,
                                  height:  250*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(125*fem),
                                      border:  Border.all(color:Color(0x33ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse26Qoz (I0:1188;74:380)
                              left:  0*fem,
                              top:  0*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  260*fem,
                                  height:  260*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(130*fem),
                                      border:  Border.all(color:Color(0x19ed1b24)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // ellipse15k7A (I0:1188;74:381)
                              left:  30*fem,
                              top:  30*fem,
                              child:
                              Align(
                                child:
                                SizedBox(
                                  width:  200*fem,
                                  height:  200*fem,
                                  child:
                                  Container(
                                    decoration:  BoxDecoration (
                                      borderRadius:  BorderRadius.circular(100*fem),
                                      border:  Border.all(color:Color(0x4cffffff)),

                                    ),
                                    child: QrImage(
                                      data: '$qrData',
                                      version: QrVersions.auto,
                                      size: 250.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //button text
                Container(
                  // buttonLLG (0:1170)
                  margin:  EdgeInsets.fromLTRB(17.91*fem, 0*fem, 17.91*fem, 0*fem),
                  child:
                  TextButton(
                    onPressed:  () {},
                    style:  TextButton.styleFrom (
                      padding:  EdgeInsets.zero,
                    ),
                    child:
                    Container(
                      width:  double.infinity,
                      height:  50*fem,
                      decoration:  BoxDecoration (
                        color:  Color(0xffed1b24),
                      ),
                      child:
                      Center(
                        child:
                        Text(
                          'Scan this QR code to get the badge',
                          textAlign:  TextAlign.center,
                          style:  GoogleFonts.inter (

                            fontSize:  18.3821086884*ffem,
                            fontWeight:  FontWeight.w600,
                            height:  1.2125*ffem/fem,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //ListView
                Container(
                    height: 300,
                    child: UserBadgesPage(name: user.email!)),



              ],
            ),
          ),
        ],
      ),
    );
  }
}
