import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ROverallPage extends StatefulWidget {
  const ROverallPage({Key? key}) : super(key: key);

  @override
  State<ROverallPage> createState() => _ROverallPageState();
}

class _ROverallPageState extends State<ROverallPage> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // transactiondetailaddreviewfill (2:3474)
      padding:  EdgeInsets.fromLTRB(24*fem, 24*fem, 24*fem, 24*fem),
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
      // header6YQ (2:3487)
      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 125*fem, 50*fem),
      width:  double.infinity,
      child:
      Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
            // buttonbacksolid19a (2:3489)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 77*fem, 0*fem),
            width:  50*fem,
            height:  50*fem,
            child:
            Image(image: AssetImage('assets/images/kozi3.jpg'),),
          ),
          Container(
            // pagetitlerAC (2:3488)
            margin:  EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
            child:
            Text(
              'Add Review',
              textAlign:  TextAlign.center,
              style:  GoogleFonts.lato (

                fontSize:  14*ffem,
                fontWeight:  FontWeight.w700,
                height:  1.2*ffem/fem,
                color:  Color(0xff252b5c),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
    // titlewSY (2:3484)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 42*fem, 54.17*fem),
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // titleUBa (2:3485)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
    constraints:  BoxConstraints (
    maxWidth:  285*fem,
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
    text:  'Hi, how was your ',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    TextSpan(
    text:  'overall\nexperience?',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w800,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff1f4c6b),
    ),
    ),
    TextSpan(
    text:  ' ',
    style:  GoogleFonts.lato (

    fontSize:  25*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.6*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff1f4c6b),
    ),
    ),
    ],
    ),
    ),
    ),
    Text(
    // descriptionsmS (2:3486)
    'lorem ipsum dolor sit amet',
    style:  GoogleFonts.lato(

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w400,
    height:  1.6666666667*ffem/fem,
    letterSpacing:  0.36*fem,
    color:  Color(0xff53577a),
    ),
    ),
    ],
    ),
    ),
    Container(
    // formof6 (2:3478)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 50*fem),
    width:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // itemstarbigcounterfilljYk (2:3481)
    margin:  EdgeInsets.fromLTRB(3.34*fem, 0*fem, 47*fem, 24.17*fem),
    width:  double.infinity,
    height:  31.67*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // layout2nk (I2:3481;497:16633)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 18.33*fem, 0*fem),
    height:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // starfullgreyxRW (I2:3481;489:8582)
    width:  33.33*fem,
    height:  31.67*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  13.67*fem,
    ),
    Container(
    // starfullgrey7hi (I2:3481;497:16654)
    width:  33.33*fem,
    height:  31.67*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  13.67*fem,
    ),
    Container(
    // starfullgreyPQL (I2:3481;497:16658)
    width:  33.33*fem,
    height:  31.67*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  13.67*fem,
    ),
    Container(
    // starfullgreyHEp (I2:3481;497:16662)
    width:  33.33*fem,
    height:  31.67*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    SizedBox(
    width:  13.67*fem,
    ),
    Container(
    // staroutlineBqz (I2:3481;497:16638)
    width:  33.33*fem,
    height:  31.67*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ],
    ),
    ),
    Container(
    // 7Uk (I2:3481;497:16337)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
    child:
    Text(
    '4.0',
    style:  GoogleFonts.lato (
    fontSize:  25*ffem,
    fontWeight:  FontWeight.w800,
    height:  1.2*ffem/fem,
    letterSpacing:  0.75*fem,
    color:  Color(0xff1f4c6b),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // formtextareafilDng (2:3480)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
    padding:  EdgeInsets.fromLTRB(16*fem, 22*fem, 18.5*fem, 44*fem),
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
    // textJZE (I2:3480;497:16689)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 48.5*fem, 0*fem),
    constraints:  BoxConstraints (
    maxWidth:  229*fem,
    ),
    child:
    Text(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ',
    style:  GoogleFonts.lato (

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.5*ffem/fem,
    letterSpacing:  0.36*fem,
    color:  Color(0xff252b5c),
    ),
    ),
    ),
    Container(
    // iconmessagingPKn (I2:3480;497:16688)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28.09*fem),
    width:  15*fem,
    height:  14.91*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ],
    ),
    ),
    Container(
    // autogroupb7qafHJ (US7Nadwpy6V8Pj1vE3b7qa)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 15*fem),
    width:  double.infinity,
    height:  161*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // photosgallerybigBWY (2:3479)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(129*fem, 0*fem, 0*fem, 0*fem),
    height:  double.infinity,
    decoration:  BoxDecoration (
    border:  Border.all(color:Color(0xfff5f4f7)),
    borderRadius:  BorderRadius.circular(25*fem),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:  AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    child:
    Align(
    // buttoneditrcg (I2:3479;497:15543)
    alignment:  Alignment.topRight,
    child:
    SizedBox(
    width:  30*fem,
    height:  30*fem,
    child:
    Container(
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 131*fem),
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    ),
    Container(
    // photosgallerybig8aC (2:3483)
    padding:  EdgeInsets.fromLTRB(129*fem, 0*fem, 0*fem, 0*fem),
    height:  double.infinity,
    decoration:  BoxDecoration (
    border:  Border.all(color:Color(0xfff5f4f7)),
    borderRadius:  BorderRadius.circular(25*fem),
    image:  DecorationImage (
    fit:  BoxFit.cover,
    image:  AssetImage('assets/images/kozi3.jpg'),
    ),
    ),
    child:
    Align(
    // buttoneditowE (I2:3483;497:15543)
    alignment:  Alignment.topRight,
    child:
    SizedBox(
    width:  30*fem,
    height:  30*fem,
    child:
    Container(
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 131*fem),
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // formaddimage5tk (2:3482)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 249*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(31.93*fem, 31.93*fem, 31.93*fem, 31.93*fem),
    decoration:  BoxDecoration (
    color:  Color(0xfff5f4f7),
    borderRadius:  BorderRadius.circular(25*fem),
    ),
    child:
    Center(
    // iconplusxBr (I2:3482;489:9208)
    child:
    SizedBox(
    width:  14.14*fem,
    height:  14.14*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // buttonwidetextfrx (2:3475)
    margin:  EdgeInsets.fromLTRB(25*fem, 0*fem, 26*fem, 0*fem),
    width:  double.infinity,
    height:  70*fem,
    decoration:  BoxDecoration (
    color:  Color(0xff8bc83f),
    borderRadius:  BorderRadius.circular(10*fem),
    ),
    child:
    Center(
    child:
    Text(
    'Submit',
    textAlign:  TextAlign.center,
    style:  GoogleFonts.lato (

    fontSize:  16*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2*ffem/fem,
    letterSpacing:  0.48*fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    ),
    ],
    ),
    );
  }
}
