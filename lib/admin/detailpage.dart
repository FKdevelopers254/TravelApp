import 'package:flutter/material.dart';

class AdminDetailPage extends StatefulWidget {
  const AdminDetailPage({Key? key}) : super(key: key);

  @override
  State<AdminDetailPage> createState() => _AdminDetailPageState();
}

class _AdminDetailPageState extends State<AdminDetailPage> {
  final double fem =1  ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        // vacationdetailsLM1 (1:523)
        width:  double.infinity,
        decoration:  BoxDecoration (
          color:  Color(0xfffefefe),
        ),
        child:
        Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
            Container(
              // autogroupvb6kBF9 (Eh5iL6WugUEoxSTw6QVb6K)
              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 32*fem),
              width:  double.infinity,
              height:  706*fem,
              child:
              Stack(
                children:  [
                  Positioned(
                    // rectangle22472ziP (1:524)
                    left:  0*fem,
                    top:  0*fem,
                    child:
                    Align(
                      child:
                      SizedBox(
                        width:  375*fem,
                        height:  400*fem,
                        child:
                        Container(
                          decoration:  BoxDecoration (
                            color:  Color(0xffd9d9d9),
                            image:  DecorationImage (
                              fit:  BoxFit.cover,
                              image:  NetworkImage (
                                  ''
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // topwn3 (1:525)
                    left:  24*fem,
                    top:  60*fem,
                    child:
                    Container(
                      width:  235*fem,
                      height:  48*fem,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // arrowbackPP9 (1:527)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 44*fem, 0*fem),
                            width:  48*fem,
                            height:  48*fem,
                            child:
                            Image.network(
                             '',
                              width:  48*fem,
                              height:  48*fem,
                            ),
                          ),
                          Text(
                            // vacationdetailscFu (1:526)
                            'Vacation Details',
                            textAlign:  TextAlign.center,
                            style:  TextStyle (


                              fontWeight:  FontWeight.w700,

                              letterSpacing:  0.09*fem,
                              color:  Color(0xfffefefe),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle22473pcs (1:533)
                    left:  0*fem,
                    top:  347*fem,
                    child:
                    Align(
                      child:
                      SizedBox(
                        width:  375*fem,
                        height:  271*fem,
                        child:
                        Container(
                          decoration:  BoxDecoration (
                            color:  Color(0xfffefefe),
                            borderRadius:  BorderRadius.only (
                              topLeft:  Radius.circular(30*fem),
                              topRight:  Radius.circular(30*fem),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // sliderBbq (1:534)
                    left:  160*fem,
                    top:  307*fem,
                    child:
                    Container(
                      width:  56*fem,
                      height:  8*fem,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // dotpPu (1:535)
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
                            // dotH2b (1:536)
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
                            // dot94o (1:537)
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
                  ),
                  Positioned(
                    // detaildkf (1:538)
                    left:  24*fem,
                    top:  470*fem,
                    child:
                    Container(
                      width:  313*fem,
                      height:  236*fem,
                      child:
                      Column(
                        crossAxisAlignment:  CrossAxisAlignment.start,
                        children:  [
                          Container(
                            // detailssf1 (1:540)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                            child:
                            Text(
                              'Details',
                              style:   TextStyle (


                                fontWeight:  FontWeight.w700,

                                letterSpacing:  0.09*fem,
                                color:  Color(0xfffefefe),
                              ),
                            ),
                          ),
                          Container(
                            // loremipsumdolorsitametconsecte (1:539)
                            constraints:  BoxConstraints (
                              maxWidth:  313*fem,
                            ),
                            child:
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, lacus. Iaculis eu egestas leo egestas vel. Ultrices ut magna nulla facilisi commodo enim, orci feugiat pharetra. Id sagittis, ullamcorper turpis ultrices platea pharetra.',
                              style:   TextStyle (


                                fontWeight:  FontWeight.w700,

                                letterSpacing:  0.09*fem,
                                color:  Color(0xfffefefe),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // title875 (1:541)
                    left:  24*fem,
                    top:  378*fem,
                    child:
                    Container(
                      width:  327*fem,
                      height:  60*fem,
                      child:
                      Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            // aboutmfq (1:542)
                            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 33.67*fem, 0*fem),
                            width:  253.33*fem,
                            height:  double.infinity,
                            child:
                            Column(
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children:  [
                                Container(
                                  // tajmahalcRZ (1:543)
                                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                                  child:
                                  Text(
                                    'Taj Mahal',
                                    style:   TextStyle (


                                      fontWeight:  FontWeight.w700,

                                      letterSpacing:  0.09*fem,
                                      color:  Color(0xfffefefe),
                                    ),
                                  ),
                                ),
                                Container(
                                  // detailRdu (1:544)
                                  width:  double.infinity,
                                  height:  20*fem,
                                  child:
                                  Row(
                                    crossAxisAlignment:  CrossAxisAlignment.center,
                                    children:  [
                                      Container(
                                        // group10000035288HR (1:545)
                                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                                        height:  double.infinity,
                                        child:
                                        Row(
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children:  [
                                            Container(
                                              // vectorzaX (1:546)
                                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 8.67*fem, 0*fem),
                                              width:  10.67*fem,
                                              height:  13.33*fem,
                                              child:
                                              Image.network(
                                                '',
                                                width:  10.67*fem,
                                                height:  13.33*fem,
                                              ),
                                            ),
                                            Text(
                                              // uttarpradeshindiaDy5 (1:547)
                                              'Uttar Pradesh, India',
                                              style:   TextStyle (


                                                fontWeight:  FontWeight.w700,

                                                letterSpacing:  0.09*fem,
                                                color:  Color(0xfffefefe),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // group1000003529gbm (1:548)
                                        height:  double.infinity,
                                        child:
                                        Row(
                                          crossAxisAlignment:  CrossAxisAlignment.center,
                                          children:  [
                                            Container(
                                              // starAG3 (1:549)
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
                                              // type16Bgw (1:550)
                                              text:
                                              TextSpan(
                                                style:   TextStyle (


                                                  fontWeight:  FontWeight.w700,

                                                  letterSpacing:  0.09*fem,
                                                  color:  Color(0xfffefefe),
                                                ),
                                                children:  [
                                                  TextSpan(
                                                    text:  '4.4 ',
                                                  ),
                                                  TextSpan(
                                                    text:  '(41 Reviews)',
                                                    style:   TextStyle (


                                                      fontWeight:  FontWeight.w700,

                                                      letterSpacing:  0.09*fem,
                                                      color:  Color(0xfffefefe),
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
                            // wishlist4Xm (1:551)
                            width:  40*fem,
                            height:  40*fem,
                            child:
                            Image.network(
                             '',
                              width:  40*fem,
                              height:  40*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // reviewuYP (1:552)
              margin:  EdgeInsets.fromLTRB(24*fem, 0*fem, 24*fem, 14*fem),
              width:  double.infinity,
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.center,
                children:  [
                  Container(
                    // title8vw (1:553)
                    margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                    width:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // reviewsbpX (1:554)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 217*fem, 0*fem),
                          child:
                          Text(
                            'Reviews',
                            style:   TextStyle (


                              fontWeight:  FontWeight.w700,

                              letterSpacing:  0.09*fem,
                              color:  Color(0xfffefefe),
                            ),
                          ),
                        ),
                        Text(
                          // seeall1NT (1:555)
                          'See all',
                          style:   TextStyle (


                            fontWeight:  FontWeight.w700,

                            letterSpacing:  0.09*fem,
                            color:  Color(0xfffefefe),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // listgzP (1:556)
                    width:  double.infinity,
                    height:  130*fem,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                        Container(
                          // imagePP1 (1:557)
                          margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 16*fem, 0*fem),
                          width:  45*fem,
                          height:  45*fem,
                          child:
                          Image.network(
                           '',
                            width:  45*fem,
                            height:  45*fem,
                          ),
                        ),
                        Container(
                          // description2B5 (1:560)
                          width:  266*fem,
                          height:  double.infinity,
                          child:
                          Column(
                            crossAxisAlignment:  CrossAxisAlignment.center,
                            children:  [
                              Container(
                                // group1000003199uVm (1:562)
                                width:  double.infinity,
                                child:
                                Row(
                                  crossAxisAlignment:  CrossAxisAlignment.end,
                                  children:  [
                                    Container(
                                      // jhonekenoady1Hu (1:563)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 48*fem, 0*fem),
                                      child:
                                      Text(
                                        'Jhone Kenoady',
                                        style:   TextStyle (


                                          fontWeight:  FontWeight.w700,

                                          letterSpacing:  0.09*fem,
                                          color:  Color(0xfffefefe),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      // nov2022RMd (1:564)
                                      '23 Nov 2022',
                                      style:   TextStyle (


                                        fontWeight:  FontWeight.w700,

                                        letterSpacing:  0.09*fem,
                                        color:  Color(0xfffefefe),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupzaubh4F (Eh5jfe82sh1MLoXBZyZAUB)
                                padding:  EdgeInsets.fromLTRB(0*fem, 8*fem, 0*fem, 0*fem),
                                width:  double.infinity,
                                child:
                                Column(
                                  crossAxisAlignment:  CrossAxisAlignment.start,
                                  children:  [
                                    Container(
                                      // ratingsACj (1:565)
                                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 16*fem),
                                      padding:  EdgeInsets.fromLTRB(0*fem, 0.3*fem, 0*fem, 0.28*fem),
                                      child:
                                      Row(
                                        crossAxisAlignment:  CrossAxisAlignment.center,
                                        children:  [
                                          Container(
                                            // iconstarnV1 (1:566)
                                            width:  14*fem,
                                            height:  13.42*fem,
                                            child:
                                            Image.network(
                                              '',
                                              width:  14*fem,
                                              height:  13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width:  8*fem,
                                          ),
                                          Container(
                                            // iconstarPDu (1:568)
                                            width:  14*fem,
                                            height:  13.42*fem,
                                            child:
                                            Image.network(
                                              '',
                                              width:  14*fem,
                                              height:  13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width:  8*fem,
                                          ),
                                          Container(
                                            // iconstarRRV (1:570)
                                            width:  14*fem,
                                            height:  13.42*fem,
                                            child:
                                            Image.network(
                                              '',
                                              width:  14*fem,
                                              height:  13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width:  8*fem,
                                          ),
                                          Container(
                                            // iconstar4DZ (1:572)
                                            width:  14*fem,
                                            height:  13.42*fem,
                                            child:
                                            Image.network(
                                             '',
                                              width:  14*fem,
                                              height:  13.42*fem,
                                            ),
                                          ),
                                          SizedBox(
                                            width:  8*fem,
                                          ),
                                          Container(
                                            // iconstarJ7u (1:574)
                                            width:  14*fem,
                                            height:  13.42*fem,
                                            child:
                                            Image.network(
                                             '',
                                              width:  14*fem,
                                              height:  13.42*fem,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // ametminimmollitnondeseruntulla (1:561)
                                      constraints:  BoxConstraints (
                                        maxWidth:  266*fem,
                                      ),
                                      child:
                                      Text(
                                        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                                        style:   TextStyle (


                                          fontWeight:  FontWeight.w700,

                                          letterSpacing:  0.09*fem,
                                          color:  Color(0xfffefefe),
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
            Container(
              // priceandactionUq1 (1:576)
              padding:  EdgeInsets.fromLTRB(24*fem, 22*fem, 24*fem, 22*fem),
              width:  double.infinity,
              height:  90*fem,
              decoration:  BoxDecoration (
                color:  Color(0xfffefefe),
              ),
              child:
              Container(
                // contentVk7 (1:578)
                width:  double.infinity,
                height:  double.infinity,
                child:
                Row(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  children:  [
                    Container(
                      // person1Cf (1:579)
                      margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                      child:
                      RichText(
                        text:
                        TextSpan(
                          style:   TextStyle (


                            fontWeight:  FontWeight.w700,

                            letterSpacing:  0.09*fem,
                            color:  Color(0xfffefefe),
                          ),
                          children:  [
                            TextSpan(
                              text:  '\$32 ',
                              style:   TextStyle (


                                fontWeight:  FontWeight.w700,

                                letterSpacing:  0.09*fem,
                                color:  Color(0xfffefefe),
                              ),
                            ),
                            TextSpan(
                              text:  '/ Person',
                              style:   TextStyle (


                                fontWeight:  FontWeight.w700,

                                letterSpacing:  0.09*fem,
                                color:  Color(0xfffefefe),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // labelpbM (I1:580;23:221)
                      width:  178*fem,
                      height:  double.infinity,
                      decoration:  BoxDecoration (
                        color:  Color(0xff7c73c3),
                        borderRadius:  BorderRadius.circular(20*fem),
                      ),
                      child:
                      Center(
                        child:
                        Text(
                          'Book Now',
                          style:   TextStyle (


                            fontWeight:  FontWeight.w700,

                            letterSpacing:  0.09*fem,
                            color:  Color(0xfffefefe),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
