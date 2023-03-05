
import 'package:eastravel/hoteladmin/rooms.dart';
import 'package:eastravel/widgets/safari_tab.dart';
import 'package:eastravel/widgets/workingdata.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../widgets/glassbox.dart';
import 'addroom.dart';
import 'homepage.dart';
import 'homescreen.dart';








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
        body: Center(

          child: getSelectedWidget(index: index),

        ),

        bottomNavigationBar:GlassBox(
          child: BottomNavigationBar(
            items:   const [
              BottomNavigationBarItem(
                  icon: Image(image: AssetImage('assets/images/gondola.jpg'),height: 20,),activeIcon: Icon(Icons.home_filled), label: 'Hotels'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.hotel_rounded,),activeIcon: Icon(Icons.hotel_outlined), label: 'Rooms') ,
              BottomNavigationBarItem(
                  icon: Icon(Icons.car_rental),activeIcon: Icon(Icons.car_rental_rounded), label: 'Amenities'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tour),activeIcon: Icon(Icons.tour_outlined), label: 'Year Rates'),
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
        widget =  const HomeP();
        break;

      case 1:
        widget =   rHomePage();
        break;
      case 2:
        widget =   HomePage();
        break;
      default:
        widget =  HomePage();
        // widget = AddPage();
        //widget = ViewData();
        // widget = DeleteData();
        // widget = WorkingData();


        break;
    }
    return widget;
  }










}



