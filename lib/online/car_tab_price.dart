import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'car_screen.dart';

class CarTabPrice extends StatefulWidget {
  const CarTabPrice({Key? key}) : super(key: key);

  @override
  State<CarTabPrice> createState() => _CarTabPriceState();
}

class _CarTabPriceState extends State<CarTabPrice> {
  final List<Map<String, String>> cars = [
    {

      'imageUrl': 'assets/images/toyotaaxio.jpg',
      'name': 'Toyota Axio',
      'address': 'Nairobi,Kenya',
      'price': '175',
      'modelyear': '2019',
      'description': 'Axio',
      'geartype': 'Auto',
    },
    {

      'imageUrl': 'assets/images/toyotaprius.jpg',
      'name': 'Toyota Prius',
      'address': 'Nairobi,Kenya',
      'price': '300',
      'modelyear': '2019',
      'description': 'Axio',
      'geartype': 'Auto',
    },
    {

      'imageUrl': 'assets/images/toyotamarkx.jpg',
      'name': 'Toyota Mark X',
      'address': 'Nairobi,Kenya',
      'price': '140',
      'modelyear': '2019',
      'description': 'Axio',
      'geartype': 'Auto',
    },
    {

      'imageUrl': 'assets/images/toyotamarkx.jpg',
      'name': 'Toyota Mark X',
      'address': 'Nairobi,Kenya',
      'price': '200',
      'modelyear': '2019',
      'description': 'Axio',
      'geartype': 'Auto',
    },
    {

      'imageUrl': 'assets/images/toyotaprius.jp',
      'name': 'Toyota Axio',
      'address': 'Nairobi,Kenya',
      'price': '540',
      'modelyear': '2019',
      'description': 'Axio',
      'geartype': 'Auto',
    },
    {

      'imageUrl': 'assets/images/toyotaprius.jp',
      'name': 'Toyota Corolla',
      'address': 'Nairobi,Kenya',
      'price': '124',
      'modelyear': '2019',
      'description': 'Axio',
      'geartype': 'Auto',
    },
  ];

  List<Map<String, String>> _filteredItems = [];

  final _searchController = TextEditingController();
  String _searchText = "";



  @override
  void initState() {
    super.initState();
    _filteredItems = cars;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900]?.withOpacity(0.5),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Car Price",
            hintStyle: TextStyle(color: Colors.black,),
            border: InputBorder.none,
          ),
          onChanged: (value){
            setState(() {
              _searchText = value;
              _filteredItems = cars
                  .where((item) => item['name']!.toLowerCase().contains(_searchText))
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
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CarScreen(car: _filteredItems[index]),),);},
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
                                      _filteredItems[index]['address']!,
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
