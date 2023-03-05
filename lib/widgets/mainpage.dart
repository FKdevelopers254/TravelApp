import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authpage.dart';
import '../screens/profilescreen.dart';
import 'package:eastravel/widgets/bottom_bar.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:  (context, snapshot){
          if(snapshot.hasData){
            return const BottomBar();

          } else{
            return const AuthPage();
          }
        },
      ),
    );
  }
}
