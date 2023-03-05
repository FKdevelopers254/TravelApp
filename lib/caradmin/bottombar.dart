
import 'package:eastravel/widgets/safari_tab.dart';
import 'package:eastravel/widgets/workingdata.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import 'homepage.dart';








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
        body: Center(

          child: getSelectedWidget(index: index),

        ),

        bottomNavigationBar:BottomNavigationBar(
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
          elevation: 40,
          selectedItemColor: Colors.red,
          // color: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          showSelectedLabels: true,
          showUnselectedLabels: true,


          // backgroundColor: Colors.grey[300],

          onTap: (selectedIndex){
            setState(() {
              index = selectedIndex;
            });
          },








        )

    );
  }






  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
      //  widget =  CardWithImageAndTextExample();
        widget =  CarHomePage();
        break;

      case 1:
        widget =   CarHomePage();
        break;
      case 2:
        widget =   CarHomePage();
        break;
      default:
        widget =  CarHomePage();
        // widget = AddPage();
        //widget = ViewData();
        // widget = DeleteData();
        // widget = WorkingData();


        break;
    }
    return widget;
  }










}



