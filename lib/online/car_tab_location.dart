
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'car_screen.dart';

class CarTabLocation extends StatefulWidget {
  const CarTabLocation({Key? key}) : super(key: key);

  @override
  State<CarTabLocation> createState() => _CarTabLocationState();
}

class _CarTabLocationState extends State<CarTabLocation> {
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
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Car Location",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value){
            setState(() {
              _searchText = value;
              _filteredItems = cars
                  .where((item) => item['location']!.toLowerCase().contains(_searchText))
                  .toList();
            });
          },




        ),
        actions: const [


        ],


      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/2,
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

              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: _filteredItems[index]['imageUrl']!,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          height: 180.0,
                          width: 180.0,
                          image: AssetImage(_filteredItems[index]['imageUrl']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(2),
                      ),


                      child: Wrap(
                        children: [
                          Text(
                            _filteredItems[index]['name']!,
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                      ),


                      child: Wrap(
                        children: [
                          Text(
                            _filteredItems[index]['address']!,
                            style: GoogleFonts.bebasNeue(
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              // letterSpacing: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(2),
                      ),


                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                '${_filteredItems[index]['price']!} \$',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(2),
                      ),


                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.luggage_outlined,size: 15,),
                                    Text(
                                      _filteredItems[index]['luggage']!,
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,

                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.person_2,size: 15,),
                                    Text(
                                      _filteredItems[index]['pass']!,
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,

                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.door_front_door_outlined,size: 15,),
                                    Text(
                                      _filteredItems[index]['luggage']!,
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,

                                        fontWeight: FontWeight.w600,
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

                ],
              ),
            )


          );
        },


      ),

    );
  }
}
