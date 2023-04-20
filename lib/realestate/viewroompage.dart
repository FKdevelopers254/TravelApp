import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RViewRoom extends StatefulWidget {
  const RViewRoom({Key? key}) : super(key: key);

  @override
  State<RViewRoom> createState() => _RViewRoomState();
}

class _RViewRoomState extends State<RViewRoom> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // detail360vieww9z (2:3557)
      padding:  EdgeInsets.fromLTRB(10*fem, 24*fem, 10*fem, 24*fem),
      width:  double.infinity,
      decoration:  BoxDecoration (
          border:  Border.all(color:Color(0xffffffff)),
      borderRadius:  BorderRadius.circular(50*fem),
      image:  DecorationImage (
        image:  AssetImage('assets/images/kozi3.jpg'),
      ),
    ),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // buttonbacktransparentYvU (2:3570)
    margin:  EdgeInsets.fromLTRB(15*fem, 0*fem, 0*fem, 94*fem),
    width:  50*fem,
    height:  50*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // autogrouppfk4F4C (US7SFXq6Hzyxvy9qroPFk4)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 72*fem),
    width:  double.infinity,
    height:  365*fem,
    child:
    Stack(
    children:  [
    Positioned(
    // sliderAwr (2:3562)
    left:  0*fem,
    top:  197*fem,
    child:
    Container(
    width:  355*fem,
    height:  83*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    ClipRect(
    // buttonmoveleftf7v (2:3564)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  6*fem,
    sigmaY:  6*fem,
    ),
    child:
    Container(
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 275*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(11.4*fem, 36.5*fem, 15.4*fem, 36.6*fem),
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0x3fffffff),
    borderRadius:  BorderRadius.only (
    topRight:  Radius.circular(18*fem),
    bottomRight:  Radius.circular(18*fem),
    ),
    ),
    child:
    Center(
    // iconnextVck (I2:3564;280:843)
    child:
    SizedBox(
    width:  13.2*fem,
    height:  9.9*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    ),
    ),
    ClipRect(
    // buttonmoverightyH2 (2:3563)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  6*fem,
    sigmaY:  6*fem,
    ),
    child:
    Container(
    padding:  EdgeInsets.fromLTRB(15.4*fem, 36.5*fem, 11.4*fem, 36.6*fem),
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0x3fffffff),
    borderRadius:  BorderRadius.only (
    topLeft:  Radius.circular(18*fem),
    bottomLeft:  Radius.circular(18*fem),
    ),
    ),
    child:
    Center(
    // iconnextqq2 (I2:3563;280:810)
    child:
    SizedBox(
    width:  13.2*fem,
    height:  9.9*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    Positioned(
    // scandetailmTn (2:3565)
    left:  14*fem,
    top:  0*fem,
    child:
    Container(
    width:  287*fem,
    height:  365*fem,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.end,
    children:  [
    Container(
    // scanobjectHh2 (2:3567)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 95*fem),
    width:  20*fem,
    height:  20*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // scanobjectPk4 (2:3566)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 267*fem, 44*fem),
    width:  20*fem,
    height:  20*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // scanobjectselectedhVr (2:3569)
    margin:  EdgeInsets.fromLTRB(57*fem, 0*fem, 67*fem, 112*fem),
    width:  double.infinity,
    height:  54*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // scanobjectactiveDUC (I2:3569;280:816)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
    width:  35*fem,
    height:  35*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ClipRect(
    // scanobjectdescriptionGxG (I2:3569;280:885)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  6*fem,
    sigmaY:  6*fem,
    ),
    child:
    Container(
    padding:  EdgeInsets.fromLTRB(14*fem, 12*fem, 14*fem, 14*fem),
    width:  121*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xccffffff),
    borderRadius:  BorderRadius.circular(15*fem),
    ),
    child:
    Container(
    // layoutZAg (I2:3569;280:885;280:882)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // text7CC (I2:3569;280:885;280:880)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
    child:
    Text(
    'Jati dining table',
    style:  GoogleFonts.raleway (

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.175*ffem/fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    RichText(
    // text1oN (I2:3569;280:885;280:881)
    text:
    TextSpan(
    style:  GoogleFonts.raleway (

    fontSize:  8*ffem,
    fontWeight:  FontWeight.w400,
    height:  1.175*ffem/fem,
    color:  Color(0xff53577a),
    ),
    children:  [
    TextSpan(
    text:  '2',
    style:  GoogleFonts.montserrat (

    fontSize:  8*ffem,
    fontWeight:  FontWeight.w400,
    height:  1.2175*ffem/fem,
    color:  Color(0xff53577a),
    ),
    ),
    TextSpan(
    text:  ' people capacity',
    ),
    ],
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
    // scanobjectazt (2:3568)
    width:  20*fem,
    height:  20*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // propertydetailvYx (2:3558)
    margin:  EdgeInsets.fromLTRB(14*fem, 0*fem, 14*fem, 0*fem),
    width:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // autogroupt3r2rhW (US7SbXFnQ8doL429RPT3R2)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 13*fem),
    width:  double.infinity,
    height:  50*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    ClipRect(
    // itemroom9wW (2:3561)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  14*fem,
    sigmaY:  14*fem,
    ),
    child:
    Container(
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 155*fem, 0*fem),
    width:  122*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xaf1f4c6b),
    borderRadius:  BorderRadius.circular(25*fem),
    ),
    child:
    Center(
    child:
    Text(
    'Living Room',
    style:  GoogleFonts.raleway (

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.175*ffem/fem,
    letterSpacing:  0.36*fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    ),
    ),
    ),
    Container(
    // button360CPz (2:3560)
    width:  50*fem,
    height:  50*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ],
    ),
    ),
    Container(
    // estatescardwidefullKUc (2:3559)
    padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 41*fem, 8*fem),
    width:  double.infinity,
    height:  120*fem,
    decoration:  BoxDecoration (
    color:  Color(0xccffffff),
    borderRadius:  BorderRadius.circular(25*fem),
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
    // shapeyZA (I2:3559;277:1487)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(8*fem, 8*fem, 8*fem, 8*fem),
    width:  168*fem,
    height:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0x14884af6),
    borderRadius:  BorderRadius.circular(15*fem),
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
    // buttonfavoriteFWg (I2:3559;277:1490)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
    width:  25*fem,
    height:  25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ClipRect(
    // buttoncategorysquaretextsmallM (I2:3559;277:1489)
    child:
    BackdropFilter(
    filter:  ImageFilter.blur (
    sigmaX:  4*fem,
    sigmaY:  4*fem,
    ),
    child:
    Container(
    padding:  EdgeInsets.fromLTRB(7*fem, 7*fem, 7*fem, 3*fem),
    width:  57*fem,
    height:  23*fem,
    decoration:  BoxDecoration (
    color:  Color(0xaf1f4c6b),
    borderRadius:  BorderRadius.circular(8*fem),
    ),
    child:
    Container(
    // layoutPmJ (I2:3559;277:1489;251:539)
    width:  double.infinity,
    height:  double.infinity,
    child:
    Text(
    'Apartment',
    style:  GoogleFonts.raleway(

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
    // layoutiYg (I2:3559;277:1491)
    margin:  EdgeInsets.fromLTRB(0*fem, 12*fem, 0*fem, 21*fem),
    height:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // textTFN (I2:3559;277:1492)
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
    // layoutAQg (I2:3559;277:1493)
    margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
    width:  77.25*fem,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // layoutWDe (I2:3559;277:1494)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 8.5*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconstarsmallTeg (I2:3559;277:1495)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2.75*fem, 0*fem),
    width:  7.5*fem,
    height:  7.13*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Text(
    // textnBA (I2:3559;277:1496)
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
    // layoutj6Q (I2:3559;277:1497)
    margin:  EdgeInsets.fromLTRB(0.75*fem, 0*fem, 0*fem, 0*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // iconlocationsyJ (I2:3559;277:1498)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3.5*fem, 1*fem),
    width:  6*fem,
    height:  7.5*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Text(
    // text9fv (I2:3559;277:1499)
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
    ],
    ),
    ),
    ],
    ),
    );
  }
}
