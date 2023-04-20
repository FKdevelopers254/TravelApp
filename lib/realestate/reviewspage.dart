import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RReviewsPage extends StatefulWidget {
  const RReviewsPage({Key? key}) : super(key: key);

  @override
  State<RReviewsPage> createState() => _RReviewsPageState();
}

class _RReviewsPageState extends State<RReviewsPage> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // detailreviewsANc (2:3587)
      padding:  EdgeInsets.fromLTRB(24*fem, 24*fem, 0*fem, 0*fem),
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        borderRadius:  BorderRadius.circular(50*fem),
      ),
      child:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children:  [
          Container(
            // headerCq6 (2:3602)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 159*fem, 20*fem),
            width:  double.infinity,
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // buttonbacksolid8Cx (2:3604)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 86*fem, 0*fem),
                  width:  50*fem,
                  height:  50*fem,
                  child:
                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                ),
                Container(
                  // pagetitleRxk (2:3603)
                  margin:  EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                  child:
                  Text(
                    'Reviews',
                    textAlign:  TextAlign.center,
                    style:  GoogleFonts.raleway (
                     
                      fontSize:  14*ffem,
                      fontWeight:  FontWeight.w700,
                      height:  1.175*ffem/fem,
                      color:  Color(0xff252b5c),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // estatescardwidefulliBA (2:3601)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 20*fem),
            padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 41*fem, 8*fem),
            width:  double.infinity,
            height:  120*fem,
            decoration:  BoxDecoration (
              color:  Color(0xfff5f4f7),
              borderRadius:  BorderRadius.circular(20*fem),
            ),
            child:
            ClipRect(
              child:
              BackdropFilter(
                filter:  ImageFilter.blur (
                  sigmaX:  6*fem,
                  sigmaY:  6*fem,
                ),
                child:
                Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      // shapeME8 (I2:3601;277:1487)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                      padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 8*fem, 8*fem),
                      width:  168*fem,
                      height:  double.infinity,
                      decoration:  BoxDecoration (
                        color:  Color(0x14884af6),
                        borderRadius:  BorderRadius.circular(10*fem),
                        image:  DecorationImage (
                          fit:  BoxFit.cover,
                          image:  AssetImage('assets/images/kozi3.jpg'),
                        ),
                      ),
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // buttonfavoriteobv (I2:3601;277:1490)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 36*fem),
                            width:  25*fem,
                            height:  25*fem,
                            child:
                            Image(image: AssetImage('assets/images/kozi3.jpg'),),
                          ),
                          ClipRect(
                            // buttoncategorysquaretextsmallK (I2:3601;277:1489)
                            child:
                            BackdropFilter(
                              filter:  ImageFilter.blur (
                                sigmaX:  4*fem,
                                sigmaY:  4*fem,
                              ),
                              child:
                              Container(
                                width:  63*fem,
                                height:  27*fem,
                                decoration:  BoxDecoration (
                                  color:  Color(0xaf234f68),
                                  borderRadius:  BorderRadius.circular(8*fem),
                                ),
                                child:
                                Center(
                                  child:
                                  Text(
                                    'Apartment',
                                    style:  GoogleFonts.raleway (
                                     
                                      fontSize:  8*ffem,
                                      fontWeight:  FontWeight.w500,
                                      height:  1.175*ffem/fem,
                                      letterSpacing:  0.24*fem,
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
                      // layoutwLk (I2:3601;277:1491)
                      margin:  EdgeInsets.fromLTRB(0*fem, 12*fem, 0*fem, 21*fem),
                      height:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // textskC (I2:3601;277:1492)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8.5*fem),
                            constraints:  BoxConstraints (
                              maxWidth:  94*fem,
                            ),
                            child:
                            Text(
                              'Sky Dandelions\nApartment',
                              style:  GoogleFonts.raleway (
                               
                                fontSize:  12*ffem,
                                fontWeight:  FontWeight.w700,
                                height:  1.5*ffem/fem,
                                letterSpacing:  0.36*fem,
                                color:  Color(0xff252b5c),
                              ),
                            ),
                          ),
                          Container(
                            // layoutAUQ (I2:3601;277:1493)
                            margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
                            width:  77.25*fem,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // layoutHov (I2:3601;277:1494)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 8.5*fem),
                                  width:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // iconstarsmallpJ4 (I2:3601;277:1495)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2.75*fem, 0*fem),
                                        width:  7.5*fem,
                                        height:  7.13*fem,
                                        child:
                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                      ),
                                      Text(
                                        // text7Y4 (I2:3601;277:1496)
                                        '4.9',
                                        style:  GoogleFonts.montserrat (
                                         
                                          fontSize:  8*ffem,
                                          fontWeight:  FontWeight.w700,
                                          height:  1*ffem/fem,
                                          color:  Color(0xff53577a),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // layoutTrp (I2:3601;277:1497)
                                  margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
                                  width:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // iconlocation1NY (I2:3601;277:1498)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.5*fem, 1*fem),
                                        width:  6*fem,
                                        height:  7.5*fem,
                                        child:
                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                      ),
                                      Text(
                                        // textWaC (I2:3601;277:1499)
                                        'Jakarta, Indonesia',
                                        style:  GoogleFonts.raleway (
                                          
                                          fontSize:  8*ffem,
                                          fontWeight:  FontWeight.w400,
                                          height:  1.175*ffem/fem,
                                          color:  Color(0xff53577a),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // ratingcategory45v (2:3595)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
            width:  430*fem,
            height:  50*fem,
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // buttoncategoryroundedactiveMap (2:3596)
                  padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 17.5*fem),
                  width:  86*fem,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xff1f4c6b),
                    borderRadius:  BorderRadius.circular(20*fem),
                  ),
                  child:
                  Container(
                    // layoutTdr (I2:3596;222:469)
                    width:  double.infinity,
                    height:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // textohi (I2:3596;222:470)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                          child:
                          Text(
                            '⭐',
                            style:  GoogleFonts.raleway(
                             
                              fontSize:  15*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1*ffem/fem,
                              letterSpacing:  0.45*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                        Container(
                          // textWc8 (I2:3596;222:471)
                          margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          child:
                          Text(
                            'All',
                            style:  GoogleFonts.montserrat (
                            
                              fontSize:  10*ffem,
                              fontWeight:  FontWeight.w700,
                              height:  1.2175*ffem/fem,
                              letterSpacing:  0.3*fem,
                              color:  Color(0xfff5f4f7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width:  10*fem,
                ),
                Container(
                  // buttoncategoryroundedCUx (2:3597)
                  padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 17.5*fem),
                  width:  75*fem,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xfff5f4f7),
                    borderRadius:  BorderRadius.circular(20*fem),
                  ),
                  child:
                  Container(
                    // layoutvfr (I2:3597;222:473)
                    width:  double.infinity,
                    height:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // textguv (I2:3597;222:474)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                          child:
                          Text(
                            '⭐',
                            style:  GoogleFonts.raleway (
                             
                              fontSize:  15*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1*ffem/fem,
                              letterSpacing:  0.45*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                        Container(
                          // textzvc (I2:3597;222:475)
                          margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          child:
                          Text(
                            '1',
                            style:  GoogleFonts.montserrat (
                             
                              fontSize:  10*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.2175*ffem/fem,
                              letterSpacing:  0.3*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width:  10*fem,
                ),
                Container(
                  // buttoncategoryrounded6Tr (2:3598)
                  padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 23*fem, 17.5*fem),
                  width:  77*fem,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xfff5f4f7),
                    borderRadius:  BorderRadius.circular(20*fem),
                  ),
                  child:
                  Container(
                    // layoutcBJ (I2:3598;222:473)
                    width:  double.infinity,
                    height:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // text9wv (I2:3598;222:474)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                          child:
                          Text(
                            '⭐',
                            style:  GoogleFonts.raleway (
                             
                              fontSize:  15*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1*ffem/fem,
                              letterSpacing:  0.45*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                        Container(
                          // textrbS (I2:3598;222:475)
                          margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          child:
                          Text(
                            '2',
                            style:  GoogleFonts.montserrat (
                              
                              fontSize:  10*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.2175*ffem/fem,
                              letterSpacing:  0.3*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width:  10*fem,
                ),
                Container(
                  // buttoncategoryroundedM2Q (2:3599)
                  padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 23*fem, 17.5*fem),
                  width:  77*fem,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xfff5f4f7),
                    borderRadius:  BorderRadius.circular(20*fem),
                  ),
                  child:
                  Container(
                    // layoutf36 (I2:3599;222:473)
                    width:  double.infinity,
                    height:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // textQmN (I2:3599;222:474)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                          child:
                          Text(
                            '⭐',
                            style:  GoogleFonts.raleway (
                            
                              fontSize:  15*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1*ffem/fem,
                              letterSpacing:  0.45*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                        Container(
                          // text8hN (I2:3599;222:475)
                          margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          child:
                          Text(
                            '3',
                            style:  GoogleFonts.montserrat (
                             
                              fontSize:  10*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.2175*ffem/fem,
                              letterSpacing:  0.3*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width:  10*fem,
                ),
                Container(
                  // buttoncategoryrounded3pL (2:3600)
                  padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 17.5*fem),
                  width:  75*fem,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xfff5f4f7),
                    borderRadius:  BorderRadius.circular(25*fem),
                  ),
                  child:
                  Container(
                    // layoutn1E (I2:3600;222:473)
                    width:  double.infinity,
                    height:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // textwep (I2:3600;222:474)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                          child:
                          Text(
                            '⭐',
                            style:  GoogleFonts.raleway (
                             
                              fontSize:  15*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1*ffem/fem,
                              letterSpacing:  0.45*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                        Container(
                          // textTt4 (I2:3600;222:475)
                          margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          child:
                          Text(
                            '1',
                            style:  GoogleFonts.montserrat (
                             
                              fontSize:  10*ffem,
                              fontWeight:  FontWeight.w500,
                              height:  1.2175*ffem/fem,
                              letterSpacing:  0.3*fem,
                              color:  Color(0xff252b5c),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // reviewlistaxg (2:3588)
            width:  682*fem,
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children:  [
                Container(
                  // text8jJ (I2:3589;424:10750)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                  child:
                  Text(
                    'User reviews',
                    style:  GoogleFonts.raleway (
                     
                      fontSize:  18*ffem,
                      fontWeight:  FontWeight.w700,
                      height:  1.175*ffem/fem,
                      letterSpacing:  0.54*fem,
                      color:  Color(0xff252b5c),
                    ),
                  ),
                ),
                Container(
                  // layoutG4p (2:3590)
                  width:  double.infinity,
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // autogroupx8oadAG (US7UiTiwFShP5RFi2Vx8oA)
                        padding:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                        width:  double.infinity,
                        height:  478*fem,
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            Container(
                              // cardreviewxCY (2:3591)
                              padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 11.17*fem, 10*fem),
                              width:  327*fem,
                              height:  128*fem,
                              decoration:  BoxDecoration (
                                color:  Color(0xfff5f4f7),
                                borderRadius:  BorderRadius.circular(25*fem),
                              ),
                              child:
                              Container(
                                // layoutGyv (I2:3591;477:7553)
                                width:  double.infinity,
                                height:  double.infinity,
                                child:
                                Row(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children:  [
                                    Container(
                                      // shapeDuA (I2:3591;477:7495;254:1064)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                      width:  50*fem,
                                      height:  50*fem,
                                      child:
                                      ClipRRect(
                                        borderRadius:  BorderRadius.circular(25*fem),
                                        child:
                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                      ),
                                    ),
                                    Container(
                                      // layoutXQ4 (I2:3591;477:7551)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
                                      width:  245.83*fem,
                                      child:
                                      Column(
                                        crossAxisAlignment:  CrossAxisAlignment.start,
                                        children:  [
                                          Container(
                                            // layoutqvY (I2:3591;477:7550)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                            width:  double.infinity,
                                            height:  15*fem,
                                            child:
                                            Row(
                                              crossAxisAlignment:  CrossAxisAlignment.center,
                                              children:  [
                                                Container(
                                                  // textN9n (I2:3591;477:7498)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 116.83*fem, 0*fem),
                                                  child:
                                                  Text(
                                                    'Kurt Mullins',
                                                    style:  GoogleFonts.raleway (

                                                      fontSize:  12*ffem,
                                                      fontWeight:  FontWeight.w700,
                                                      height:  1.175*ffem/fem,
                                                      letterSpacing:  0.36*fem,
                                                      color:  Color(0xff252b5c),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // itemstarratingssE (I2:3591;477:7503)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 3.04*fem, 0*fem, 4.04*fem),
                                                  height:  double.infinity,
                                                  child:
                                                  Row(
                                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                                    children:  [
                                                      Container(
                                                        // itemstarfullCec (I2:3591;477:7503;282:1459)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullv4p (I2:3591;477:7503;282:1466)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullD3v (I2:3591;477:7503;282:1470)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullhUt (I2:3591;477:7503;282:1474)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfadeDi8 (I2:3591;477:7503;282:1458)
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // text8q6 (I2:3591;477:7499)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                            constraints:  BoxConstraints (
                                              maxWidth:  245*fem,
                                            ),
                                            child:
                                            Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                                              style:  GoogleFonts.raleway (

                                                fontSize:  10*ffem,
                                                fontWeight:  FontWeight.w400,
                                                height:  2*ffem/fem,
                                                letterSpacing:  0.3*fem,
                                                color:  Color(0xff53577a),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // textBB6 (I2:3591;477:7500)
                                            '10 mins ago',
                                            style:  GoogleFonts.montserrat (

                                              fontSize:  8*ffem,
                                              fontWeight:  FontWeight.w400,
                                              height:  2.125*ffem/fem,
                                              letterSpacing:  -0.16*fem,
                                              color:  Color(0xffa1a4c1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:  10*fem,
                            ),
                            Container(
                              // cardreviewestateUvt (2:3592)
                              padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 11.17*fem, 10*fem),
                              width:  327*fem,
                              height:  192*fem,
                              decoration:  BoxDecoration (
                                color:  Color(0xfff5f4f7),
                                borderRadius:  BorderRadius.circular(25*fem),
                              ),
                              child:
                              Container(
                                // layoutCbz (I2:3592;477:7588)
                                width:  double.infinity,
                                height:  double.infinity,
                                child:
                                Row(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children:  [
                                    Container(
                                      // shapeA32 (I2:3592;477:7589;254:1064)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                      width:  50*fem,
                                      height:  50*fem,
                                      child:
                                      ClipRRect(
                                        borderRadius:  BorderRadius.circular(25*fem),
                                        child:
                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                      ),
                                    ),
                                    Container(
                                      // layoutT28 (I2:3592;477:7592)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
                                      width:  245.83*fem,
                                      child:
                                      Column(
                                        crossAxisAlignment:  CrossAxisAlignment.center,
                                        children:  [
                                          Container(
                                            // layoutNun (I2:3592;477:7593)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                            width:  double.infinity,
                                            height:  15*fem,
                                            child:
                                            Row(
                                              crossAxisAlignment:  CrossAxisAlignment.center,
                                              children:  [
                                                Container(
                                                  // textEwz (I2:3592;477:7594)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 117.83*fem, 0*fem),
                                                  child:
                                                  Text(
                                                    'Samuel Ella',
                                                    style:  GoogleFonts.raleway (

                                                      fontSize:  12*ffem,
                                                      fontWeight:  FontWeight.w700,
                                                      height:  1.175*ffem/fem,
                                                      letterSpacing:  0.36*fem,
                                                      color:  Color(0xff252b5c),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // itemstarratingx7J (I2:3592;477:7595)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 3.04*fem, 0*fem, 4.04*fem),
                                                  height:  double.infinity,
                                                  child:
                                                  Row(
                                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                                    children:  [
                                                      Container(
                                                        // itemstarfullfnQ (I2:3592;477:7595;282:1459)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullauN (I2:3592;477:7595;282:1466)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullVmS (I2:3592;477:7595;282:1470)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullRQC (I2:3592;477:7595;282:1474)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfadeYDv (I2:3592;477:7595;282:1458)
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // texts1J (I2:3592;477:7596)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0.83*fem, 0*fem),
                                            constraints:  BoxConstraints (
                                              maxWidth:  245*fem,
                                            ),
                                            child:
                                            Text(
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                                              style:  GoogleFonts.raleway (

                                                fontSize:  10*ffem,
                                                fontWeight:  FontWeight.w400,
                                                height:  2*ffem/fem,
                                                letterSpacing:  0.3*fem,
                                                color:  Color(0xff53577a),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // autogrouppmjyxoS (US7VLcMNQbheabWJgePMJY)
                                            padding:  EdgeInsets.fromLTRB(0*fem, 4*fem, 0*fem, 0*fem),
                                            width:  double.infinity,
                                            child:
                                            Column(
                                              crossAxisAlignment:  CrossAxisAlignment.start,
                                              children:  [
                                                Container(
                                                  // layout6ek (I2:3592;477:7634)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                                  child:
                                                  Row(
                                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                                    children:  [
                                                      Container(
                                                        // shapeSTi (I2:3592;477:7701;477:7630)
                                                        width:  60*fem,
                                                        height:  60*fem,
                                                        child:
                                                        ClipRRect(
                                                          borderRadius:  BorderRadius.circular(18*fem),
                                                          child:
                                                          Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:  5*fem,
                                                      ),
                                                      Container(
                                                        // shapeN6U (I2:3592;480:7309;477:7630)
                                                        width:  60*fem,
                                                        height:  60*fem,
                                                        child:
                                                        ClipRRect(
                                                          borderRadius:  BorderRadius.circular(18*fem),
                                                          child:
                                                          Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:  5*fem,
                                                      ),
                                                      Container(
                                                        // shapeTdi (I2:3592;480:7371;477:7630)
                                                        width:  60*fem,
                                                        height:  60*fem,
                                                        child:
                                                        ClipRRect(
                                                          borderRadius:  BorderRadius.circular(18*fem),
                                                          child:
                                                          Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  // textbE8 (I2:3592;477:7597)
                                                  '10 mins ago',
                                                  style:  GoogleFonts.montserrat (

                                                    fontSize:  8*ffem,
                                                    fontWeight:  FontWeight.w400,
                                                    height:  2.125*ffem/fem,
                                                    letterSpacing:  -0.16*fem,
                                                    color:  Color(0xffa1a4c1),
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
                              ),
                            ),
                            SizedBox(
                              height:  10*fem,
                            ),
                            Container(
                              // cardreview7CU (2:3593)
                              padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 9*fem, 10*fem),
                              width:  327*fem,
                              height:  128*fem,
                              decoration:  BoxDecoration (
                                color:  Color(0xfff5f4f7),
                                borderRadius:  BorderRadius.circular(25*fem),
                              ),
                              child:
                              Container(
                                // layout2qE (I2:3593;477:7553)
                                width:  double.infinity,
                                height:  double.infinity,
                                child:
                                Row(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children:  [
                                    Container(
                                      // shapezGG (I2:3593;477:7495;254:1064)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                      width:  50*fem,
                                      height:  50*fem,
                                      child:
                                      ClipRRect(
                                        borderRadius:  BorderRadius.circular(25*fem),
                                        child:
                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                      ),
                                    ),
                                    Container(
                                      // layout7Lt (I2:3593;477:7551)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
                                      width:  248*fem,
                                      child:
                                      Column(
                                        crossAxisAlignment:  CrossAxisAlignment.start,
                                        children:  [
                                          Container(
                                            // layoutqng (I2:3593;477:7550)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2.17*fem, 3*fem),
                                            width:  double.infinity,
                                            height:  15*fem,
                                            child:
                                            Row(
                                              crossAxisAlignment:  CrossAxisAlignment.center,
                                              children:  [
                                                Container(
                                                  // textydz (I2:3593;477:7498)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 110.83*fem, 0*fem),
                                                  child:
                                                  Text(
                                                    'Kay Swanson',
                                                    style:  GoogleFonts.raleway (

                                                      fontSize:  12*ffem,
                                                      fontWeight:  FontWeight.w700,
                                                      height:  1.175*ffem/fem,
                                                      letterSpacing:  0.36*fem,
                                                      color:  Color(0xff252b5c),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  // itemstarratingtW4 (I2:3593;477:7503)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 3.04*fem, 0*fem, 4.04*fem),
                                                  height:  double.infinity,
                                                  child:
                                                  Row(
                                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                                    children:  [
                                                      Container(
                                                        // itemstarfullbvG (I2:3593;477:7503;282:1459)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullX3E (I2:3593;477:7503;282:1466)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullSR6 (I2:3593;477:7503;282:1470)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfullMY4 (I2:3593;477:7503;282:1474)
                                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                      Container(
                                                        // itemstarfadeg4Y (I2:3593;477:7503;282:1458)
                                                        width:  8.33*fem,
                                                        height:  7.92*fem,
                                                        child:
                                                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // text1Mi (I2:3593;477:7499)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                            constraints:  BoxConstraints (
                                              maxWidth:  248*fem,
                                            ),
                                            child:
                                            Text(
                                              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperia.',
                                              style:  GoogleFonts.raleway (

                                                fontSize:  10*ffem,
                                                fontWeight:  FontWeight.w400,
                                                height:  2*ffem/fem,
                                                letterSpacing:  0.3*fem,
                                                color:  Color(0xff53577a),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // texti1E (I2:3593;477:7500)
                                            '10 mins ago',
                                            style:  GoogleFonts.montserrat (

                                              fontSize:  8*ffem,
                                              fontWeight:  FontWeight.w400,
                                              height:  2.125*ffem/fem,
                                              letterSpacing:  -0.16*fem,
                                              color:  Color(0xffa1a4c1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // cardreviewqrY (2:3594)
                        padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 0*fem, 10*fem),
                        width:  double.infinity,
                        height:  128*fem,
                        decoration:  BoxDecoration (
                          color:  Color(0xfff5f4f7),
                          borderRadius:  BorderRadius.circular(25*fem),
                        ),
                        child:
                        Container(
                          // layoutmVJ (I2:3594;477:7553)
                          width:  double.infinity,
                          height:  double.infinity,
                          child:
                          Row(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            children:  [
                              Container(
                                // shapevNC (I2:3594;477:7495;254:1064)
                                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                width:  50*fem,
                                height:  50*fem,
                                child:
                                ClipRRect(
                                  borderRadius:  BorderRadius.circular(25*fem),
                                  child:
                                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                ),
                              ),
                              Container(
                                // layout3Bv (I2:3594;477:7551)
                                margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
                                width:  612*fem,
                                child:
                                Column(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children:  [
                                    Container(
                                      // layoutBJ8 (I2:3594;477:7550)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 366.17*fem, 3*fem),
                                      width:  double.infinity,
                                      height:  15*fem,
                                      child:
                                      Row(
                                        crossAxisAlignment:  CrossAxisAlignment.center,
                                        children:  [
                                          Container(
                                            // text6vt (I2:3594;477:7498)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 117.83*fem, 0*fem),
                                            child:
                                            Text(
                                              'Samuel Ella',
                                              style:  GoogleFonts.raleway (

                                                fontSize:  12*ffem,
                                                fontWeight:  FontWeight.w700,
                                                height:  1.175*ffem/fem,
                                                letterSpacing:  0.36*fem,
                                                color:  Color(0xff252b5c),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // itemstarrating2Jk (I2:3594;477:7503)
                                            margin:  EdgeInsets.fromLTRB(0*fem, 3.04*fem, 0*fem, 4.04*fem),
                                            height:  double.infinity,
                                            child:
                                            Row(
                                              crossAxisAlignment:  CrossAxisAlignment.center,
                                              children:  [
                                                Container(
                                                  // itemstarfulljix (I2:3594;477:7503;282:1459)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                  width:  8.33*fem,
                                                  height:  7.92*fem,
                                                  child:
                                                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                ),
                                                Container(
                                                  // itemstarfullFBW (I2:3594;477:7503;282:1466)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                  width:  8.33*fem,
                                                  height:  7.92*fem,
                                                  child:
                                                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                ),
                                                Container(
                                                  // itemstarfullke4 (I2:3594;477:7503;282:1470)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                  width:  8.33*fem,
                                                  height:  7.92*fem,
                                                  child:
                                                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                ),
                                                Container(
                                                  // itemstarfullG6c (I2:3594;477:7503;282:1474)
                                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.33*fem, 0*fem),
                                                  width:  8.33*fem,
                                                  height:  7.92*fem,
                                                  child:
                                                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                ),
                                                Container(
                                                  // itemstarfadeBUU (I2:3594;477:7503;282:1458)
                                                  width:  8.33*fem,
                                                  height:  7.92*fem,
                                                  child:
                                                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // textWme (I2:3594;477:7499)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 44*fem),
                                      child:
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                                        style:  GoogleFonts.raleway (

                                          fontSize:  10*ffem,
                                          fontWeight:  FontWeight.w400,
                                          height:  2*ffem/fem,
                                          letterSpacing:  0.3*fem,
                                          color:  Color(0xff53577a),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // text3Wg (I2:3594;477:7500)
                                      '10 mins ago',
                                      style:  GoogleFonts.montserrat (

                                        fontSize:  8*ffem,
                                        fontWeight:  FontWeight.w400,
                                        height:  2.125*ffem/fem,
                                        letterSpacing:  -0.16*fem,
                                        color:  Color(0xffa1a4c1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
  }
}
