 import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MMoneyPage extends StatefulWidget {
   const MMoneyPage({Key? key}) : super(key: key);

   @override
   State<MMoneyPage> createState() => _MMoneyPageState();
 }

 class _MMoneyPageState extends State<MMoneyPage> {
   double fem=1;
   double ffem= 0.9;
   @override
   Widget build(BuildContext context) {
     return Container(
       // homescreen4kG (2:20)
       width:  double.infinity,
       decoration:  BoxDecoration (
         color:  Color(0xffffffff),
       ),
       child:
       Column(
         crossAxisAlignment:  CrossAxisAlignment.center,
         children:  [
           Container(
             // autogrouptyt4NFA (Hip6gHPafWj14wvZ9Dtyt4)
             padding:  EdgeInsets.fromLTRB(20*fem, 52.5*fem, 0*fem, 15*fem),
             width:  double.infinity,
             child:
             Column(
               crossAxisAlignment:  CrossAxisAlignment.center,
               children:  [
                 Container(
                   // autogroupjloasSp (Hip5mZQS33HtVcZXmoJLoA)
                   margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 22.5*fem, 30.5*fem),
                   child:
                   Row(
                     crossAxisAlignment:  CrossAxisAlignment.center,
                     children:  [
                       Container(
                         // ellipse3CEC (2:23)
                         margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                         width:  22*fem,
                         height:  22*fem,
                         decoration:  BoxDecoration (
                           borderRadius:  BorderRadius.circular(11*fem),
                           color:  Color(0xfffe6310),
                         ),
                       ),
                       Container(
                         // bankappuPW (2:24)
                         margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 190.5*fem, 0*fem),
                         child:
                         Text(
                           'Bank App',
                           style:  GoogleFonts.inter (

                             fontSize:  18*ffem,
                             fontWeight:  FontWeight.w700,
                             height:  1.2125*ffem/fem,
                             color:  Color(0xff002d57),
                           ),
                         ),
                       ),
                       Container(
                         // categoryC7i (2:27)
                         width:  25*fem,
                         height:  25*fem,
                         child:
                         Image(image: AssetImage('assets/images/kozi3.jpg'),),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   // component1irk (2:89)
                   margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                   width:  double.infinity,
                   height:  161*fem,
                   child:
                   Row(
                     crossAxisAlignment:  CrossAxisAlignment.center,
                     children:  [
                       Container(
                         // autogroupuiugeVW (Hip77GfwoBHo4oWS6TUiUG)
                         margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                         padding:  EdgeInsets.fromLTRB(22*fem, 20*fem, 17*fem, 13*fem),
                         width:  335*fem,
                         height:  double.infinity,
                         decoration:  BoxDecoration (
                           color:  Color(0xffffd703),
                           borderRadius:  BorderRadius.circular(10*fem),
                         ),
                         child:
                         Column(
                           crossAxisAlignment:  CrossAxisAlignment.start,
                           children:  [
                             Container(
                               // autogroupldllX3W (Hip7FbmQB4p4Q634QsLdLL)
                               margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 5.22*fem),
                               width:  double.infinity,
                               child:
                               Row(
                                 crossAxisAlignment:  CrossAxisAlignment.center,
                                 children:  [
                                   Container(
                                     // totalbalanceEyW (2:81)
                                     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 172*fem, 0.78*fem),
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
                                     // uploadjvG (2:85)
                                     width:  20*fem,
                                     height:  20.78*fem,
                                     child:
                                     Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                   ),
                                 ],
                               ),
                             ),
                             Container(
                               // Ucx (2:84)
                               margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 34*fem),
                               child:
                               RichText(
                                 text:
                                 TextSpan(
                                   style:  GoogleFonts.inter (

                                     fontSize:  24*ffem,
                                     fontWeight:  FontWeight.w700,
                                     height:  1.2125*ffem/fem,
                                     color:  Color(0xff000000),
                                   ),
                                   children:  [
                                     TextSpan(
                                       text:  '\$',
                                       style:  GoogleFonts.inter (

                                         fontSize:  24*ffem,
                                         fontWeight:  FontWeight.w900,
                                         height:  1.2125*ffem/fem,
                                         color:  Color(0xff000000),
                                       ),
                                     ),
                                     TextSpan(
                                       text:  '17,982.22',
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             Container(
                               // bcmpqE (2:82)
                               margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 4*fem),
                               child:
                               Text(
                                 'BCM',
                                 style:  GoogleFonts.inter(

                                   fontSize:  14*ffem,
                                   fontWeight:  FontWeight.w700,
                                   height:  1.2125*ffem/fem,
                                   color:  Color(0xff000000),
                                 ),
                               ),
                             ),
                             Text(
                               // gbpm12atr51u78aa1234wex (2:83)
                               'GBPM12 ATR51 U78AA 1234',
                               style:  GoogleFonts.inter(

                                 fontSize:  14*ffem,
                                 fontWeight:  FontWeight.w500,
                                 height:  1.2125*ffem/fem,
                                 color:  Color(0xff000000),
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         // autogrouphkixg6k (Hip7RLzANknvpPdjRXhKix)
                         padding:  EdgeInsets.fromLTRB(22*fem, 20*fem, 17*fem, 13*fem),
                         width:  335*fem,
                         height:  double.infinity,
                         decoration:  BoxDecoration (
                           color:  Color(0xfffe6310),
                           borderRadius:  BorderRadius.circular(10*fem),
                         ),
                         child:
                         Column(
                           crossAxisAlignment:  CrossAxisAlignment.start,
                           children:  [
                             Container(
                               // autogroupbfswmdz (Hip7XbJkfAw8KMXhfLbFsW)
                               margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 5.22*fem),
                               width:  double.infinity,
                               child:
                               Row(
                                 crossAxisAlignment:  CrossAxisAlignment.center,
                                 children:  [
                                   Container(
                                     // totalbalanceVZz (2:72)
                                     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 172*fem, 0.78*fem),
                                     child:
                                     Text(
                                       'Total Balance',
                                       style:  GoogleFonts.inter(

                                         fontSize:  16*ffem,
                                         fontWeight:  FontWeight.w500,
                                         height:  1.2125*ffem/fem,
                                         color:  Color(0xff000000),
                                       ),
                                     ),
                                   ),
                                   Container(
                                     // uploadCzC (2:76)
                                     width:  20*fem,
                                     height:  20.78*fem,
                                     child:
                                     Image(image: AssetImage('assets/images/kozi3.jpg'),),
                                   ),
                                 ],
                               ),
                             ),
                             Container(
                               // Xma (2:73)
                               margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 34*fem),
                               child:
                               RichText(
                                 text:
                                 TextSpan(
                                   style:  GoogleFonts.inter (

                                     fontSize:  24*ffem,
                                     fontWeight:  FontWeight.w700,
                                     height:  1.2125*ffem/fem,
                                     color:  Color(0xff000000),
                                   ),
                                   children:  [
                                     TextSpan(
                                       text:  '\$',
                                       style:  GoogleFonts.inter (

                                         fontSize:  24*ffem,
                                         fontWeight:  FontWeight.w900,
                                         height:  1.2125*ffem/fem,
                                         color:  Color(0xff000000),
                                       ),
                                     ),
                                     TextSpan(
                                       text:  '17,982.22',
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                             Container(
                               // bcmkeL (2:74)
                               margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 4*fem),
                               child:
                               Text(
                                 'BCM',
                                 style:  GoogleFonts.inter (

                                   fontSize:  14*ffem,
                                   fontWeight:  FontWeight.w700,
                                   height:  1.2125*ffem/fem,
                                   color:  Color(0xff000000),
                                 ),
                               ),
                             ),
                             Text(
                               // gbpm12atr51u78aa1234syr (2:75)
                               'GBPM12 ATR51 U78AA 1234',
                               style:  GoogleFonts.inter (

                                 fontSize:  14*ffem,
                                 fontWeight:  FontWeight.w500,
                                 height:  1.2125*ffem/fem,
                                 color:  Color(0xff000000),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   // group12dCL (2:93)
                   margin:  EdgeInsets.fromLTRB(144*fem, 0*fem, 163*fem, 40*fem),
                   width:  double.infinity,
                   decoration:  BoxDecoration (
                     borderRadius:  BorderRadius.circular(2.5*fem),
                   ),
                   child:
                   Row(
                     crossAxisAlignment:  CrossAxisAlignment.center,
                     children:  [
                       Container(
                         // rectangle8Mu2 (2:90)
                         width:  22*fem,
                         height:  7*fem,
                         decoration:  BoxDecoration (
                           borderRadius:  BorderRadius.circular(2.5*fem),
                           color:  Color(0xfffe6310),
                         ),
                       ),
                       SizedBox(
                         width:  6*fem,
                       ),
                       Container(
                         // rectangle95q2 (2:91)
                         width:  7*fem,
                         height:  7*fem,
                         decoration:  BoxDecoration (
                           borderRadius:  BorderRadius.circular(2.5*fem),
                           color:  Color(0xffc4c4c4),
                         ),
                       ),
                       SizedBox(
                         width:  6*fem,
                       ),
                       Container(
                         // rectangle10pXi (2:92)
                         width:  7*fem,
                         height:  7*fem,
                         decoration:  BoxDecoration (
                           borderRadius:  BorderRadius.circular(2.5*fem),
                           color:  Color(0xffc4c4c4),
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   // autogroupr1eqZkC (Hip5yoZ2kVjEiJWzUnR1eQ)
                   margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 13*fem),
                   width:  double.infinity,
                   child:
                   Row(
                     crossAxisAlignment:  CrossAxisAlignment.center,
                     children:  [
                       Container(
                         // transactionsHw6 (2:94)
                         margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 192*fem, 0*fem),
                         child:
                         Text(
                           'Transactions',
                           style:  GoogleFonts.inter (

                             fontSize:  16*ffem,
                             fontWeight:  FontWeight.w500,
                             height:  1.2125*ffem/fem,
                             color:  Color(0xff000000),
                           ),
                         ),
                       ),
                       Container(
                         // seeallR1i (2:95)
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
                   // frame5LuN (2:232)
                   margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 32*fem),
                   width:  335*fem,
                   child:
                   Column(
                     crossAxisAlignment:  CrossAxisAlignment.center,
                     children:  [
                       Container(
                         // frame4fgk (2:115)
                         padding:  EdgeInsets.fromLTRB(8*fem, 9*fem, 8*fem, 10*fem),
                         width:  double.infinity,
                         height:  67*fem,
                         child:
                         Row(
                           crossAxisAlignment:  CrossAxisAlignment.center,
                           children:  [
                             Container(
                               // starbucksoHA (2:97)
                               margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                               width:  48*fem,
                               height:  48*fem,
                               child:
                               Image(image: AssetImage('assets/images/kozi3.jpg'),),
                             ),
                             Container(
                               // autogroup5f44XU4 (Hip8BEtgvb1gVxoAwH5f44)
                               margin:  EdgeInsets.fromLTRB(0*fem, 7*fem, 107*fem, 5*fem),
                               height:  double.infinity,
                               child:
                               Column(
                                 crossAxisAlignment:  CrossAxisAlignment.start,
                                 children:  [
                                   Container(
                                     // starbucksTcc (2:100)
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
                                     // oct20211220net (2:101)
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
                               // ja8 (2:102)
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
                         // frame3ewz (2:114)
                         padding:  EdgeInsets.fromLTRB(8*fem, 9*fem, 8*fem, 10*fem),
                         width:  double.infinity,
                         height:  67*fem,
                         child:
                         Row(
                           crossAxisAlignment:  CrossAxisAlignment.center,
                           children:  [
                             Container(
                               // spotifyBh2 (2:99)
                               margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                               width:  48*fem,
                               height:  48*fem,
                               child:
                               Image(image: AssetImage('assets/images/kozi3.jpg'),),
                             ),
                             Container(
                               // autogroupqlacXF6 (Hip8P4tKDkNckb2W2YQLAC)
                               margin:  EdgeInsets.fromLTRB(0*fem, 7*fem, 108*fem, 5*fem),
                               height:  double.infinity,
                               child:
                               Column(
                                 crossAxisAlignment:  CrossAxisAlignment.start,
                                 children:  [
                                   Container(
                                     // spotifyfcC (2:105)
                                     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                     child:
                                     Text(
                                       'Spotify',
                                       style:  GoogleFonts.inter(

                                         fontSize:  14*ffem,
                                         fontWeight:  FontWeight.w600,
                                         height:  1.2125*ffem/fem,
                                         color:  Color(0xff002d57),
                                       ),
                                     ),
                                   ),
                                   Text(
                                     // oct20211220CME (2:107)
                                     '21 OCT 2021 12:20',
                                     style:  GoogleFonts.inter(

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
                               // YR6 (2:106)
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
                         // frame2Grt (2:113)
                         padding:  EdgeInsets.fromLTRB(8*fem, 10*fem, 8*fem, 9*fem),
                         width:  double.infinity,
                         height:  67*fem,
                         child:
                         Row(
                           crossAxisAlignment:  CrossAxisAlignment.center,
                           children:  [
                             Container(
                               // netflixdesktopappQCQ (2:98)
                               margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                               width:  48*fem,
                               height:  48*fem,
                               child:
                               Image(image: AssetImage('assets/images/kozi3.jpg'),),
                             ),
                             Container(
                               // autogroupsdzg7cc (Hip8Z4bfGpCXx8TeoqSDzg)
                               margin:  EdgeInsets.fromLTRB(0*fem, 6*fem, 100*fem, 6*fem),
                               height:  double.infinity,
                               child:
                               Column(
                                 crossAxisAlignment:  CrossAxisAlignment.start,
                                 children:  [
                                   Container(
                                     // netflixFTv (2:110)
                                     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                     child:
                                     Text(
                                       'Netflix',
                                       style:  GoogleFonts.inter(

                                         fontSize:  14*ffem,
                                         fontWeight:  FontWeight.w600,
                                         height:  1.2125*ffem/fem,
                                         color:  Color(0xff002d57),
                                       ),
                                     ),
                                   ),
                                   Text(
                                     // oct20211220P4L (2:112)
                                     '25 OCT 2021 12:20',
                                     style:  GoogleFonts.inter(

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
                               // 8nc (2:111)
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
                   // mycards4wA (2:117)
                   margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 282*fem, 13*fem),
                   child:
                   Text(
                     'My Cards',
                     style: GoogleFonts.inter (

                       fontSize:  16*ffem,
                       fontWeight:  FontWeight.w500,
                       height:  1.2125*ffem/fem,
                       color:  Color(0xff000000),
                     ),
                   ),
                 ),
                 Container(
                   // autogroupbj4cPiY (Hip67t9uH1QTGMD92Zbj4c)
                   margin:  EdgeInsets.fromLTRB(5.42*fem, 0*fem, 0*fem, 11*fem),
                   height:  86*fem,
                   child:
                   Row(
                     crossAxisAlignment:  CrossAxisAlignment.start,
                     children:  [
                       Container(
                         // plusKcC (2:66)
                         margin:  EdgeInsets.fromLTRB(0*fem, 5.42*fem, 15.42*fem, 0*fem),
                         width:  54.17*fem,
                         height:  54.17*fem,
                         child:
                         Image(image: AssetImage('assets/images/kozi3.jpg'),),
                       ),
                       Container(
                         // frame7Rv8 (2:122)
                         margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                         width:  171*fem,
                         height:  double.infinity,
                         decoration:  BoxDecoration (
                           color:  Color(0xff002d57),
                           borderRadius:  BorderRadius.circular(8*fem),
                         ),
                         child:
                         Stack(
                           children:  [
                           Positioned(
                           // ellipse5wtU (2:121)
                           left:  -40*fem,
                           top:  -128*fem,
                           child:
                           Align(
                             child:
                             SizedBox(
                               width:  184*fem,
                               height:  184*fem,
                               child:
                               Container(
                                 decoration:  BoxDecoration (
                                   borderRadius:  BorderRadius.circular(92*fem),
                                   color:  Color(0xfffe6310),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Positioned(
                           // ellipse6eH6 (2:123)
                           left:  107*fem,
                           top:  37*fem,
                           child:
                           Align(
                             child:
                             SizedBox(
                               width:  97*fem,
                               height:  97*fem,
                               child:
                               Container(
                                 decoration:  BoxDecoration (
                                     borderRadius:  BorderRadius.circular(48.5*fem),
                                     border:  Border.all(color:Color(0xffffd703)),
                               ),
                             ),
                           ),
                         ),
                       ),
                       Positioned(
                         // visaxHn (2:125)
                         left:  142*fem,
                         top:  6*fem,
                         child:
                         Align(
                           child:
                           SizedBox(
                             width:  18*fem,
                             height:  18*fem,
                             child:
                             Image(image: AssetImage('assets/images/kozi3.jpg'),),
                           ),
                         ),
                       ),
                       Positioned(
                         // 5NQ (2:126)
                         left:  15*fem,
                         top:  9*fem,
                         child:
                         Align(
                           child:
                           SizedBox(
                             width:  44*fem,
                             height:  11*fem,
                             child:
                             Text(
                               '**** 4661',
                               style:  GoogleFonts.inter(

                                 fontSize:  9*ffem,
                                 fontWeight:  FontWeight.w600,
                                 height:  1.2125*ffem/fem,
                                 color:  Color(0xffffffff),
                               ),
                             ),
                           ),
                         ),
                       ),
                       Positioned(
                         // apx (2:128)
                         left:  15*fem,
                         top:  68*fem,
                         child:
                         Align(
                           child:
                           SizedBox(
                             width:  25*fem,
                             height:  11*fem,
                             child:
                             Text(
                               '12/26',
                               style:  GoogleFonts.inter(

                                 fontSize:  9*ffem,
                                 fontWeight:  FontWeight.w600,
                                 height:  1.2125*ffem/fem,
                                 color:  Color(0xffffffff),
                               ),
                             ),
                           ),
                         ),
                       ),
                       Positioned(
                         // gd6 (2:127)
                         left:  15*fem,
                         top:  32*fem,
                         child:
                         Align(
                           child:
                           SizedBox(
                             width:  87*fem,
                             height:  22*fem,
                             child:
                             Text(
                               '\$4,661.91',
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
                     ],
                   ),
                 ),
                 Container(
                   // frame8bEG (2:129)
                   width:  171*fem,
                   height:  double.infinity,
                   decoration:  BoxDecoration (
                     color:  Color(0xff71ff03),
                     borderRadius:  BorderRadius.circular(8*fem),
                   ),
                   child:
                   Stack(
                     children:  [
                     Positioned(
                     // ellipse5w3E (2:130)
                     left:  -40*fem,
                     top:  -128*fem,
                     child:
                     Align(
                       child:
                       SizedBox(
                         width:  184*fem,
                         height:  184*fem,
                         child:
                         Container(
                           decoration:  BoxDecoration (
                             borderRadius:  BorderRadius.circular(92*fem),
                             color:  Color(0xff002d57),
                           ),
                         ),
                       ),
                     ),
                   ),
                   Positioned(
                     // ellipse6rAC (2:131)
                     left:  107*fem,
                     top:  37*fem,
                     child:
                     Align(
                       child:
                       SizedBox(
                         width:  97*fem,
                         height:  97*fem,
                         child:
                         Container(
                           decoration:  BoxDecoration (
                               borderRadius:  BorderRadius.circular(48.5*fem),
                               border:  Border.all(color:Color(0xffffd703)),
                         ),
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   // visaxj2 (2:132)
                   left:  142*fem,
                   top:  6*fem,
                   child:
                   Align(
                     child:
                     SizedBox(
                       width:  18*fem,
                       height:  18*fem,
                       child:
                       Image(image: AssetImage('assets/images/kozi3.jpg'),),
                     ),
                   ),
                 ),
                 Positioned(
                   // 6KS (2:133)
                   left:  15*fem,
                   top:  9*fem,
                   child:
                   Align(
                     child:
                     SizedBox(
                       width:  43*fem,
                       height:  11*fem,
                       child:
                       Text(
                         '**** 9011',
                         style:  GoogleFonts.inter (

                           fontSize:  9*ffem,
                           fontWeight:  FontWeight.w600,
                           height:  1.2125*ffem/fem,
                           color:  Color(0xffffffff),
                         ),
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   // CNU (2:134)
                   left:  15*fem,
                   top:  68*fem,
                   child:
                   Align(
                     child:
                     SizedBox(
                       width:  27*fem,
                       height:  11*fem,
                       child:
                       Text(
                         '02/23',
                         style:  GoogleFonts.inter (

                           fontSize:  9*ffem,
                           fontWeight:  FontWeight.w600,
                           height:  1.2125*ffem/fem,
                           color:  Color(0xffffffff),
                         ),
                       ),
                     ),
                   ),
                 ),
                 Positioned(
                   // tm6 (2:135)
                   left:  15*fem,
                   top:  32*fem,
                   child:
                   Align(
                     child:
                     SizedBox(
                       width:  80*fem,
                       height:  22*fem,
                       child:
                       Text(
                         '\$1,211.91',
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
               ],
             ),
           ),
         ],
       ),
     ),
     Container(
     // group13Pxk (2:137)
     margin:  EdgeInsets.fromLTRB(144*fem, 0*fem, 163*fem, 0*fem),
     width:  double.infinity,
     decoration:  BoxDecoration (
     borderRadius:  BorderRadius.circular(2.5*fem),
     ),
     child:
     Row(
     crossAxisAlignment:  CrossAxisAlignment.center,
     children:  [
     Container(
     // rectangle8j12 (2:138)
     width:  22*fem,
     height:  7*fem,
     decoration:  BoxDecoration (
     borderRadius:  BorderRadius.circular(2.5*fem),
     color:  Color(0xfffe6310),
     ),
     ),
     SizedBox(
     width:  6*fem,
     ),
     Container(
     // rectangle9edn (2:139)
     width:  7*fem,
     height:  7*fem,
     decoration:  BoxDecoration (
     borderRadius:  BorderRadius.circular(2.5*fem),
     color:  Color(0xffc4c4c4),
     ),
     ),
     SizedBox(
     width:  6*fem,
     ),
     Container(
     // rectangle10myJ (2:140)
     width:  7*fem,
     height:  7*fem,
     decoration:  BoxDecoration (
     borderRadius:  BorderRadius.circular(2.5*fem),
     color:  Color(0xffc4c4c4),
     ),
     ),
     ],
     ),
     ),
     ],
     ),
     ),
     Container(
     // autogroupk7qrWvt (Hip6TNbRgPNC6xQV3tK7qr)
     padding:  EdgeInsets.fromLTRB(39.13*fem, 21.5*fem, 41*fem, 20.5*fem),
     width:  double.infinity,
     decoration:  BoxDecoration (
     color:  Color(0xffffffff),
     boxShadow:  [
     BoxShadow(
     color:  Color(0x3fb8b8b8),
     offset:  Offset(0*fem, -2*fem),
     blurRadius:  12*fem,
     ),
     ],
     ),
     child:
     Row(
     crossAxisAlignment:  CrossAxisAlignment.center,
     children:  [
     Container(
     // homezr4 (2:46)
     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 68.5*fem, 0*fem),
     width:  23.75*fem,
     height:  25*fem,
     child:
     Image(image: AssetImage('assets/images/kozi3.jpg'),),
     ),
     Container(
     // notificationuy2 (2:41)
     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 70.38*fem, 0*fem),
     width:  21.25*fem,
     height:  25*fem,
     child:
     Image(image: AssetImage('assets/images/kozi3.jpg'),),
     ),
     Container(
     // bookmark3JY (2:36)
     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 71*fem, 0*fem),
     width:  20*fem,
     height:  25*fem,
     child:
     Image(image: AssetImage('assets/images/kozi3.jpg'),),
     ),
     Container(
     // profilemkL (2:51)
     margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
     width:  20*fem,
     height:  25*fem,
     child:
     Image(image: AssetImage('assets/images/kozi3.jpg'),),
     ),
     ],
     ),
     ),
     ],
     ),
     );
   }
 }
