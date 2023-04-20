import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RHomePage extends StatefulWidget {
  const RHomePage({Key? key}) : super(key: key);

  @override
  State<RHomePage> createState() => _RHomePageState();
}

class _RHomePageState extends State<RHomePage> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // homeshort19S (2:2596)
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
      // autogroupajigsBe (US5pPttDyEo7amQgshAjiG)
      padding:  EdgeInsets.fromLTRB(8*fem, 29*fem, 0*fem, 8*fem),
      width:  double.infinity,
      child:
      Column(
          crossAxisAlignment:  CrossAxisAlignment.start,
          children:  [
      Container(
      // autogroupz4kzyVa (US5mHEaFTvPTfJ6XWWZ4Kz)
      margin:  EdgeInsets.fromLTRB(13*fem, 0*fem, 25*fem, 30*fem),
      width:  double.infinity,
      height:  50*fem,
      child:
      Row(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
      Container(
      // buttonlocationdropdownflatUx8 (2:2607)
      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 56*fem, 0*fem),
      padding:  EdgeInsets.fromLTRB(18.5*fem, 18.75*fem, 18.5*fem, 18.75*fem),
      width:  163*fem,
      height:  double.infinity,
      decoration:  BoxDecoration (
          border:  Border.all(color: Color(0xffecedf3)),
      color:  Color(0xffffffff),
      borderRadius:  BorderRadius.circular(25*fem),
    ),
    child:
    Container(
    // layoutZTn (I2:2607;14:223)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconlocationJRN (I2:2607;14:202)
    width:  10*fem,
    height:  12.5*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  10.5*fem,
    ),
    Text(
    // jakartaindonesiaPBv (I2:2607;14:206)
    'Jakarta, Indonesia',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.175*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    SizedBox(
    width:  10.5*fem,
    ),
    Container(
    // iconchevrondownfQL (I2:2607;14:211)
    width:  5*fem,
    height:  2.5*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ],
    ),
    ),
    ),
    Container(
    // buttonnotificationyfv (2:2608)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
    width:  50*fem,
    height:  50*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // autogroupukmi5U4 (US5mVp3dKDHYFdqHufuKmi)
    width:  50*fem,
    height:  double.infinity,
    child:
    Stack(
    children:  [
    Positioned(
    // groupRXv (2:2609)
    left:  25*fem,
    top:  10*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  12*fem,
    height:  12*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    Positioned(
    // ionnotificationsoutlinej2p (2:2612)
    left:  18.1186523438*fem,
    top:  16.875*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  13.76*fem,
    height:  16.25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    Positioned(
    // group1FE (2:2613)
    left:  0*fem,
    top:  0*fem,
    child:
    Container(
    padding:  EdgeInsets.fromLTRB(3*fem, 3*fem, 3*fem, 3*fem),
    width:  50*fem,
    height:  50*fem,
    decoration:  BoxDecoration (
    border:  Border.all(color :Color(0xffdfdfdf)),
    color:  Color(0xffffffff),
    borderRadius:  BorderRadius.circular(25*fem),
    ),
    child:
    Center(
    // ellipsepCg (2:2615)
    child:
    SizedBox(
    width:  double.infinity,
    height:  44*fem,
    child:
    Container(
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(22*fem),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:   AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    Container(
    // heyjonathanletsstartexploringF (2:2605)
    margin:  EdgeInsets.fromLTRB(19*fem, 0*fem, 0*fem, 20*fem),
    constraints:  BoxConstraints (
    maxWidth:  232*fem,
    ),
    child:
    RichText(
    text:
    TextSpan(
    style:  GoogleFonts.raleway (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    children:  [
    TextSpan(
    text:  'Hey,',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  ' ',
    style:  GoogleFonts.lato(

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  'Jonathan!',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w800,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff234f68),
    ),
    ),
    TextSpan(
    text:  ' \n',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w800,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  'Let\'s start exploring',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  ' ',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  ' ',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ],
    ),
    ),
    ),
    Container(
    // formsearchemptyAdE (2:2604)
    margin:  EdgeInsets.fromLTRB(16*fem, 0*fem, 24*fem, 20*fem),
    padding:  EdgeInsets.fromLTRB(19*fem, 17*fem, 20.17*fem, 16.5*fem),
    width:  double.infinity,
    height:  70*fem,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(10*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // layoutqzG (I2:2604;403:3349)
    margin:  EdgeInsets.fromLTRB(0*fem, 11*fem, 53*fem, 10.5*fem),
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // groupmsv (I2:2604;15:40)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
    width:  14*fem,
    height:  14*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Text(
    // textthe (I2:2604;15:31)
    'Search House, Apartment, etc',
    style:  GoogleFonts.raleway (

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w400,
    height:  1.175*ffem/fem,
    letterSpacing:  0.36*fem,
    color:  Color(0xffa1a4c1),
    ),
    ),
    ],
    ),
    ),
    Container(
    // iconmicactiveRha (I2:2604;221:168)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.5*fem),
    width:  11.67*fem,
    height:  16.67*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ],
    ),
    ),
    Container(
    // categoryL3r (2:2599)
    margin:  EdgeInsets.fromLTRB(16*fem, 0*fem, 0*fem, 18*fem),
    height:  47*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // buttoncategoryroundedactiveeqE (2:2600)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 14.5*fem),
    width:  62*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xff234f68),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layoutm9A (I2:2600;222:469)
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
    // buttoncategoryroundedTng (2:2601)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 11.5*fem),
    width:  80*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layoutPAY (I2:2601;222:473)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    'House',
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
    // buttoncategoryroundedUSt (2:2602)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 11.5*fem),
    width:  101*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layoutQLY (I2:2602;222:473)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    'Apartment',
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
    // buttoncategoryroundedWuN (2:2603)
    padding:  EdgeInsets.fromLTRB(24*fem, 17.5*fem, 24*fem, 11.5*fem),
    width:  80*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(20*fem),
    ),
    child:
    Container(
    // layout3PW (I2:2603;222:473)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    'House',
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
    ],
    ),
    ),
    Container(
    // autogroup7w2qADE (US5motMqtnng1DxbEk7w2Q)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // autogroupebsyhDA (US5n48T7RFzQTpbt6neBSY)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 1*fem),
    padding:  EdgeInsets.fromLTRB(0*fem, 43*fem, 0*fem, 0*fem),
    width:  270*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(25*fem),
    color:  Color(0x63000000),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image: AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textYja (2:2650)
    margin:  EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 7*fem),
    constraints:  BoxConstraints (
    maxWidth:  103*fem,
    ),
    child:
    Text(
    'Halloween \nSale!',
    style:  GoogleFonts.raleway (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.175*ffem/fem,
    letterSpacing:  0.54*fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    Container(
    // textSKA (2:2651)
    margin:  EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 19*fem),
    child:
    Text(
    'All discount up to 60%',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w400,
    height:  1.175*ffem/fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    Container(
    // autogroupy7b6k4x (US5nANmhhg8bxnVrLbY7b6)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 177*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(34*fem, 26*fem, 42*fem, 22.92*fem),
    decoration:  BoxDecoration (
    color:  Color(0xff234f68),
    borderRadius:  BorderRadius.only (
    topRight:  Radius.circular(25*fem),
    ),
    ),
    child:
    Center(
    // groupSTa (2:2653)
    child:
    SizedBox(
    width:  17*fem,
    height:  7.08*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroupfel89sn (US5nGxR57vjXqQB8GafeL8)
    margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(0*fem, 37*fem, 0*fem, 0*fem),
    width:  270*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(25*fem),
    color:  Color(0x4c000000),
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
    // groupDMr (2:2619)
    margin:  EdgeInsets.fromLTRB(19*fem, 0*fem, 0*fem, 25*fem),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textMU4 (2:2620)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
    constraints:  BoxConstraints (
    maxWidth:  80*fem,
    ),
    child:
    Text(
    'Summer\nVacation',
    style:  GoogleFonts.raleway (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.175*ffem/fem,
    letterSpacing:  0.54*fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    Text(
    // textTmz (2:2621)
    'All discount up to 60%',
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w400,
    height:  1.175*ffem/fem,
    color:  Color(0xffffffff),
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroupwpowcet (US5nMhnAJ5oSew4DtbWPoW)
    padding:  EdgeInsets.fromLTRB(35*fem, 25*fem, 41*fem, 23.92*fem),
    width:  93*fem,
    decoration:  BoxDecoration (
    color:  Color(0xff234f68),
    borderRadius:  BorderRadius.only (
    topRight:  Radius.circular(25*fem),
    ),
    ),
    child:
    Center(
    // groupLqn (2:2623)
    child:
    SizedBox(
    width:  17*fem,
    height:  7.08*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    Container(
    // itemheadertextbuttonwidesKv (2:2598)
    margin:  EdgeInsets.fromLTRB(17*fem, 0*fem, 23*fem, 0*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // featuredestatesBbW (I2:2598;15:71)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 143*fem, 0*fem),
    child:
    Text(
    'Featured Estates',
    style:  GoogleFonts.lato (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2*ffem/fem,
    letterSpacing:  0.54*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    Container(
    // text6Ta (I2:2598;221:2214)
    margin:  EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 0*fem),
    child:
    Text(
    'view all',
    textAlign:  TextAlign.right,
    style:  GoogleFonts.raleway (

    fontSize:  10*ffem,
    fontWeight:  FontWeight.w600,
    height:  0.9*ffem/fem,
    letterSpacing:  0.3*fem,
    color:  Color(0xff234f68),
    ),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroupdn9eDYC (US5njCAMWUXZjSwQ4ydN9e)
    width:  double.infinity,
    height:  222*fem,
    child:
    Stack(
    children:  [
    Positioned(
    // menuhomeATS (2:2606)
    left:  0*fem,
    top:  132*fem,
    child:
    Container(
    padding:  EdgeInsets.fromLTRB(63*fem, 30*fem, 62*fem, 26*fem),
    width:  375*fem,
    height:  90*fem,
    decoration:  BoxDecoration (
    color:  Color(0xe5ffffff),
    borderRadius:  BorderRadius.only (
    bottomRight:  Radius.circular(50*fem),
    bottomLeft:  Radius.circular(50*fem),
    ),
    ),
    child:
    ClipRect(
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  12.5*fem,
    sigmaY:  12.5*fem,
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconhouseactiveNpQ (I2:2606;260:2395)
    width:  25*fem,
    height:  34*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  50*fem,
    ),
    Container(
    // iconzoomq5i (I2:2606;260:2394)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
    width:  25*fem,
    height:  25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  50*fem,
    ),
    Container(
    // iconheartXz8 (I2:2606;260:2367)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
    width:  25*fem,
    height:  25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  50*fem,
    ),
    Container(
    // iconprofileqE8 (I2:2606;260:2393)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
    width:  25*fem,
    height:  25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // layout8yv (2:2627)
    left:  0*fem,
    top:  0*fem,
    child:
    Container(
    width:  546*fem,
    height:  156*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // estatescardhorizontalshortyDr (2:2628)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 24*fem, 8*fem),
    width:  268*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(25*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // shapee56 (2:2629)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 8*fem, 8*fem),
    width:  126*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0x14884af6),
    borderRadius:  BorderRadius.circular(18*fem),
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
    // buttonfavoriteumi (2:2635)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 74*fem),
    width:  25*fem,
    height:  25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ClipRect(
    // buttoncategorysquaretextsmallR (2:2631)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  4*fem,
    sigmaY:  4*fem,
    ),
    child:
    Container(
    padding:  EdgeInsets.fromLTRB(7*fem, 7*fem, 7*fem, 5*fem),
    width:  74*fem,
    height:  25*fem,
    decoration:  BoxDecoration (
    color:  Color(0xaf3f467c),
    borderRadius:  BorderRadius.circular(8*fem),
    ),
    child:
    Container(
    // layouthBn (2:2632)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // text2E4 (2:2633)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 0*fem),
    child:
    Text(
    '🏢',
    style:  GoogleFonts.raleway (

    fontSize:  11*ffem,
    fontWeight:  FontWeight.w400,
    height:  1.175*ffem/fem,
    letterSpacing:  0.33*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    Container(
    // textKyr (2:2634)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
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
    ],
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroupqovrdzY (US5nzX49iujAuQsRw6QoVr)
    margin:  EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 13*fem),
    width:  94*fem,
    height:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // layouty2p (2:2639)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28*fem),
    width:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textJqn (2:2640)
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
    // layoutbpt (2:2641)
    margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
    width:  77.25*fem,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // layout95i (2:2642)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 8.5*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconstarsmallUtg (2:2643)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2.75*fem, 0*fem),
    width:  7.5*fem,
    height:  7.13*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Text(
    // textbiQ (2:2644)
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
    // layoutYde (2:2645)
    margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconlocationHLL (2:2646)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.5*fem, 1*fem),
    width:  6*fem,
    height:  7.5*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Text(
    // textBwW (2:2647)
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
    Container(
    // layoutjTE (2:2636)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.end,
    children:  [
    Text(
    // 4kQ (2:2637)
    '\$ 290',
    style:  GoogleFonts.montserrat (

    fontSize:  16*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.2175*ffem/fem,
    letterSpacing:  0.48*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    Text(
    // textohz (2:2638)
    '/month',
    style:  GoogleFonts.montserrat (

    fontSize:  8*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.625*ffem/fem,
    letterSpacing:  0.24*fem,
    color:  Color(0xff252b5c),
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
    Container(
    // estatescardhorizontalshortMDi (2:2648)
    padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 24*fem, 8*fem),
    width:  268*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(25*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // shapeTnY (I2:2648;222:372)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 8*fem, 8*fem),
    width:  126*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0x14884af6),
    borderRadius:  BorderRadius.circular(18*fem),
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
    // component899a (I2:2648;251:546)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 72*fem),
    width:  25*fem,
    height:  25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ClipRect(
    // buttoncategorysquaretextsmalle (I2:2648;251:542)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  4*fem,
    sigmaY:  4*fem,
    ),
    child:
    Container(
    width:  38*fem,
    height:  27*fem,
    decoration:  BoxDecoration (
    color:  Color(0xaf3f467c),
    borderRadius:  BorderRadius.circular(8*fem),
    ),
    child:
    Center(
    child:
    Text(
    'Villa',
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
    // autogroup4km2hKW (US5omVmCxhwoJMKcSv4Km2)
    margin:  EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 13*fem),
    width:  94*fem,
    height:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // layout2sa (I2:2648;251:560)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28*fem),
    width:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textNwS (I2:2648;222:364)
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
    // layoutt96 (I2:2648;251:559)
    margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
    width:  77.25*fem,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // layoutpYY (I2:2648;222:366)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 52*fem, 8.5*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconstarsmallN4G (I2:2648;222:367)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2.75*fem, 0*fem),
    width:  7.5*fem,
    height:  7.13*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Text(
    // textGvL (I2:2648;222:368)
    '4.2 ',
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
    // layoutpS4 (I2:2648;222:369)
    margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconlocationAkp (I2:2648;222:370)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.5*fem, 1*fem),
    width:  6*fem,
    height:  7.5*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Text(
    // text68g (I2:2648;222:371)
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
    Container(
    // layoutdPW (I2:2648;251:570)
    width:  78*fem,
    height:  20*fem,
    child:
    Stack(
    children:  [
    Positioned(
    // textNbz (I2:2648;251:571)
    left:  0*fem,
    top:  0*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  47*fem,
    height:  20*fem,
    child:
    Text(
    '\$ 220',
    style:  GoogleFonts.montserrat(
    
    fontSize:  16*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.2175*ffem/fem,
    letterSpacing:  0.48*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // monthTtL (I2:2648;251:572)
    left:  46*fem,
    top:  7*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  32*fem,
    height:  13*fem,
    child:
    Text(
    '/month',
    style:  GoogleFonts.montserrat (
 
    fontSize:  8*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.625*ffem/fem,
    letterSpacing:  0.24*fem,
    color:  Color(0xff252b5c),
    ),
    ),
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
    );
  }
}
