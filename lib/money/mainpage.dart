import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MHomePage extends StatefulWidget {
  const MHomePage({Key? key}) : super(key: key);

  @override
  State<MHomePage> createState() => _MHomePageState();
}

class _MHomePageState extends State<MHomePage> {
  double fem=1;
  double ffem= 0.9;
  @override
  Widget build(BuildContext context) {
    return Container(
      // splashscreenx7z (2:3)
      width:  double.infinity,
      height:  812*fem,
      decoration:  BoxDecoration (
        color:  Color(0xff002d57),
      ),
      child:
      Stack(
        children:  [
        Positioned(
        // ellipse12de (2:4)
        left:  0*fem,
        top:  0*fem,
        child:
        Align(
          child:
          SizedBox(
            width:  484*fem,
            height:  484*fem,
            child:
            Container(
              decoration:  BoxDecoration (
                borderRadius:  BorderRadius.circular(242*fem),
                color:  Color(0xfffe6310),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        // ellipse2WHv (2:5)
        left:  0*fem,
        top:  362*fem,
        child:
        Align(
          child:
          SizedBox(
            width:  630*fem,
            height:  630*fem,
            child:
            Container(
              decoration:  BoxDecoration (
                  borderRadius:  BorderRadius.circular(315*fem),
                  border:  Border.all(color:Color(0xffffd703)),
            ),
          ),
        ),
      ),
    ),
    Positioned(
    // ellipse3DTE (2:6)
    left:  20*fem,
    top:  54*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  22*fem,
    height:  22*fem,
    child:
    Container(
    decoration:  BoxDecoration (
    borderRadius:  BorderRadius.circular(11*fem),
    color:  Color(0xffffffff),
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // bankappvcY (2:7)
    left:  52*fem,
    top:  54*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  85*fem,
    height:  22*fem,
    child:
    Text(
    'Bank App',
    style:  GoogleFonts.inter (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2125*ffem/fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // createbankaccountin3minutesNzL (2:8)
    left:  20*fem,
    top:  134*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  217*fem,
    height:  131*fem,
    child:
    Text(
    'Create Bank account in 3 minutes',
    style:  GoogleFonts.inter (

    fontSize:  36*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2125*ffem/fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // easyfastsecureqd2 (2:9)
    left:  20*fem,
    top:  293*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  90*fem,
    height:  88*fem,
    child:
    Text(
    'Easy.\nFast.\nSecure.',
    style:  GoogleFonts.inter (

    fontSize:  24*ffem,
    fontWeight:  FontWeight.w700,
    height:  1.2125*ffem/fem,
    color:  Color(0xff002d57),
    ),
    ),
    ),
    ),
    ),
    Positioned(
    // category8s2 (2:10)
    left:  327.4998779297*fem,
    top:  52.5*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  25*fem,
    height:  25*fem,
    child:
    Image(image: AssetImage('assets/images/kozi3.jpg'),),
    ),
    ),
    ),
    Positioned(
    // frame1Ssi (2:18)
    left:  20*fem,
    top:  663*fem,
    child:
    Container(
    padding:  EdgeInsets.fromLTRB(99*fem, 22*fem, 76*fem, 22*fem),
    width:  335*fem,
    height:  66*fem,
    decoration:  BoxDecoration (
    color:  Color(0xffffd703),
    borderRadius:  BorderRadius.circular(10*fem),
    ),
    child:
    Row(
    crossAxisAlignment:  CrossAxisAlignment.center,
    children:  [
    Container(
    // createaccountLy6 (2:16)
    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
    child:
    Text(
    'Create Account',
    style:  GoogleFonts.inter (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w600,
    height:  1.2125*ffem/fem,
    color:  Color(0xff000000),
    ),
    ),
    ),
    Container(
    // ellipse4sTE (2:17)
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
    ),
    Positioned(
    // alreadymemberQi4 (2:19)
    left:  110*fem,
    top:  746*fem,
    child:
    Align(
    child:
    SizedBox(
    width:  152*fem,
    height:  22*fem,
    child:
    Text(
    'Already Member?',
    style:  GoogleFonts.inter (

    fontSize:  18*ffem,
    fontWeight:  FontWeight.w500,
    height:  1.2125*ffem/fem,
    color:  Color(0xffffffff),
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    );
  }
}
