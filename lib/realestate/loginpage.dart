import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class RLoginPage extends StatefulWidget {
  const RLoginPage({Key? key}) : super(key: key);

  @override
  State<RLoginPage> createState() => _RLoginPageState();
}

class _RLoginPageState extends State<RLoginPage> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // loginoptionPW8 (2:2077)
      padding:  EdgeInsets.fromLTRB(13*fem, 17*fem, 12*fem, 24*fem),
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  const Color(0xffffffff),
        borderRadius:  BorderRadius.circular(50*fem),
      ),
      child:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
            // autogroupxxgcF2Y (US58rXmYYMPCyN4QC4XXGC)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
            width:  double.infinity,
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // rectangle8wvx (2:2084)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                  width:  171*fem,
                  height:  174*fem,
                  child:
                  ClipRRect(
                    borderRadius:  BorderRadius.circular(20*fem),
                    child:
                    const Image(image: AssetImage('assets/images/kozi3.jpg'),),
                  ),
                ),
                Container(
                  // rectangle11e4g (2:2087)
                  width:  171*fem,
                  height:  174*fem,
                  child:
                  ClipRRect(
                    borderRadius:  BorderRadius.circular(20*fem),
                    child:
                    Image(image: AssetImage('assets/images/kozi3.jpg'),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // autogrouplft6NFa (US58yMuVoyqBdDa9tgLFT6)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 53*fem),
            width:  double.infinity,
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // rectangle9WMn (2:2085)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                  width:  171*fem,
                  height:  174*fem,
                  child:
                  ClipRRect(
                    borderRadius:  BorderRadius.circular(20*fem),
                    child:
                    const Image(image: AssetImage('assets/images/kozi3.jpg'),),
                  ),
                ),
                Container(
                  // rectangle10cvc (2:2086)
                  width:  171*fem,
                  height:  174*fem,
                  child:
                  ClipRRect(
                    borderRadius:  BorderRadius.circular(20*fem),
                    child:
                    const Image(image: AssetImage('assets/images/kozi3.jpg'),),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // titleZ5A (2:2083)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 115*fem, 50*fem),
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
                    text:  'Ready to ',
                    style:  GoogleFonts.lato (

                      fontSize:  25*ffem,
                      fontWeight:  FontWeight.w500,
                      height:  1.6*ffem/fem,
                      letterSpacing:  0.75*fem,
                      color:  Color(0xff252b5c),
                    ),
                  ),
                  TextSpan(
                    text:  'explore?',
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
          Container(
            // autogroupnakgkJ4 (US595h4HNrb4ibQx42nakG)
            margin:  EdgeInsets.fromLTRB(36*fem, 0*fem, 36*fem, 41*fem),
            padding:  EdgeInsets.fromLTRB(55.67*fem, 24*fem, 45*fem, 19*fem),
            width:  double.infinity,
            decoration:  BoxDecoration (
              color:  Color(0xff8bc83f),
              borderRadius:  BorderRadius.circular(10*fem),
            ),
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // iconemailr6C (2:2089)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 6.67*fem, 4*fem),
                  width:  16.67*fem,
                  height:  11.67*fem,
                  child:
                  Image(image: AssetImage('assets/images/kozi3.jpg'),),
                ),
                Text(
                  // textM2x (2:2090)
                  'Continue with Email',
                  textAlign:  TextAlign.center,
                  style:  GoogleFonts.lato (

                    fontSize:  16*ffem,
                    fontWeight:  FontWeight.w700,
                    height:  1.2*ffem/fem,
                    letterSpacing:  0.48*fem,
                    color:  Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // login5je (2:2079)
            margin:  EdgeInsets.fromLTRB(11*fem, 0*fem, 12*fem, 35*fem),
            width:  double.infinity,
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // itemseparatorpBS (2:2082)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                  width:  double.infinity,
                  height:  22*fem,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        // vector58hv (I2:2082;332:2221)
                        left:  0*fem,
                        top:  10.9999694824*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  327*fem,
                            height:  0*fem,
                            child:
                            Image(image: AssetImage('assets/images/kozi3.jpg'),),
                          ),
                        ),
                      ),
                      Positioned(
                        // january12202234C (I2:2082;332:2224)
                        left:  145.5*fem,
                        top:  0*fem,
                        child:
                        Container(
                          width:  35*fem,
                          height:  22*fem,
                          decoration:  BoxDecoration (
                            color:  Color(0xffffffff),
                          ),
                          child:
                          Center(
                            child:
                            Text(
                              'OR',
                              textAlign:  TextAlign.center,
                              style:  GoogleFonts.raleway (

                                fontSize:  10*ffem,
                                fontWeight:  FontWeight.w600,
                                height:  1.175*ffem/fem,
                                letterSpacing:  0.3*fem,
                                color:  Color(0xffa1a4c1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupasuuFg4 (US59GBko8g75UcX4NbAsUU)
                  width:  double.infinity,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // buttonsocmedpDN (2:2080)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                        width:  158.5*fem,
                        height:  70*fem,
                        child:
                        Image(image: AssetImage('assets/images/kozi3.jpg'),),
                      ),
                      Container(
                        // buttonsocmedX7n (2:2081)
                        width:  158.5*fem,
                        height:  70*fem,
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
            // register47i (2:2078)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
            child:
            RichText(
              text:
              TextSpan(
                style:  GoogleFonts.raleway (

                  fontSize:  12*ffem,
                  fontWeight:  FontWeight.w400,
                  height:  1.6666666667*ffem/fem,
                  letterSpacing:  0.36*fem,
                  color:  Color(0xff53577a),
                ),
                children:  [
                  TextSpan(
                    text:  'Don’t have an account?',
                    style:  GoogleFonts.lato (

                      fontSize:  12*ffem,
                      fontWeight:  FontWeight.w400,
                      height:  1.6666666667*ffem/fem,
                      letterSpacing:  0.36*fem,
                      color:  Color(0xff53577a),
                    ),
                  ),
                  TextSpan(
                    text:  ' ',
                    style:  GoogleFonts.lato (

                      fontSize:  12*ffem,
                      fontWeight:  FontWeight.w700,
                      height:  1.6666666667*ffem/fem,
                      letterSpacing:  0.36*fem,
                      color:  Color(0xff53577a),
                    ),
                  ),
                  TextSpan(
                    text:  'Register',
                    style:  GoogleFonts.lato (

                      fontSize:  12*ffem,
                      fontWeight:  FontWeight.w700,
                      height:  1.6666666667*ffem/fem,
                      letterSpacing:  0.36*fem,
                      color:  Color(0xff1f4c6b),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
