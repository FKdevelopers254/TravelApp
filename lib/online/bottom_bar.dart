
import 'package:eastravel/screens/profilescreen.dart';
import 'package:eastravel/widgets/safari_tab.dart';
import 'package:eastravel/widgets/workingdata.dart';
import 'package:flutter/material.dart';

import '../templates/tabpage.dart';
import 'home_screen.dart';

import 'car_tab.dart';

import 'glassbox.dart';
import 'hotel_tab.dart';








class BottomBarOffline extends StatefulWidget {
  const BottomBarOffline({Key? key}) : super(key: key);

  @override
  State<BottomBarOffline> createState() => _BottomBarOfflineState();
}

class _BottomBarOfflineState extends State<BottomBarOffline> {

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
        widget =  const HotelTab();
        break;
      case 2:
        widget =  const CarTab();
        break;
      default:
        widget =  const TabPage();
       // widget = const SafariTab();
       // widget = AddPage();
        //widget = ViewData();
       // widget = DeleteData();
       // widget = WorkingData();


        break;
    }
    return widget;
  }










}



