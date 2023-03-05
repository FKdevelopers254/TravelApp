import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        // onboardingQhR (1:344)
        padding:  EdgeInsets.fromLTRB(0, 0, 0, 34),
        width:  double.infinity,
        decoration:  BoxDecoration (
          color:  Color(0xffffffff),
        ),
        child:
        Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children:  [
            Container(
              // subtractdq5 (1:345)
              margin:  EdgeInsets.fromLTRB(0, 0, 0, 32),
              width:  375,
              height:  490,
              child:
              Image.network('',
                width:  375,
                height:  490,
              ),
            ),
            Container(
              // contentJwD (1:352)
              margin:  EdgeInsets.fromLTRB(24, 0, 24, 0),
              width:  double.infinity,
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.center,
                children:  [
                  Container(
                    // group1000003277qAT (1:354)
                    margin:  EdgeInsets.fromLTRB(15.5, 0, 15.5, 33),
                    width:  double.infinity,
                    child:
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Center(
                          // weareheretomakeyourholidayeasi (1:355)
                          child:
                          Container(
                            margin:  EdgeInsets.fromLTRB(0, 0, 0, 9),
                            constraints:  BoxConstraints (
                              maxWidth:  296,
                            ),
                            child:
                            Text(
                              'We are here to make your holiday easier',
                              textAlign:  TextAlign.center,
                              style:  TextStyle (

                                fontSize:  24,
                                fontWeight:  FontWeight.w700,


                                color:  Color(0xff111111),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          // loremipsumissimplydummytextoft (1:356)
                          child:
                          Container(
                            margin:  EdgeInsets.fromLTRB(1, 0, 0, 0),
                            constraints:  BoxConstraints (
                              maxWidth:  272,
                            ),
                            child:
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                              textAlign:  TextAlign.center,
                              style:  TextStyle (

                                fontSize:  14,
                                fontWeight:  FontWeight.w500,

                                color:  Color(0xff78828a),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // actionB1M (1:357)
                    width:  double.infinity,
                    child:
                    Column(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // labelhkP (I1:359;23:223)
                          margin:  EdgeInsets.fromLTRB(0, 0, 0, 24),
                          width:  double.infinity,
                          height:  58,
                          decoration:  BoxDecoration (
                            color:  Color(0xff7c73c3),
                            borderRadius:  BorderRadius.circular(24,
                            ),),
                          child: Column(
                            children: [
                              Center(
                                child:
                                Text(
                                  'Get Started',
                                  style:  TextStyle (

                                    fontSize:  18,
                                    fontWeight:  FontWeight.w600,

                                    color:  Color(0xfffefefe),
                                  ),
                                ),
                              ),
                              Center(
                                // donthaveanaccountregister851 (1:358)
                                child:
                                Container(
                                  margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                                  child:
                                  RichText(
                                    textAlign:  TextAlign.center,
                                    text:
                                    TextSpan(
                                      style:  TextStyle (

                                        fontSize:  16,
                                        fontWeight:  FontWeight.w600,

                                        color:  Color(0xffffffff),
                                      ),
                                      children:  [
                                        TextSpan(
                                          text:  'Don’t have an account? ',
                                          style:  TextStyle (

                                            fontSize:  16,

                                            color:  Color(0xff111111),
                                          ),
                                        ),
                                        TextSpan(
                                          text:  'Register',
                                          style:  TextStyle (

                                            fontSize:  16,
                                            fontWeight:  FontWeight.w600,

                                            color:  Color(0xff009b8d),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
