import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'hotel_screen.dart';

class HotelTabPrice extends StatefulWidget {
  const HotelTabPrice({Key? key}) : super(key: key);

  @override
  State<HotelTabPrice> createState() => _HotelTabPriceState();
}

class _HotelTabPriceState extends State<HotelTabPrice> {

  final List<Map<String, String>> hotels = [
    {

      'imageUrl': 'assets/images/radissonblu.jpg',
      'name': 'Radisson Blu Hotel',
      'address': 'Nairobi,Kenya',
      'price': '175',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'large',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'large',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'large',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/kenyacomfort3.jpg',
      'name': 'Kenya Comfort Suites',
      'address': 'Nairobi,Kenya',
      'price': '300',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'large',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'large',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'large',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/olesereni.jpg',
      'name': 'Ole Sereni-Nairobi ',
      'address': 'Nairobi,Kenya',
      'price': '140',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'large',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'large',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'large',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/fourpoints.jpg',
      'name': 'Four Points Sheraton',
      'address': 'Nairobi,Kenya',
      'price': '200',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'large',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'large',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'large',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/sarovastanley.jpg',
      'name': 'Sarova Stanley',
      'address': 'Nairobi,Kenya',
      'price': '540',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'large',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'large',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'large',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/kozi3.jpg',
      'name': 'Kozi Suites Nairobi',
      'address': 'Nairobi,Kenya',
      'price': '124',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'large',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'large',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'large',
      'room3desc':'assets/images/radissonblu.jpg',
    },

  ];
  List<Map<String, String>> _filteredItems = [];

  final _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _filteredItems = hotels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.deepPurple[900]?.withOpacity(0.5),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Search by price",
            hintStyle: TextStyle(color: Colors.black,),
            border: InputBorder.none,
          ),
          onChanged: (value){
            setState(() {
              _searchText = value;
              _filteredItems = hotels
                  .where((item) => item['price']!.toLowerCase().contains(_searchText))
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
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: _filteredItems[index]),),);},
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
                      boxShadow: const [
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.6)
                          ),

                          child: Padding(
                            padding: const EdgeInsets.only(left: 4.0,top: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.hotel,
                                      size: 10.0,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      _filteredItems[index]['name']!,
                                      style: const TextStyle(
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
                                    const Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 10.0,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      _filteredItems[index]['address']!,
                                      style: const TextStyle(
                                        color: Colors.black,
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

    );
  }
}
