import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/car_model.dart';
import 'car_screen.dart';
import 'car_tab.dart';


class CarCarousel extends StatelessWidget {
  final List<Map<String, String>> cars = [
    {

      'imageUrl': 'assets/images/subaru.jpeg',
      'name': 'Subaru',
      'address': 'Kitengela,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyoavoxy.jpeg',
      'name': 'Voxy',
      'address': 'Kikuyu,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/pajero.jpeg',
      'name': 'Pajero',
      'address': 'Machakos,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/prado.jpeg',
      'name': 'Subaru',
      'address': 'Kitengela,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotaaxio.jpg',
      'name': 'Toyota Axio',
      'address': 'Nairobi,Kenya',
      'price': '175',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotaprius.jpg',
      'name': 'Toyota Prius',
      'address': 'Nairobi,Kenya',
      'price': '300',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotamarkx.jpg',
      'name': 'Toyota Mark X',
      'address': 'Nairobi,Kenya',
      'price': '140',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotahiace.jpeg',
      'name': 'Toyota Hiace ',
      'address': 'Nairobi,Kenya',
      'price': '200',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'SUV/4*4',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/toyotahilux.jpg',
      'name': 'Toyota Hilux',
      'address': 'Nairobi,Kenya',
      'price': '540',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'Pick Up',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '7',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
    {

      'imageUrl': 'assets/images/bushire.jpg',
      'name': 'Bus HINO 500',
      'address': 'Nairobi,Kenya',
      'price': '124',
      'modelyear': '2019',

      'geartype': 'Auto',
      'type': 'Bus',
      'doors': '5',
      'engine': 'Petrol',
      'pass': '4',
      'luggage': '6',
      'description': 'assdfghbvcdertghbvcdsertghbvcdserg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Car Rentals',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CarTab(),),);},
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cars.length,
            itemBuilder: (BuildContext context, int index) {

              return GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CarScreen(car: cars[index]),),);},
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 160.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: cars[index]['imageUrl']!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 180.0,
                                  image: AssetImage(cars[index]['imageUrl']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.moneyBill,
                                            size: 10.0,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            cars[index]['price']!+ ' Ksh',
                                            style: GoogleFonts.bebasNeue(
                                              color: Colors.white,


                                            ),
                                          ),
                                        ],
                                      ),

                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 10.0,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5.0),
                                    Wrap(
                                      children: [
                                        Text(
                                          cars[index]['address']!,
                                          style: GoogleFonts.bebasNeue(




                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              top: 10.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(2.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            FontAwesomeIcons.bus,
                                            size: 10.0,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5.0),
                                          Wrap(
                                            children: [
                                              Text(
                                                cars[index]['name']!,
                                                style: GoogleFonts.abrilFatface(
                                                  color: Colors.white,

                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
