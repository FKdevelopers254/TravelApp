import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/car_screen.dart';
import 'safari_screen.dart';

class SafariTabType extends StatefulWidget {
  const SafariTabType({Key? key}) : super(key: key);

  @override
  State<SafariTabType> createState() => _SafariTabTypeState();
}

class _SafariTabTypeState extends State<SafariTabType> {
  final List<Map<String, String>> safaris = [
    {

      'imageUrl': 'assets/images/radissonblu.jpg',
      'name': 'Kenya at a Glance',
      'location': 'Maasai Mara,Nakuru,Naivasha,Nairobi',
      'country': 'Kenya',
      'price': '175',
      'days': '6',
      'nights': '5',
      'hotelname': 'Enashipai Lodge',
      'pps': '5000',
      'sr': '12005',
      'meals': 'FULL BOARD(ALL INCLUSIVE)',
      'selfdriveprice': '5',
      'description': 'rdfgfdffgfdfgbvfdf',
    },
    {

      'imageUrl': 'assets/images/gondola.jpg',
      'name': 'Rift Valley Trails Safari',
      'location': 'Lake Naivasha,Lake Nakuru',
      'country': 'Kenya',
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

      'imageUrl': 'assets/images/murano.jpg',
      'name': 'Rift valley',
      'location': 'L.Naivasha,Elementaita',
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
      'name': 'Toyota Axio',
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

  List<Map<String, String>> _filteredItems = [];

  final _searchController = TextEditingController();
  String _searchText = "";



  @override
  void initState() {
    super.initState();
    _filteredItems = safaris;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900]?.withOpacity(0.5),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type of Safari e.g Family,Budget,Exclusive",
            hintStyle: TextStyle(color: Colors.black,),
            border: InputBorder.none,
          ),
          onChanged: (value){
            setState(() {
              _searchText = value;
              _filteredItems = safaris
                  .where((item) => item['location']!.toLowerCase().contains(_searchText))
                  .toList();
            });
          },




        ),
        actions: [


        ],


      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/2.9,
          mainAxisSpacing: 2,
          crossAxisSpacing: 10,

        ),
        padding: const EdgeInsets.all(8),

        itemCount: _filteredItems.length,
        itemBuilder: (BuildContext content,int index){
          return InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariScreen(safari: _filteredItems[index]),),);},
            child: Container(
              margin: const EdgeInsets.only(top: 5.0,bottom: 5.0),
              width: 210.0,
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
                    child: Column(
                      children: [
                        Hero(
                          tag: _filteredItems[index]['imageUrl']!,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: AssetImage(_filteredItems[index]['imageUrl']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(

                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0,top: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.hotel,
                                      size: 10.0,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      _filteredItems[index]['name']!,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        // letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 10.0,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 5.0),
                                    Text(
                                      _filteredItems[index]['location']!,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.6)
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

    );
  }
}
