
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


import 'safari_screen.dart';

class SafariTabLocation extends StatefulWidget {
  const SafariTabLocation({Key? key}) : super(key: key);

  @override
  State<SafariTabLocation> createState() => _SafariTabLocationState();
}

class _SafariTabLocationState extends State<SafariTabLocation> {
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
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Safari Location",
            hintStyle: TextStyle(color: Colors.white,),
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
          childAspectRatio: 2/2,
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
                            _filteredItems[index]['hotelname']!,
                            style: GoogleFonts.bebasNeue(
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              // letterSpacing: 1.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
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


                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
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
                                    const Icon(Icons.date_range,size: 15,),
                                    Text(
                                      _filteredItems[index]['days']!,
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
