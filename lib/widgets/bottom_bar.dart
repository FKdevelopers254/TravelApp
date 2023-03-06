
import 'package:eastravel/widgets/safari_tab.dart';
import 'package:eastravel/widgets/safaridata.dart';
import 'package:eastravel/widgets/workingdata.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profilescreen.dart';

import 'car_tab.dart';

import 'cardata.dart';
import 'glassbox.dart';
import 'hotel_tab.dart';
import 'hoteldata.dart';








class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

        body: Center(child: getSelectedWidget(index: index),),

        bottomNavigationBar:GlassBox(
          child: BottomNavigationBar(
            items:   const [
              BottomNavigationBarItem(
                  icon: Image(image: AssetImage('assets/images/gondola.jpg'),height: 20,),activeIcon: Icon(Icons.home_filled), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.hotel_rounded,),activeIcon: Icon(Icons.hotel_outlined), label: 'Hotels') ,
              BottomNavigationBarItem(
                  icon: Icon(Icons.car_rental),activeIcon: Icon(Icons.car_rental_rounded), label: 'Cars'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tour),activeIcon: Icon(Icons.tour_outlined), label: 'Safaris'),

              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),activeIcon: Icon(Icons.account_box_outlined), label: 'Account'),

            ],

            currentIndex: index,
            elevation: 0,
            selectedItemColor: Theme.of(context).primaryColor,
           backgroundColor: Colors.transparent,

           // color: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,


           // backgroundColor: Colors.grey[300],

            onTap: (selectedIndex){
              setState(() {
                index = selectedIndex;
              });
            },








          ),
        )

    );
  }






  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
      //  widget =  CardWithImageAndTextExample();
        widget =  const HomeScreen();
        break;

      case 1:
        widget =  const HotelP();
        break;
      case 2:
        widget =  const CarP();
        break;
      case 3:
        widget = const SafariP();
        break;

      default:
        widget = const HomeP();
        break;
    }
    return widget;
  }










}



