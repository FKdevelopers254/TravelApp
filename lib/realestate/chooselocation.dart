import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RChooseLocation extends StatefulWidget {
  const RChooseLocation({Key? key}) : super(key: key);

  @override
  State<RChooseLocation> createState() => _RChooseLocationState();
}

class _RChooseLocationState extends State<RChooseLocation> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // accountsetuplocationemptyG8g (2:2358)
      padding:  EdgeInsets.fromLTRB(24*fem, 24*fem, 24*fem, 30*fem),
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
            // headerW32 (2:2366)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 51*fem),
            width:  double.infinity,
            height:  50*fem,
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // buttonbacksolidcrk (2:2367)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 191*fem, 0*fem),
                  width:  50*fem,
                  height:  50*fem,
                  child:
                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                ),
                ClipRect(
                  // buttonsmalliet (2:2368)
                  child:
                  BackdropFilter(
                    filter:  ImageFilter.blur (
                      sigmaX:  6*fem,
                      sigmaY:  6*fem,
                    ),
                    child:
                    Container(
                      margin:  EdgeInsets.fromLTRB(0*fem, 7*fem, 0*fem, 5*fem),
                      width:  86*fem,
                      height:  double.infinity,
                      decoration:  BoxDecoration (
                        color:  Color(0xfff5f4f7),
                        borderRadius:  BorderRadius.circular(100*fem),
                      ),
                      child:
                      Center(
                        child:
                        Text(
                          'skip',
                          style:  GoogleFonts.montserrat (
                           
                            fontSize:  12*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.8333333333*ffem/fem,
                            letterSpacing:  0.36*fem,
                            color:  Color(0xff3a3f67),
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
            // titleLgG (2:2363)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 53*fem, 33*fem),
            width:  274*fem,
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children:  [
                Container(
                  // titleUnU (2:2364)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
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
                          text:  'Add your ',
                          style:  GoogleFonts.lato (

                            fontSize:  25*ffem,
                            fontWeight:  FontWeight.w500,
                            height:  1.6*ffem/fem,
                            letterSpacing:  0.75*fem,
                            color:  Color(0xff252b5c),
                          ),
                        ),
                        TextSpan(
                          text:  'location ',
                          style:  GoogleFonts.lato (

                            fontSize:  25*ffem,
                            fontWeight:  FontWeight.w800,
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
                  // descriptionS8x (2:2365)
                  'You can edit this later on your account setting.',
                  style:  GoogleFonts.dmSans (

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
            // autogroupeqoekfS (US5SpbfXqSNm4XTm2UEqoe)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
            width:  double.infinity,
            height:  300*fem,
            decoration:  BoxDecoration (
              borderRadius:  BorderRadius.circular(25*fem),
              image:  DecorationImage (
                fit:  BoxFit.cover,
                image:  AssetImage('assets/images/kozi3.jpg'),
              ),
            ),
            child:
            Stack(
              children:  [
                Positioned(
                  // shape2cx (2:2370)
                  left:  0*fem,
                  top:  250*fem,
                  child:
                  ClipRect(
                    child:
                    BackdropFilter(
                      filter:  ImageFilter.blur (
                        sigmaX:  10*fem,
                        sigmaY:  10*fem,
                      ),
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  327*fem,
                          height:  50*fem,
                          child:
                          Container(
                            decoration:  BoxDecoration (
                              borderRadius:  BorderRadius.circular(15*fem),
                              color:  Color(0x7fffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // selectonmapgxQ (2:2371)
                  left:  122*fem,
                  top:  265*fem,
                  child:
                  Align(
                    child:
                    SizedBox(
                      width:  84*fem,
                      height:  20*fem,
                      child:
                      Text(
                        'select on map',
                        textAlign:  TextAlign.center,
                        style:  GoogleFonts.raleway (

                          fontSize:  12*ffem,
                          fontWeight:  FontWeight.w400,
                          height:  1.6666666667*ffem/fem,
                          letterSpacing:  0.36*fem,
                          color:  Color(0xff252b5c),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // formlocationemptyB8U (2:2362)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 67*fem),
            padding:  EdgeInsets.fromLTRB(19.33*fem, 26.67*fem, 23.5*fem, 26.67*fem),
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
                  // layouteXr (I2:2362;403:3418)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 164.5*fem, 0*fem),
                  height:  double.infinity,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.end,
                    children:  [
                      Container(
                        // iconlocationorangeBGt (I2:2362;403:3440)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 13.33*fem, 0*fem),
                        width:  13.33*fem,
                        height:  16.67*fem,
                        child:
                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                      ),
                      Container(
                        // textG3S (I2:2362;403:3424)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0.33*fem),
                        child:
                        Text(
                          'Location detail',
                          style:  GoogleFonts.raleway (

                            fontSize:  12*ffem,
                            fontWeight:  FontWeight.w400,
                            height:  1.175*ffem/fem,
                            letterSpacing:  0.36*fem,
                            color:  Color(0xffa1a4c1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // iconchevronrightNMN (I2:2362;403:3425)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                  width:  5*fem,
                  height:  10*fem,
                  child:
                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                ),
              ],
            ),
          ),
          Container(
            // autogroupkbswUvC (US5SugMQ9RuQFi8ALfKBsW)
            margin:  EdgeInsets.fromLTRB(33*fem, 0*fem, 16*fem, 0*fem),
            width:  double.infinity,
            height:  63*fem,
            decoration:  BoxDecoration (
              color:  Color(0xff8bc83f),
              borderRadius:  BorderRadius.circular(10*fem),
            ),
            child:
            Center(
              child:
              Text(
                'Next',
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
