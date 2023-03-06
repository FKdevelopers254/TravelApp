import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;


import '../screens/hotel_screen.dart';
import 'hotel_tab_location.dart';
import 'hotel_tab_price.dart';

class HotelTabNet extends StatefulWidget {
  const HotelTabNet({Key? key}) : super(key: key);

  @override
  State<HotelTabNet> createState() => _HotelTabNetState();
}

class _HotelTabNetState extends State<HotelTabNet> {



  List<dynamic> _filteredItems = [];
  List<dynamic> _data = [];

  final _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _getData();
    _filteredItems = _data;
  }


  Future<void> _getData() async {
    final response = await http.get(Uri.parse('https://markiniltd.com/eas/gethoteltab.php'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _data = data['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900]?.withOpacity(0.5),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Hotel Name",
            hintStyle: TextStyle(color: Colors.black,),
            border: InputBorder.none,
          ),
          onChanged: (value){
            setState(() {
              _searchText = value;
              _filteredItems = _data
                  .where((item) => item['name']!.toLowerCase().contains(_searchText))
                  .toList();
            });
          },




        ),
        actions: [
          ElevatedButton(

              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return Container(
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Container(

                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                                offset: Offset(0.0, -2.0),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child:

                                Row(
                                  children: [
                                    ElevatedButton(

                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder:  (context) => const HotelTabLocation()
                                            ));
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.local_airport),
                                          Text(
                                            'Location',style: TextStyle(fontSize: 20),),
                                        ],
                                      ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    ElevatedButton(

                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder:  (context) => const HotelTabPrice()
                                            ));
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.local_atm),
                                          Text(
                                            'Price',style: TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      );
                    }
                );
              },
              child: Row(
                children: const [
                  Text('Search by'),
                  Icon(Icons.arrow_circle_down),
                ],
              ))

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
