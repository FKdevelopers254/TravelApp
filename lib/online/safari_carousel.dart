import 'package:eastravel/widgets/safari_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


import 'safari_screen.dart';


class SafariCarousel extends StatelessWidget {
  final List<Map<String, String>> safaris = [
    {

      'imageUrl': 'assets/images/radissonblu.jpg',
      'name': 'Kenya at a Glance',
      'location': 'Lake Nakuru,Maasai Mara',
      'country': 'Kenya',
      'price': '1545',
      'days': '5',
      'nights': '4',
      'hotelname': 'Flamingo Hill Lodge,Zebra Plains Mara Camp',
      'pps': '800',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'Day 1 Arrival in Nairobi',
    },
    {

      'imageUrl': 'assets/images/gondola.jpg',
      'name': 'WINGS OVER SAFARI',
      'location': 'Amboseli,Maasai Mara',
      'country': 'Kenya',
      'price': '2673',
      'days': '6',
      'nights': '5',
      'hotelname': 'Kilima Safari Camp',
      'pps': '1400',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
    {

      'imageUrl': 'assets/images/murano.jpg',
      'name': 'Glimpse of Kenya',
      'location': 'Samburu,Maasai Mara',
      'country': 'Nairobi,Kenya',
      'price': '175',
      'days': '6',
      'nights': '5',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
    {

      'imageUrl': 'assets/images/newdelhi.jpg',
      'name': 'Kenya Flying Budget Safari',
      'location': 'Nairobi,Kenya',
      'country': 'Nairobi,Kenya',
      'price': '175',
      'days': '6',
      'nights': '5',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
    {

      'imageUrl': 'assets/images/newyork.jpg',
      'name': 'Toyota Axio',
      'address': 'Nairobi,Kenya',
      'price': '540',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'Axio',

    },
    {

      'imageUrl': 'assets/images/olesereni.jpg',
      'namex': 'Toyota Axio',
      'location': 'Nairobi,Kenya',
      'country': 'Nairobi,Kenya',
      'price': '175',
      'days': '6',
      'nights': '5',
      'hotelname': 'Chui Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
  ];
  SafariCarousel({Key? key}) : super(key: key);

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
                'Popular Places',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariTab(),),);},
               // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariTab(),),);},
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
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: safaris.length,
            itemBuilder: (BuildContext context, int index) {
             // Destination destination = destinations[index];
              return GestureDetector(
               // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EventSingles(safari: safaris[index]),),);},
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariScreen(safari: safaris[index]),),);},
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: 300.0,
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
                              tag: safaris[index]['imageUrl']!,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 250.0,
                                  width: 300.0,
                                  image: AssetImage(safaris[index]['imageUrl']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 5.0,
                              bottom: 5.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  //  color: Colors.deepPurple.shade900.withOpacity(0.6),
                                    color: Theme.of(context).primaryColor.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10)
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                            FontAwesomeIcons.safari,
                                            size: 10.0,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            safaris[index]['location']!,
                                            style: GoogleFonts.abrilFatface(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              const Icon(
                                                FontAwesomeIcons.calendarDay,
                                                size: 10.0,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                safaris[index]['days']!,
                                                style: GoogleFonts.abrilFatface(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                ' Days',
                                                style: GoogleFonts.abrilFatface(
                                                  color: Colors.white,
                                                ),
                                              )

                                            ],
                                          ),
                                          SizedBox(width: 30,),
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                FontAwesomeIcons.moneyBill,
                                                size: 10.0,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 5.0),
                                              Text(
                                                safaris[index]['price']!,
                                                style: GoogleFonts.bebasNeue(
                                                  color: Colors.white,
                                                ),
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 5.0,
                              top: 5.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  //  color: Colors.deepPurple.shade900.withOpacity(0.6),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2)
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Wrap(
                                      children: [
                                        Text(
                                          safaris[index]['name']!,
                                          style: GoogleFonts.bebasNeue(
                                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ],
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



