import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RCommentsPage extends StatefulWidget {
  const RCommentsPage({Key? key}) : super(key: key);

  @override
  State<RCommentsPage> createState() => _RCommentsPageState();
}

class _RCommentsPageState extends State<RCommentsPage> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // notificationlistPmS (2:2882)
      padding:  EdgeInsets.fromLTRB(24*fem, 24*fem, 22*fem, 0*fem),
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        borderRadius:  BorderRadius.circular(50*fem),
      ),
      child:
      Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
      Container(
      // headerq7e (2:2930)
      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 20*fem),
      width:  double.infinity,
      child:
      Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
            // buttonbacksolidxxx (2:2931)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 227*fem, 0*fem),
            width:  50*fem,
            height:  50*fem,
            child:
            Image(image: AssetImage('assets/images/kozi3.jpg'),),
          ),
          Container(
            // buttonfiltersq2 (2:2932)
            width:  50*fem,
            height:  50*fem,
            child:
            Image(image: AssetImage('assets/images/kozi3.jpg'),),
          ),
        ],
      ),
    ),




    Container(
    // buttonmenugroup2menuQ4G (2:2929)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 20*fem),
    padding:  EdgeInsets.fromLTRB(8*fem, 9*fem, 8*fem, 9*fem),
    width:  327*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(100*fem),
    ),
    child:
    Container(
    // layoutGcG (I2:2929;353:2685)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // buttonmenuactiveDXW (I2:2929;353:2694)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
    width:  152*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xffffffff),
    borderRadius:  BorderRadius.circular(100*fem),
    ),
    child:
    Center(
    child:
    Text(
    'Notification',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.175*ffem/fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    ),
    Container(
    // buttonmenuHGU (I2:2929;353:2695)
    width:  152*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(100*fem),
    ),
    child:
    Center(
    child:
    Text(
    'Messages',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.175*ffem/fem,
    color:  Color(0xffa1a4c1),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    Container(
    // categoryLEk (2:2924)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 38*fem),
    width:  double.infinity,
    height:  47*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // buttoncategoryroundedactiveGeC (2:2925)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 14.5*fem),
    width:  62*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xff234f68),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layoutmax (I2:2925;222:469)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    'All',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.175*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xfff5f4f7),
    ),
    ),
    ),
    ),
    SizedBox(
    width:  10*fem,
    ),
    Container(
    // buttoncategoryrounded5rY (2:2926)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 11.5*fem),
    width:  84*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layoutpZE (I2:2926;222:473)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    'Review',
    style:  GoogleFonts.raleway(

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.175*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    ),
    SizedBox(
    width:  10*fem,
    ),
    Container(
    // buttoncategoryroundedWS4 (2:2927)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 26*fem, 11.5*fem),
    width:  73*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layoutphe (I2:2927;222:473)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    ' Sold',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.175*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    ),
    SizedBox(
    width:  10*fem,
    ),
    Container(
    // buttoncategoryroundedvkg (2:2928)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 11.5*fem),
    width:  80*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layoutFHA (I2:2928;222:473)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    'House',
    style:  GoogleFonts.raleway(

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.175*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // notificationlistPPN (2:2883)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
    width:  327*fem,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textv8Q (I2:2923;424:10750)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
    child:
    Text(
    'Today',
    style: GoogleFonts.raleway (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.175*ffem/fem,
    letterSpacing:  0.54*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    Container(
    // cardnotificationmessageSsS (2:2895)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
    padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 48*fem, 10*fem),
    width:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(25*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // shapeY9n (I2:2896;254:1064)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 38*fem),
    width:  50*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(25*fem),
    border:  Border.all(color:Color(0xffffffff)),
    color:  Color(0xffe2e5e8),
    image:  DecorationImage (
    fit:  BoxFit.contain,
    image:  AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    ),
    Container(
    // layout1p4 (2:2898)
    margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textYZ6 (2:2899)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
    child:
    Text(
    'Emmett Perry',
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
    // textsbN (2:2900)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
    constraints:  BoxConstraints (
    maxWidth:  209*fem,
    ),
    child:
    RichText(
    text:
    TextSpan(
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    children:  [
    TextSpan(
    text:  'J',
    ),
    TextSpan(
    text:  'ust messag',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    ),
    TextSpan(
    text:  'ed',
    ),
    TextSpan(
    text:  ' you. Check the message in ',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    ),
    TextSpan(
    text:  'message',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  ' ',
    style:  GoogleFonts.raleway(

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    ),
    TextSpan(
    text:  'tab.',
    style:  GoogleFonts.raleway(

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    ),
    ],
    ),
    ),
    ),
    Text(
    // textMwn (2:2901)
    '10 mins ago',
    style:  GoogleFonts.raleway (

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
    Container(
    // cardnotificationreviewtRv (2:2903)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
    padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 10*fem, 10*fem),
    width:  double.infinity,
    height:  109*fem,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // layoutyTN (2:2904)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 0*fem),
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // photosusersmalliconboxXDz (2:2905)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(32*fem, 32*fem, 0*fem, 0*fem),
    width:  50*fem,
    decoration:  BoxDecoration (
    border:  Border.all(color:Color(0xffffffff)),
    borderRadius:  BorderRadius.circular(25*fem),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:   AssetImage('assets/images/kozi3.jpg')
    ),
    ),
    child:
    ClipRect(
    // shapeNVW (I2:2905;462:6678;462:6669)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  4*fem,
    sigmaY:  4*fem,
    ),
    child:
    Align(
    alignment:  Alignment.bottomRight,
    child:
    SizedBox(
    width:  double.infinity,
    height:  18*fem,
    child:
    Container(
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(5*fem),
    color:  Color(0xaf3f467c),
    ),
    ),
    ),
    ),
    ),
    ),
    ),
    Container(
    // layoutfjW (2:2907)
    margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textpcQ (2:2908)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
    child:
    Text(
    'Geraldo',
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
    // textAAU (2:2909)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
    constraints:  BoxConstraints (
    maxWidth:  162*fem,
    ),
    child:
    RichText(
    text:
    TextSpan(
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    children:  [
    TextSpan(
    text:  'J',
    ),
    TextSpan(
    text:  'ust ',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    ),
    TextSpan(
    text:  'giving ',
    ),
    TextSpan(
    text:  '5',
    style:  GoogleFonts.montserrat (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  ' ',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  'Star',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  ' review on your listing ',
    ),
    TextSpan(
    text:  'Fairview Apartment',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ],
    ),
    ),
    ),
    Text(
    // textm5i (2:2910)
    '40 mins ago',
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
    Container(
    // shapeiFr (2:2912)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 39*fem),
    width:  60*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(10*fem),
    border:  Border.all(color:Color(0xffffffff)),
    color:  Color(0xffc4c4c4),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:  AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // cardnotificationsoldc6L (2:2913)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
    padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 10*fem, 10*fem),
    width:  double.infinity,
    height:  108*fem,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // layoutJE4 (2:2914)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // photosusersmalliconboxdXE (2:2915)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
    width:  50*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    border:  Border.all(color:Color(0xffffffff)),
    borderRadius:  BorderRadius.circular(25*fem),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:  AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    ),
    Container(
    // layoutGq6 (2:2917)
    margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textzm6 (2:2918)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
    child:
    Text(
    'Walter Lindsey',
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
    // textXW8 (2:2919)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
    constraints:  BoxConstraints (
    maxWidth:  161*fem,
    ),
    child:
    RichText(
    text:
    TextSpan(
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    children:  [
    TextSpan(
    text:  'Just buy your listing ',
    ),
    TextSpan(
    text:  'Schoolview House',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ],
    ),
    ),
    ),
    Text(
    // textfEx (2:2920)
    '4 hours ago',
    style:  GoogleFonts.raleway (

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
    Container(
    // shapeQiL (2:2922)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 38*fem),
    width:  60*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(10*fem),
    border:  Border.all(color:Color(0xffffffff)),
    color:  Color(0xffc4c4c4),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:   AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // textuuz (I2:2894;424:10750)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
    child:
    Text(
    'Older notifications',
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
    // cardnotificationfavoriteeMn (2:2884)
    padding:  EdgeInsets.fromLTRB(10*fem, 10*fem, 10*fem, 10*fem),
    width:  double.infinity,
    height:  108*fem,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // layoutYxx (2:2885)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 61*fem, 0*fem),
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // photosusersmalliconboxqhA (2:2886)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(32*fem, 32*fem, 0*fem, 0*fem),
    width:  50*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    border:  Border.all(color:Color(0xffffffff)),
    borderRadius:  BorderRadius.circular(25*fem),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:  AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    child:
    Container(
    // component59Ldv (I2:2886;462:6678)
    width:  double.infinity,
    height:  double.infinity,
    ),
    ),
    Container(
    // layoutWHW (2:2888)
    margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textrcG (2:2889)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
    child:
    Text(
    'Velma Cole',
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
    // textzTa (2:2890)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
    constraints:  BoxConstraints (
    maxWidth:  126*fem,
    ),
    child:
    RichText(
    text:
    TextSpan(
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff53577a),
    ),
    children:  [
    TextSpan(
    text:  'Just favorited your listing ',
    ),
    TextSpan(
    text:  'Schoolview House',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w700,
    height:  2*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ],
    ),
    ),
    ),
    Text(
    // textvkY (2:2891)
    '2 Days ago',
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
    Container(
    // shapefTE (2:2893)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 38*fem),
    width:  60*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(10*fem),
    border:  Border.all(color:Color(0xffffffff)),
    color:  Color(0xffc4c4c4),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image: AssetImage('assets/images/kozi3.jpg'),
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
