import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MDetailsPage extends StatefulWidget {
  const MDetailsPage({Key? key}) : super(key: key);

  @override
  State<MDetailsPage> createState() => _MDetailsPageState();
}

class _MDetailsPageState extends State<MDetailsPage> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // homescreen7vY (2:141)
      width:  double.infinity,
      decoration:  BoxDecoration (
        color:  Color(0xffffffff),
      ),
      child:
      Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
      Container(
      // frame9Qek (2:238)
      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
      width:  double.infinity,
      height:  237*fem,
      decoration:  BoxDecoration (
        color:  Color(0xff002d57),
      ),
      child:
      Row(
          crossAxisAlignment:  CrossAxisAlignment.end,
          children:  [
      Container(
      // autogroupmwf6JEL (HipCuwLJoz13HYLBZmMwF6)
      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
      padding:  EdgeInsets.fromLTRB(187*fem, 185.25*fem, 53*fem, 74*fem),
      width:  429*fem,
      height:  429*fem,
      decoration:  BoxDecoration (
        color:  Color(0xfffe6310),
        borderRadius:  BorderRadius.circular(214.5*fem),
      ),
      child:
      Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
          Container(
            // arrowrightaBr (2:61)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 164*fem, 30.25*fem),
            width:  24.75*fem,
            height:  16.5*fem,
            child:
            Image(image: AssetImage('assets/images/kozi3.jpg'),),
          ),
          Container(
            // totalbalanceHrx (2:246)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 86*fem, 16*fem),
            child:
            Text(
              'Total Balance',
              style:  GoogleFonts.inter (

                fontSize:  16*ffem,
                fontWeight:  FontWeight.w500,
                height:  1.2125*ffem/fem,
                color:  Color(0xff000000),
              ),
            ),
          ),
          Container(
            // zWU (2:244)
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 73*fem, 35*fem),
            child:
            Text(
              '\$4,661.91',
              style:  GoogleFonts.inter (

                fontSize:  24*ffem,
                fontWeight:  FontWeight.w700,
                height:  1.2125*ffem/fem,
                color:  Color(0xffffffff),
              ),
            ),
          ),
          Container(
            // autogroup956qudS (HipD21zWXUusbgLVxV956Q)
            width:  double.infinity,
            child:
            Row(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // 4FS (2:242)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 51*fem, 0*fem),
                  child:
                  Text(
                    '**** 4661',
                    style:  GoogleFonts.inter (

                      fontSize:  18*ffem,
                      fontWeight:  FontWeight.w600,
                      height:  1.2125*ffem/fem,
                      color:  Color(0xffffffff),
                    ),
                  ),
                ),
                Text(
                  // N1E (2:243)
                  '12/26',
                  style:  GoogleFonts.inter (

                    fontSize:  18*ffem,
                    fontWeight:  FontWeight.w600,
                    height:  1.2125*ffem/fem,
                    color:  Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
    // autogroupmpmzuG4 (HipDA1mBmXyQZK5paimPMz)
    width:  164*fem,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // visa3NG (2:241)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 23*fem),
    width:  54*fem,
    height:  54*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // ellipse6ZbW (2:240)
    width:  double.infinity,
    height:  164*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(82*fem),
    border:  Border.all(color:Color(0xffffd703)),
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroupgypkVzx (HipAa64zyYaeaBaYsKGypk)
    margin:  EdgeInsets.fromLTRB(87*fem, 0*fem, 93*fem, 20*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // weeklypnL (2:247)
    margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 8*fem, 0*fem),
    child:
    Text(
    'Weekly',
    style:  GoogleFonts.inter (

    fontSize:  16*ffem,
    fontWeight:  FontWeight.w300,
    height:  1.2125*ffem/fem,
    color:  Color(0xff686868),
    ),
    ),
    ),
    Container(
    // line1MGU (2:250)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
    width:  1*fem,
    height:  23*fem,
    decoration:  BoxDecoration (
    color:  Color(0xff686868),
    ),
    ),
    Container(
    // monthlygZe (2:248)
    margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 8*fem, 0*fem),
    child:
    Text(
    'Monthly',
    style:  GoogleFonts.inter (

    fontSize:  16*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    Container(
    // line2QkY (2:251)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
    width:  1*fem,
    height:  23*fem,
    decoration:  BoxDecoration (
    color:  Color(0xff686868),
    ),
    ),
    Container(
    // yearlykZW (2:249)
    margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
    child:
    Text(
    'Yearly',
    style:  GoogleFonts.inter (

    fontSize:  16*ffem,
    fontWeight:  FontWeight.w300,
    height:  1.2125*ffem/fem,
    color:  Color(0xff686868),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroupv2y855z (HipApVpf4w1kDc7VaSv2Y8)
    width:  420.29*fem,
    height:  145*fem,
    child:
    Stack(
    children:  [
    Positioned(
    // line3DT6 (2:263)
    left:  276*fem,
    top:  61*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  1*fem,
    height:  79*fem,
    child:
    Container(
    decoration:  BoxDecoration (
    color:  Color(0xff002d57),
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // group11KW8 (1:11)
    left:  0*fem,
    top:  0*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  420.29*fem,
    height:  145*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    Positioned(
    // ellipse72QY (2:261)
    left:  270*fem,
    top:  41*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  12*fem,
    height:  12*fem,
    child:
    Container(
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(6*fem),
    color:  Color(0xffffd703),
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // 69W (2:262)
    left:  252*fem,
    top:  19*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  45*fem,
    height:  17*fem,
    child:
    Text(
    '\$3,811',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroup8whixSc (HipBHpNU9Soeq2AWNv8wHi)
    padding:  EdgeInsets.fromLTRB(19*fem, 0*fem, 18*fem, 24*fem),
    width:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // autogroup6jxlUA4 (HipAxaRXbSgxmeoe8E6jxL)
    margin:  EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 25*fem),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Text(
    // febCbr (2:252)
    'Feb',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    SizedBox(
    width:  36*fem,
    ),
    Text(
    // marumA (2:253)
    'Mar',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    SizedBox(
    width:  36*fem,
    ),
    Text(
    // apr256 (2:254)
    'Apr',
    style:  GoogleFonts.inter(

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    SizedBox(
    width:  36*fem,
    ),
    Text(
    // mayXGk (2:255)
    'May',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    SizedBox(
    width:  36*fem,
    ),
    Text(
    // jundag (2:256)
    'Jun',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    SizedBox(
    width:  36*fem,
    ),
    Text(
    // augYSk (2:257)
    'Aug',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    ],
    ),
    ),
    Container(
    // autogroupbpyntmW (HipB9EnRvBSLiVoQHsbpyn)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 13*fem),
    width:  double.infinity,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // transactionsqAx (2:157)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 192*fem, 0*fem),
    child:
    Text(
    'Transactions',
    style:  GoogleFonts.inter(

    fontSize:  16*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xff000000),
    ),
    ),
    ),
    Container(
    // seeall8fr (2:159)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
    child:
    Text(
    'See all',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xfffe6310),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // frame5ED6 (2:233)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 9*fem),
    width:  335*fem,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // frame495A (2:161)
    padding:  EdgeInsets.fromLTRB(8*fem, 9*fem, 8*fem, 10*fem),
    width:  double.infinity,
    height:  67*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // starbucksfZJ (2:163)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
    width:  48*fem,
    height:  48*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // autogroupskzanP2 (HipBe97wPQvDbkp7dgSKZA)
    margin:  EdgeInsets.fromLTRB(0*fem, 7*fem, 107*fem, 5*fem),
    height:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // starbucksVoE (2:164)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
    child:
    Text(
    'Starbucks',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    Text(
    // oct20211220oZ2 (2:166)
    '25 OCT 2021 12:20',
    style:  GoogleFonts.inter (

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    ],
    ),
    ),
    Container(
    // w9S (2:165)
    margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
    child:
    Text(
    '-\$5.81',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // frame32gg (2:167)
    padding:  EdgeInsets.fromLTRB(8*fem, 9*fem, 8*fem, 10*fem),
    width:  double.infinity,
    height:  67*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // spotifyYf2 (2:172)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
    width:  48*fem,
    height:  48*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // autogroupb1gtTX6 (HipBpJVg1PyVz88vG4b1gt)
    margin:  EdgeInsets.fromLTRB(0*fem, 7*fem, 108*fem, 5*fem),
    height:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // spotifymXn (2:169)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
    child:
    Text(
    'Spotify',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    Text(
    // oct20211220416 (2:171)
    '21 OCT 2021 12:20',
    style:  GoogleFonts.inter (

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    ],
    ),
    ),
    Container(
    // mw6 (2:170)
    margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
    child:
    Text(
    '-\$3.81',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    ],
    ),
    ),
    Container(
    // frame2h44 (2:173)
    padding:  EdgeInsets.fromLTRB(8*fem, 10*fem, 8*fem, 9*fem),
    width:  double.infinity,
    height:  67*fem,
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // netflixdesktopappbv8 (2:178)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
    width:  48*fem,
    height:  48*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    Container(
    // autogrouppungvBi (HipByt43eAj1DbqwRdpunG)
    margin:  EdgeInsets.fromLTRB(0*fem, 6*fem, 100*fem, 6*fem),
    height:  double.infinity,
    child:
    Column(
    crossAxisAlignment:  CrossAxisAlignment.start,
    children:  [
    Container(
    // netflix3n8 (2:175)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
    child:
    Text(
    'Netflix',
    style:  GoogleFonts.inter (

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    Text(
    // oct20211220A64 (2:177)
    '25 OCT 2021 12:20',
    style:  GoogleFonts.inter (

    fontSize:  12*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffa4a4a4),
    ),
    ),
    ],
    ),
    ),
    Container(
    // Get (2:176)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
    child:
    Text(
    '-\$15.81',
    style:  GoogleFonts.inter(

    fontSize:  14*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
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
    // frame2a9n (2:234)
    margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 2*fem, 0*fem),
    padding:  EdgeInsets.fromLTRB(93*fem, 22*fem, 76*fem, 22*fem),
    width:  double.infinity,
    decoration:  BoxDecoration (
    color:  Color(0xffffd703),
    borderRadius:  BorderRadius.circular(10*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // orderanewcardfwv (2:236)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
    child:
    Text(
    'Order a new card',
    style:  GoogleFonts.inter (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    Container(
    // ellipse4Atg (2:237)
    margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
    width:  13*fem,
    height:  13*fem,
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(6.5*fem),
    color:  Color(0xfffe6310),
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
