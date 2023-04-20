import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountingPage extends StatefulWidget {
  const AccountingPage({Key? key}) : super(key: key);

  @override
  State<AccountingPage> createState() => _AccountingPageState();
}

class _AccountingPageState extends State<AccountingPage> {
  double fem=1;
  double ffem=0.9;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.black,
          // autogrouprkvrSXi (2Rx9Uf4y476NYfr8aarKVr)
          width:  double.infinity,
          height:  744*fem,
          child:
          Stack(
            children:  [

              Positioned(
                // autogroup8my2Bfe (2Rx7ToG1vHwd7SctNC8My2)
                left:  12*fem,
                top:  40*fem,
                child:
                Container(
                  width:  209*fem,
                  height:  25*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // backuLk (0:2456)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 97*fem, 0*fem),
                        width:  31*fem,
                        height:  24*fem,
                        child:
                        Image(image: AssetImage('assets/images/gondola.jpg'),
                        ),
                      ),
                      Text(
                        // settingspCp (0:2455)
                        'Account',
                        style:  GoogleFonts.inter (

                          fontSize:  20*ffem,
                          fontWeight:  FontWeight.w600,
                          height:  1.2125*ffem/fem,
                          color:  Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // line1MTe (0:2460)
                left:  20*fem,
                top:  236*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  320*fem,
                    height:  1*fem,
                    child:
                    Container(
                      decoration:  BoxDecoration (
                        color:  Color(0x7fffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // line2TWg (0:2461)
                left:  20*fem,
                top:  440*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  320*fem,
                    height:  1*fem,
                    child:
                    Container(
                      decoration:  BoxDecoration (
                        color:  Color(0x7fffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // line3Avt (0:2462)
                left:  20*fem,
                top:  635*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  320*fem,
                    height:  1*fem,
                    child:
                    Container(
                      decoration:  BoxDecoration (
                        color:  Color(0x7fffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // generalsettingshvp (0:2463)
                left:  20*fem,
                top:  103*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  113*fem,
                    height:  17*fem,
                    child:
                    Text(
                      'General ',
                      style:  GoogleFonts.inter (

                        fontSize:  14*ffem,
                        fontWeight:  FontWeight.w600,
                        height:  1.2125*ffem/fem,
                        color:  Color(0x7fffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // downloadpreferences1gc (0:2464)
                left:  20*fem,
                top:  268*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  154*fem,
                    height:  17*fem,
                    child:
                    Text(
                      'Download Preferences',
                      style:  GoogleFonts.inter (

                        fontSize:  14*ffem,
                        fontWeight:  FontWeight.w600,
                        height:  1.2125*ffem/fem,
                        color:  Color(0x7fffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // downloadvideoqualityiqv (0:2465)
                left:  20*fem,
                top:  472*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  163*fem,
                    height:  17*fem,
                    child:
                    Text(
                      'Download Video Quality',
                      style:  GoogleFonts.inter(

                        fontSize:  14*ffem,
                        fontWeight:  FontWeight.w600,
                        height:  1.2125*ffem/fem,
                        color:  Color(0x7fffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // deletealldownloads2rc (0:2466)
                left:  20*fem,
                top:  391*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  141*fem,
                    height:  17*fem,
                    child:
                    Text(
                      'Delete all downloads',
                      style:  GoogleFonts.inter (

                        fontSize:  14*ffem,
                        fontWeight:  FontWeight.w600,
                        height:  1.2125*ffem/fem,
                        color:  Color(0x4cffffff),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // autogroupafowY4G (2Rx7dnyMyMmYJz439VAFoW)
                left:  20*fem,
                top:  140*fem,
                child:
                Container(
                  width:  320*fem,
                  height:  25*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // autoplayfPn (0:2467)
                        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 205*fem, 0*fem),
                        child:
                        Text(
                          'Profile',
                          style:  GoogleFonts.inter(

                            fontSize:  16*ffem,
                            fontWeight:  FontWeight.w600,
                            height:  1.2125*ffem/fem,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                      TextButton(
                        // onoffPag (0:2473)
                        onPressed:  () {},
                        style:  TextButton.styleFrom (
                          padding:  EdgeInsets.zero,
                        ),
                        child:
                        Container(
                          width:  45*fem,
                          height:  25*fem,
                          child:
                          Image(image: AssetImage('assets/images/gondola.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // autogroupseakhbN (2Rx7yHQtNjjH9bFPAoseak)
                left:  20*fem,
                top:  305*fem,
                child:
                Container(
                  width:  320*fem,
                  height:  25*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.center,
                    children:  [
                      Container(
                        // autodeleteuponcompletionpfz (0:2468)
                        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 55*fem, 0*fem),
                        child:
                        Text(
                          'Autodelete upon completion',
                          style:  GoogleFonts.inter (

                            fontSize:  16*ffem,
                            fontWeight:  FontWeight.w600,
                            height:  1.2125*ffem/fem,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                      TextButton(
                        // onoffjY4 (0:2474)
                        onPressed:  () {},
                        style:  TextButton.styleFrom (
                          padding:  EdgeInsets.zero,
                        ),
                        child:
                        Container(
                          width:  45*fem,
                          height:  25*fem,
                          child:
                          Image(image: AssetImage('assets/images/gondola.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // autogroupmsiqTDA (2Rx8FcH1zgK5SWXL7TMsiQ)
                left:  20*fem,
                top:  509*fem,
                child:
                Container(
                  width:  304*fem,
                  height:  39*fem,
                  child:
                  Row(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // autogroupspgkmzY (2Rx8PSPJfp9FDKNztbsPgk)
                        margin:  EdgeInsets.fromLTRB(0*fem, 3*fem, 163*fem, 0*fem),
                        child:
                        Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children:  [
                            Container(
                              // highdefinitionJja (0:2469)
                              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                              child:
                              Text(
                                'High Definition',
                                style:  GoogleFonts.inter (

                                  fontSize:  16*ffem,
                                  fontWeight:  FontWeight.w600,
                                  height:  1.2125*ffem/fem,
                                  color:  Color(0xffffffff),
                                ),
                              ),
                            ),
                            Text(
                              // usesmoredata2fa (0:2479)
                              'Uses more data',
                              style:  GoogleFonts.inter (

                                fontSize:  12*ffem,
                                fontWeight:  FontWeight.w600,
                                height:  1.2125*ffem/fem,
                                color:  Color(0x4cffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        // checkboxah6 (0:2475)
                        onPressed:  () {},
                        style:  TextButton.styleFrom (
                          padding:  EdgeInsets.zero,
                        ),
                        child:
                        Container(
                          width:  26*fem,
                          height:  26*fem,
                          child:
                          Image(image: AssetImage('assets/images/gondola.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // autogroupg7seWKr (2Rx8WGXFwSbDsAtkbDg7se)
                left:  20*fem,
                top:  564*fem,
                child:
                Container(
                  width:  304*fem,
                  height:  39*fem,
                  child:
                  Row(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children:  [
                  Container(
                  // autogroupqexgDk4 (2Rx8dbeNupjJ5W5Tq6qExG)
                  margin:  EdgeInsets.fromLTRB(0*fem, 3*fem, 128*fem, 0*fem),
                  child:
                  Column(
                    crossAxisAlignment:  CrossAxisAlignment.start,
                    children:  [
                      Container(
                        // standarddefinitionkEC (0:2470)
                        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                        child:
                        Text(
                          'Standard Definition',
                          style:  GoogleFonts.inter (

                            fontSize:  16*ffem,
                            fontWeight:  FontWeight.w600,
                            height:  1.2125*ffem/fem,
                            color:  Color(0xffffffff),
                          ),
                        ),
                      ),
                      Text(
                        // useslessdatafrx (0:2480)
                        'Uses less data',
                        style:  GoogleFonts.inter (

                          fontSize:  12*ffem,
                          fontWeight:  FontWeight.w600,
                          height:  1.2125*ffem/fem,
                          color:  Color(0x4cffffff),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // checkboxR5S (0:2476)
                  margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 13*fem),
                  child:
                  TextButton(
                    onPressed:  () {},
                    style:  TextButton.styleFrom (
                      padding:  EdgeInsets.zero,
                    ),
                    child:
                    Container(
                      width:  26*fem,
                      child:
                      Center(
                        // rectangle96wZa (I0:2476;117:408)
                        child:
                        SizedBox(
                          width:  double.infinity,
                          height:  26*fem,
                          child:
                          Container(
                            decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(7*fem),
                                border:  Border.all(color:Color(0xffed1b24)),
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
        ),
        Positioned(
        // autogrouplygpUJc (2Rx7phpr9UMy34tH5mLYGp)
        left:  20*fem,
        top:  182*fem,
        child:
        Container(
        width:  320*fem,
        height:  25*fem,
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
        Container(
        // pushnotificationsBTv (0:2471)
        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 133*fem, 0*fem),
        child:
        Text(
        'Push Notifications',
        style:  GoogleFonts.inter (

        fontSize:  16*ffem,
        fontWeight:  FontWeight.w600,
        height:  1.2125*ffem/fem,
        color:  Color(0xffffffff),
        ),
        ),
        ),
        TextButton(
        // onoffhBN (0:2477)
        onPressed:  () {},
        style:  TextButton.styleFrom (
        padding:  EdgeInsets.zero,
        ),
        child:
        Container(
        width:  45*fem,
        height:  25*fem,
        child:
        Image(image: AssetImage('assets/images/gondola.jpg'),
        ),
        ),
        ),
        ],
        ),
        ),
        ),
        Positioned(
        // autogrouppaz6Qba (2Rx877XB3sZSvQ73wxPAZ6)
        left:  20*fem,
        top:  347*fem,
        child:
        Container(
        width:  320*fem,
        height:  25*fem,
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
        Container(
        // downloadonlywithwifijtk (0:2472)
        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 77*fem, 0*fem),
        child:
        Text(
        'Download only with Wi-Fi',
        style:  GoogleFonts.inter (

        fontSize:  16*ffem,
        fontWeight:  FontWeight.w600,
        height:  1.2125*ffem/fem,
        color:  Color(0xffffffff),
        ),
        ),
        ),
        TextButton(
        // onoff4RE (0:2478)
        onPressed:  () {},
        style:  TextButton.styleFrom (
        padding:  EdgeInsets.zero,
        ),
        child:
        Container(
        width:  45*fem,
        height:  25*fem,
        child:
        Image(image: AssetImage('assets/images/gondola.jpg'),
        ),
        ),
        ),
        ],
        ),
        ),
        ),
        Positioned(
        // mobilestrogemaY (0:2481)
        left:  20*fem,
        top:  651*fem,
        child:
        Align(
        child:
        SizedBox(
        width:  108*fem,
        height:  20*fem,
        child:
        Text(
        'Mobile Stroge',
        style:  GoogleFonts.inter (

        fontSize:  16*ffem,
        fontWeight:  FontWeight.w600,
        height:  1.2125*ffem/fem,
        color:  Color(0xffffffff),
        ),
        ),
        ),
        ),
        ),
        Positioned(
        // autogroupzn2tGGQ (2Rx8kvmVtCsNHqGB4yzN2t)
        left:  20*fem,
        top:  675*fem,
        child:
        Container(
        padding:  EdgeInsets.fromLTRB(0*fem, 0*fem, 113*fem, 0*fem),
        width:  320*fem,
        height:  15*fem,
        decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        ),
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.center,
        children:  [
        Container(
        // rectangle101Yzc (0:2489)
        width:  162*fem,
        height:  15*fem,
        decoration:  BoxDecoration (
        color:  Color(0xff0075ff),
        ),
        ),
        Container(
        // rectangle102uKN (0:2490)
        width:  45*fem,
        height:  15*fem,
        decoration:  BoxDecoration (
        color:  Color(0xffed1b24),
        ),
        ),
        ],
        ),
        ),
        ),
        Positioned(
        // autogroupynh6qyi (2Rx94fkwKwumfmcAhsyNh6)
        left:  20*fem,
        top:  701*fem,
        child:
        Container(
        width:  320*fem,
        height:  20*fem,
        child:
        Row(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children:  [
        Container(
        // rectangle98Zui (0:2483)
        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 4*fem, 0*fem),
        width:  15*fem,
        height:  15*fem,
        decoration:  BoxDecoration (
        color:  Color(0xff0075ff),
        ),
        ),
        Container(
        // usedW4G (0:2486)
        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 64*fem, 0*fem),
        child:
        Text(
        'Used',
        style:  GoogleFonts.inter (

        fontSize:  16*ffem,
        fontWeight:  FontWeight.w600,
        height:  1.2125*ffem/fem,
        color:  Color(0xb2ffffff),
        ),
        ),
        ),
        Container(
        // rectangle99DzG (0:2484)
        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 4*fem, 0*fem),
        width:  15*fem,
        height:  15*fem,
        decoration:  BoxDecoration (
        color:  Color(0xffed1b24),
        ),
        ),
        Container(
        // marvelZ2Y (0:2487)
        margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 70*fem, 0*fem),
        child:
        Text(
        'Marvel',
        style:  GoogleFonts.inter (

        fontSize:  16*ffem,
        fontWeight:  FontWeight.w600,
        height:  1.2125*ffem/fem,
        color:  Color(0xb2ffffff),
        ),
        ),
        ),
        Container(
        // rectangle100UQQ (0:2485)
        margin:  EdgeInsets.fromLTRB(0*fem, 1*fem, 4*fem, 0*fem),
        width:  15*fem,
        height:  15*fem,
        decoration:  BoxDecoration (
        color:  Color(0xffffffff),
        ),
        ),
        Text(
        // freepDN (0:2488)
        'Free',
        style:  GoogleFonts.inter (

        fontSize:  16*ffem,
        fontWeight:  FontWeight.w600,
        height:  1.2125*ffem/fem,
        color:  Color(0xb2ffffff),
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
    );
  }
}
