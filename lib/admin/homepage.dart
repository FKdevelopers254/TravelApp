import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {

  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final double fem =1  ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Expanded(
        child: Container(
          // home8Ao (1:360)
          padding:  EdgeInsets.fromLTRB(20, 60, 23, 21),
          width:  double.infinity,
          decoration:  BoxDecoration (
            color:  Color(0xfffefefe),
          ),
          child:
          Column(
            crossAxisAlignment:  CrossAxisAlignment.center,
            children:  [
              Container(
                // userM3Z (1:383)
                margin:  EdgeInsets.fromLTRB(4, 0, 1, 0),
                width:  double.infinity,
                height:  46,
                child:
                Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      // profileENF (1:399)
                      margin:  EdgeInsets.fromLTRB(0, 0, 134, 0),
                      height:  double.infinity,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // Ytj (1:400)
                            margin:  EdgeInsets.fromLTRB(0, 0, 15, 0),
                            width:  40,
                            height:  40,
                            child:
                            ClipRRect(
                              borderRadius:  BorderRadius.circular(100),
                              child:
                              Image.asset(
                                'lib/assets/images/gondola.jpg',
                                fit:  BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            // group1000003474dQP (1:401)
                            width:  92,
                            height:  double.infinity,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  // hiandyY1Z (1:402)
                                  'Hi, Andy',
                                  style:  TextStyle (

                                    fontSize:  18,
                                    fontWeight:  FontWeight.w700,

                                    color:  Color(0xff111111),
                                  ),
                                ),
                                Container(
                                  // group10000034731vj (1:403)
                                  padding:  const EdgeInsets.fromLTRB(2.67, 0, 0, 0),
                                  width:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // bxsmap11j63 (1:405)
                                        margin:  const EdgeInsets.fromLTRB(0, 0, 6.67, 0),
                                        width:  10.67,
                                        height:  13.33,
                                        child:
                                        Image.asset(
                                         'lib/assets/images/gondola.jpg',
                                          width:  10.67,
                                          height:  13.33,
                                        ),
                                      ),
                                      const Text(
                                        // netherlandsCEX (1:404)
                                        'Netherlands',
                                        style:  TextStyle (

                                          fontSize:  18,
                                          fontWeight:  FontWeight.w700,

                                          color:  Color(0xff111111),
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
                      // actionUC3 (1:384)
                      width:  46,
                      height:  46,
                      child:
                      Image.asset(
                       'lib/assets/images/gondola.jpg',
                        width:  46,
                        height:  46,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height:  24,
              ),
              Container(
                // inputfieldZDV (1:361)
                margin:  EdgeInsets.fromLTRB(3, 0, 0, 0),
                width:  327,
                height:  52,
                decoration:  BoxDecoration (
                  color:  const Color(0xfff6f8fe),
                  borderRadius:  BorderRadius.circular(24),
                ),
                child:
                Container(
                  // frame13uM (I1:361;23:250)
                  padding:  EdgeInsets.fromLTRB(17.5, 14, 17, 14),
                  width:  double.infinity,
                  height:  double.infinity,
                  decoration:  BoxDecoration (
                    color:  Color(0xfff6f8fe),
                    borderRadius:  BorderRadius.circular(24),
                  ),
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // iconsearchviF (I1:361;23:251)
                        margin:  EdgeInsets.fromLTRB(0, 0.54, 9.3, 0),
                        width:  15.2,
                        height:  15.54,
                        child:
                        Image.asset(
                         'lib/assets/images/gondola.jpg',
                          width:  15.2,
                          height:  15.54,
                        ),
                      ),
                      Container(
                        // smalllabelregular12pxnEf (I1:361;23:253;23:197)
                        margin:  EdgeInsets.fromLTRB(0, 0, 172, 0),
                        child:
                        Text(
                          'Search...',
                          style:  TextStyle (

                            fontSize:  18,
                            fontWeight:  FontWeight.w700,

                            color:  Color(0xff111111),
                          ),
                        ),
                      ),
                      Container(
                        // filterTbh (I1:361;23:254)
                        width:  26,
                        height:  18,
                        child:
                        Image.asset(
                          'lib/assets/images/gondola,jpg',
                          width:  26,
                          height:  18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height:  24,
              ),
              Container(
                // service8Sw (1:362)
                margin:  EdgeInsets.fromLTRB(9, 0, 4*fem, 0*fem),
                width:  double.infinity,
                height:  97*fem,
                child:
                Row(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children:  [
                    Container(
                      // list1Fq (1:379)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
                      width:  64*fem,
                      height:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupwmrdvNo (Eh5f9MVQGfghxjqHVZWMRd)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                            padding:  EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 16*fem),
                            width:  double.infinity,
                            decoration:  BoxDecoration (
                              color:  Color(0xfff6f8fe),
                              borderRadius:  BorderRadius.circular(32*fem),
                            ),
                            child:
                            Center(
                              // flight1D71 (1:382)
                              child:
                              SizedBox(
                                width:  32*fem,
                                height:  32*fem,
                                child:
                                Image.asset(
                                  'lib/assets/images/gondola.jpg',
                                  fit:  BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // airport7y5 (1:381)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                            child:
                            Text(
                              'Airport',
                              textAlign:  TextAlign.center,
                              style: TextStyle (

                                fontSize:  18,
                                fontWeight:  FontWeight.w700,

                                color:  Color(0xff111111),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // listQxB (1:375)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
                      width:  64*fem,
                      height:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupgtlf8dH (Eh5eymw2dtwCjG8GKzGTLF)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                            padding:  EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 16*fem),
                            width:  double.infinity,
                            decoration:  BoxDecoration (
                              color:  Color(0xfff6f8fe),
                              borderRadius:  BorderRadius.circular(32*fem),
                            ),
                            child:
                            Center(
                              // car1Ct3 (1:378)
                              child:
                              SizedBox(
                                width:  32*fem,
                                height:  32*fem,
                                child:
                                Image.asset(
                                 'lib/assets/images/gondola.jpg',
                                  fit:  BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // taxiWtj (1:377)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                            child:
                            Text(
                              'Taxi',
                              textAlign:  TextAlign.center,
                              style:  TextStyle (

                                fontSize:  18,
                                fontWeight:  FontWeight.w700,

                                color:  Color(0xff111111),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // list14o (1:371)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 21*fem, 0*fem),
                      width:  64*fem,
                      height:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupragtWnF (Eh5enXkmKwt3dXWihXraGT)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                            padding:  EdgeInsets.fromLTRB(16*fem, 16*fem, 16*fem, 16*fem),
                            width:  double.infinity,
                            decoration:  BoxDecoration (
                              color:  Color(0xfff6f8fe),
                              borderRadius:  BorderRadius.circular(32*fem),
                            ),
                            child:
                            Center(
                              // hotel1boh (1:374)
                              child:
                              SizedBox(
                                width:  32*fem,
                                height:  32*fem,
                                child:
                                Image.asset(
                                  'lib/assets/images/gondola.jpg',
                                  fit:  BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // hotelKUo (1:373)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                            child:
                            Text(
                              'Hotel',
                              textAlign:  TextAlign.center,
                              style:  TextStyle (

                                fontSize:  18,
                                fontWeight:  FontWeight.w700,

                                color:  Color(0xff111111),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // listRGw (1:363)
                      width:  64*fem,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // autogroupdxz5xnf (Eh5eY817EZSwz6ymzQDXZ5)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 11*fem),
                            padding:  EdgeInsets.fromLTRB(18.67*fem, 18.67*fem, 18.67*fem, 18.67*fem),
                            width:  double.infinity,
                            decoration:  BoxDecoration (
                              color:  Color(0xfff6f8fe),
                              borderRadius:  BorderRadius.circular(32*fem),
                            ),
                            child:
                            Center(
                              // category451 (1:365)
                              child:
                              SizedBox(
                                width:  26.67*fem,
                                height:  26.67*fem,
                                child:
                                Image.asset(
                                  'lib/assets/images/gondola.jpg',
                                  width:  26.67*fem,
                                  height:  26.67*fem,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // moreA83 (1:370)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                            child:
                            Text(
                              'More',
                              textAlign:  TextAlign.center,
                              style:  TextStyle (

                                fontSize:  18,
                                fontWeight:  FontWeight.w700,

                                color:  Color(0xff111111),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:  24*fem,
              ),
              Container(
                // frequentlyvisited2AF (1:407)
                margin:  EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
                width:  328*fem,
                child:
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.end,
                  children:  [
                    Container(
                      // title8UB (1:445)
                      margin:  EdgeInsets.fromLTRB(1.5*fem, 0*fem, 0*fem, 16*fem),
                      width:  double.infinity,
                      height:  26*fem,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // frequentlyvisited35M (1:446)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 111.5*fem, 0*fem),
                            child:
                            Text(
                              'Frequently visited\n',
                              textAlign:  TextAlign.center,
                              style:  TextStyle (

                                fontSize:  18,
                                fontWeight:  FontWeight.w700,

                                color:  Color(0xff111111),
                              ),
                            ),
                          ),
                          Container(
                            // slidervQ3 (1:447)
                            margin:  EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 9*fem),
                            height:  double.infinity,
                            child:
                            Row(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                Container(
                                  // dotSNP (1:448)
                                  width:  24*fem,
                                  height:  8*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(100*fem),
                                    color:  Color(0xff009b8d),
                                  ),
                                ),
                                SizedBox(
                                  width:  8*fem,
                                ),
                                Container(
                                  // dotXud (1:449)
                                  width:  8*fem,
                                  height:  8*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(4*fem),
                                    color:  Color(0xffd1d8dd),
                                  ),
                                ),
                                SizedBox(
                                  width:  8*fem,
                                ),
                                Container(
                                  // dotrBD (1:450)
                                  width:  8*fem,
                                  height:  8*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(4*fem),
                                    color:  Color(0xffd1d8dd),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // itemsPB9 (1:408)
                      width:  double.infinity,
                      height:  232*fem,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // listKKh (1:409)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                            width:  156*fem,
                            height:  double.infinity,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // group1000003468EhZ (1:410)
                                  padding:  EdgeInsets.fromLTRB(120*fem, 13*fem, 8*fem, 13*fem),
                                  width:  double.infinity,
                                  height:  150*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(8*fem),
                                    image:  const DecorationImage (
                                      fit:  BoxFit.cover,
                                      image:  AssetImage (
                                          'lib/assets/images/gondola.jpg'
                                      ),
                                    ),
                                  ),
                                  child:
                                  Align(
                                    // group1000003464uoh (1:412)
                                    alignment:  Alignment.topRight,
                                    child:
                                    SizedBox(
                                      width:  28*fem,
                                      height:  28*fem,
                                      child:
                                      Container(
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 96*fem),
                                        child:
                                        Image.network(
                                         '',
                                          width:  28*fem,
                                          height:  28*fem,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:  8*fem,
                                ),
                                Container(
                                  // group1000003467xmy (1:416)
                                  width:  105*fem,
                                  child:
                                  Column(
                                    crossAxisAlignment:  CrossAxisAlignment.start,
                                    children:  [
                                      Container(
                                        // tahitibeach6dH (1:417)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                        child:
                                        Text(
                                          'Tahiti Beach',
                                          style:  TextStyle (

                                            fontSize:  18,
                                            fontWeight:  FontWeight.w700,

                                            color:  Color(0xff111111),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // group1000003465b4F (1:418)
                                        padding:  EdgeInsets.fromLTRB(2.33*fem, 0*fem, 0*fem, 0*fem),
                                        width:  double.infinity,
                                        child:
                                        Row(
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children:  [
                                            Container(
                                              // bxsmap11V9d (1:420)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 6.33*fem, 0*fem),
                                              width:  9.33*fem,
                                              height:  11.67*fem,
                                              child:
                                              Image.asset(
                                               'lib/assets/images/gondola.jpg',
                                                width:  9.33*fem,
                                                height:  11.67*fem,
                                              ),
                                            ),
                                            RichText(
                                              // polynesiafrenchNDR (1:419)
                                              text:
                                              TextSpan(
                                                style:  TextStyle (

                                                  fontSize:  18,
                                                  fontWeight:  FontWeight.w700,

                                                  color:  Color(0xff111111),
                                                ),
                                                children:  [
                                                  TextSpan(
                                                    text:  'Polynesia, ',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:  'French ',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
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
                                SizedBox(
                                  height:  8*fem,
                                ),
                                Container(
                                  // group1000003466eif (1:422)
                                  width:  double.infinity,
                                  height:  22*fem,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // N8s (1:423)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 57*fem, 0*fem),
                                        child:
                                        Text(
                                          '\$235',
                                          style:  TextStyle (

                                            fontSize:  18,
                                            fontWeight:  FontWeight.w700,

                                            color:  Color(0xff111111),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // group1000003429GEF (1:424)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 1*fem),
                                        height:  double.infinity,
                                        child:
                                        Row(
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children:  [
                                            Container(
                                              // starBc7 (1:425)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                              width:  14*fem,
                                              height:  14*fem,
                                              child:
                                              Image.asset(
                                              'lib/assets/images/gondola.jpg',
                                                width:  14*fem,
                                                height:  14*fem,
                                              ),
                                            ),
                                            RichText(
                                              // type164A7 (1:426)
                                              text:
                                              TextSpan(
                                                style:  TextStyle (

                                                  fontSize:  18,
                                                  fontWeight:  FontWeight.w700,

                                                  color:  Color(0xff111111),
                                                ),
                                                children:  [
                                                  TextSpan(
                                                    text:  '4.4 ',
                                                  ),
                                                  TextSpan(
                                                    text:  '(32)',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
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
                          Container(
                            // listB8F (1:427)
                            width:  156*fem,
                            height:  double.infinity,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                Container(
                                  // group1000003468FXR (1:428)
                                  padding:  EdgeInsets.fromLTRB(120*fem, 13*fem, 8*fem, 13*fem),
                                  width:  double.infinity,
                                  height:  150*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(8*fem),
                                    image:  DecorationImage (
                                      fit:  BoxFit.cover,
                                      image:  AssetImage (
                                          'lib/assets/images/gondola.jpg'
                                      ),
                                    ),
                                  ),
                                  child:
                                  Align(
                                    // group10000034646H9 (1:430)
                                    alignment:  Alignment.topRight,
                                    child:
                                    SizedBox(
                                      width:  28*fem,
                                      height:  28*fem,
                                      child:
                                      Container(
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 96*fem),
                                        child:
                                        Image.network(
                                         '',
                                          width:  28*fem,
                                          height:  28*fem,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupf6afw2s (Eh5ftv59gfSjGfDRK8f6AF)
                                  padding:  EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
                                  width:  double.infinity,
                                  child:
                                  Column(
                                    crossAxisAlignment:  CrossAxisAlignment.start,
                                    children:  [
                                      Container(
                                        // group1000003467T1D (1:434)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                        width:  125*fem,
                                        child:
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children:  [
                                            Container(
                                              // stluciamountain9ej (1:435)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                              child:
                                              Text(
                                                'St. Lucia Mountain',
                                                style: TextStyle (

                                                  fontSize:  18,
                                                  fontWeight:  FontWeight.w700,

                                                  color:  Color(0xff111111),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // group1000003465RMM (1:436)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 36*fem, 0*fem),
                                              padding:  EdgeInsets.fromLTRB(2.33*fem, 0*fem, 0*fem, 0*fem),
                                              width:  double.infinity,
                                              child:
                                              Row(
                                                crossAxisAlignment:  CrossAxisAlignment.center,
                                                children:  [
                                                  Container(
                                                    // bxsmap11hpf (1:438)
                                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 6.33*fem, 0*fem),
                                                    width:  9.33*fem,
                                                    height:  11.67*fem,
                                                    child:
                                                    Image.network(
                                                      '',
                                                      width:  9.33*fem,
                                                      height:  11.67*fem,
                                                    ),
                                                  ),
                                                  Text(
                                                    // southamericazYs (1:437)
                                                    'South America',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // group1000003466W1R (1:440)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                                        width:  double.infinity,
                                        height:  22*fem,
                                        child:
                                        Row(
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children:  [
                                            Container(
                                              // Qcb (1:441)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 59*fem, 0*fem),
                                              child:
                                              Text(
                                                '\$182',
                                                style:  TextStyle (

                                                  fontSize:  18,
                                                  fontWeight:  FontWeight.w700,

                                                  color:  Color(0xff111111),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // group1000003429ga7 (1:442)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 1*fem),
                                              height:  double.infinity,
                                              child:
                                              Row(
                                                crossAxisAlignment:  CrossAxisAlignment.center,
                                                children:  [
                                                  Container(
                                                    // starzao (1:443)
                                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                                    width:  14*fem,
                                                    height:  14*fem,
                                                    child:
                                                    Image.network(
                                                     '',
                                                      width:  14*fem,
                                                      height:  14*fem,
                                                    ),
                                                  ),
                                                  RichText(
                                                    // type16683 (1:444)
                                                    text:
                                                    TextSpan(
                                                      style:  TextStyle (

                                                        fontSize:  18,
                                                        fontWeight:  FontWeight.w700,

                                                        color:  Color(0xff111111),
                                                      ),
                                                      children:  [
                                                        TextSpan(
                                                          text:  '4.4 ',
                                                        ),
                                                        TextSpan(
                                                          text:  '(41)',
                                                          style:  TextStyle (

                                                            fontSize:  18,
                                                            fontWeight:  FontWeight.w700,

                                                            color:  Color(0xff111111),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:  24*fem,
              ),
              Container(
                // onbudgettourAXD (1:496)
                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                width:  328*fem,
                child:
                Column(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      // titleruq (1:497)
                      width:  double.infinity,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // onbudgettourBx7 (1:499)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 144*fem, 0*fem),
                            child:
                            Text(
                              'On Budget Tour',
                              style:  TextStyle (

                                fontSize:  18,
                                fontWeight:  FontWeight.w700,

                                color:  Color(0xff111111),
                              ),
                            ),
                          ),
                          Text(
                            // seeallGif (1:498)
                            'See All',
                            style:  TextStyle (

                              fontSize:  18,
                              fontWeight:  FontWeight.w700,

                              color:  Color(0xff111111),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupjuq1nwu (Eh5gZPy2nfg7PPw9pWjUq1)
                      padding:  EdgeInsets.fromLTRB(0*fem, 16*fem, 0*fem, 0*fem),
                      width:  double.infinity,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // listhJB (1:500)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 16*fem),
                            width:  double.infinity,
                            height:  86*fem,
                            child:
                            Row(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                Container(
                                  // rectangle22469CEw (1:501)
                                  width:  86*fem,
                                  height:  86*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(8*fem),
                                    color:  Color(0xffd9d9d9),
                                    image:  DecorationImage (
                                      fit:  BoxFit.cover,
                                      image:  NetworkImage (
                                        ''
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupeanfsrs (Eh5gjE1zGpGfQ7UekieaNF)
                                  padding:  EdgeInsets.fromLTRB(12*fem, 5*fem, 0*fem, 5*fem),
                                  height:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // group1000003484P4X (1:502)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                                        width:  112*fem,
                                        height:  double.infinity,
                                        child:
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children:  [
                                            Container(
                                              // group1000003483Urf (1:507)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                              width:  double.infinity,
                                              child:
                                              Column(
                                                crossAxisAlignment:  CrossAxisAlignment.start,
                                                children:  [
                                                  Text(
                                                    // ledadubeachC1y (1:508)
                                                    'Ledadu Beach',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                  Text(
                                                    // days2nightsJKu (1:509)
                                                    '3 days 2 nights',
                                                    style: TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // group1000003465pJF (1:503)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 39*fem, 0*fem),
                                              padding:  EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                                              width:  double.infinity,
                                              child:
                                              Row(
                                                crossAxisAlignment:  CrossAxisAlignment.center,
                                                children:  [
                                                  Container(
                                                    // bxsmap11i8j (1:505)
                                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                                                    width:  12*fem,
                                                    height:  15*fem,
                                                    child:
                                                    Image.network(
                                                     '',
                                                      width:  12*fem,
                                                      height:  15*fem,
                                                    ),
                                                  ),
                                                  Text(
                                                    // australia17q (1:504)
                                                    'Australia',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        // personV31 (1:510)
                                        text:
                                        TextSpan(
                                          style:  TextStyle (

                                            fontSize:  18,
                                            fontWeight:  FontWeight.w700,

                                            color:  Color(0xff111111),
                                          ),
                                          children:  [
                                            TextSpan(
                                              text:  '\$20',
                                              style:  TextStyle (

                                                fontSize:  18,
                                                fontWeight:  FontWeight.w700,

                                                color:  Color(0xff111111),
                                              ),
                                            ),
                                            TextSpan(
                                              text:  '/Person',
                                              style:  TextStyle (

                                                fontSize:  18,
                                                fontWeight:  FontWeight.w700,

                                                color:  Color(0xff111111),
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
                            // listTGf (1:511)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                            width:  double.infinity,
                            height:  86*fem,
                            child:
                            Row(
                              crossAxisAlignment:  CrossAxisAlignment.center,
                              children:  [
                                Container(
                                  // rectangle22469xz7 (1:512)
                                  width:  86*fem,
                                  height:  86*fem,
                                  decoration:  BoxDecoration (
                                    borderRadius:  BorderRadius.circular(8*fem),
                                    color:  Color(0xffd9d9d9),
                                    image:  DecorationImage (
                                      fit:  BoxFit.cover,
                                      image:  NetworkImage (
                                         '',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // autogroupfurwerw (Eh5hCximmd8yybFoAufUrw)
                                  padding:  EdgeInsets.fromLTRB(12*fem, 5*fem, 0*fem, 5*fem),
                                  height:  double.infinity,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // group10000034848XD (1:513)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 28*fem, 0*fem),
                                        width:  127*fem,
                                        height:  double.infinity,
                                        child:
                                        Column(
                                          crossAxisAlignment:  CrossAxisAlignment.start,
                                          children:  [
                                            Container(
                                              // group10000034832Mh (1:518)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                              width:  double.infinity,
                                              child:
                                              Column(
                                                crossAxisAlignment:  CrossAxisAlignment.start,
                                                children:  [
                                                  Text(
                                                    // endigadabeachKrb (1:519)
                                                    'Endigada Beach',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                  Text(
                                                    // days4nightsRej (1:520)
                                                    '5 days 4 nights',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // group10000034658p3 (1:514)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 0*fem),
                                              padding:  EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                                              width:  double.infinity,
                                              child:
                                              Row(
                                                crossAxisAlignment:  CrossAxisAlignment.center,
                                                children:  [
                                                  Container(
                                                    // bxsmap111N3 (1:516)
                                                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                                                    width:  12*fem,
                                                    height:  15*fem,
                                                    child:
                                                    Image.network(
                                                      '',
                                                      width:  12*fem,
                                                      height:  15*fem,
                                                    ),
                                                  ),
                                                  Text(
                                                    // australiaUmR (1:515)
                                                    'Australia',
                                                    style:  TextStyle (

                                                      fontSize:  18,
                                                      fontWeight:  FontWeight.w700,

                                                      color:  Color(0xff111111),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        // personBvj (1:521)
                                        text:
                                        TextSpan(
                                          style:  TextStyle (

                                            fontSize:  18,
                                            fontWeight:  FontWeight.w700,

                                            color:  Color(0xff111111),
                                          ),
                                          children:  [
                                            TextSpan(
                                              text:  '\$25',
                                              style:  TextStyle (

                                                fontSize:  18,
                                                fontWeight:  FontWeight.w700,

                                                color:  Color(0xff111111),
                                              ),
                                            ),
                                            TextSpan(
                                              text:  '/Person',
                                              style:  TextStyle (

                                                fontSize:  18,
                                                fontWeight:  FontWeight.w700,

                                                color:  Color(0xff111111),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
