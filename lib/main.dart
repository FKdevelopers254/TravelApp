import 'package:eastravel/hoteladmin/homepage.dart';
import 'package:eastravel/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:get/get.dart';

import 'package:eastravel/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'admin/homepage.dart';
import 'online/bottom_bar.dart';
import 'widgets/mainpage.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}





class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InternetWidget(
      offline:  FullScreenWidget(
        child: BottomBarOffline()
      ),
      // ignore: avoid_print
      whenOffline: () => print('No Internet'),
      // ignore: avoid_print
      whenOnline: () => print('Connected to internet'),
      loadingWidget:  Center(child: Lottie.asset('assets/icons/137519-hotel.json',height: 70,),),
      online: MaterialApp(
        title: 'East African Safaris',
        theme: ThemeData(
          useMaterial3: true,
          unselectedWidgetColor: Colors.black,
          primaryColor: const Color(0xFF3EBACE),

          scaffoldBackgroundColor: const Color(0xFFF3F5F7),
        ),
        debugShowCheckedModeBanner: false,
        home: const MainPage()
      ),
    );


  }
}
