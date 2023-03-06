import 'package:eastravel/widgets/safari_tab_location.dart';
import 'package:eastravel/widgets/safari_tab_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'safari_screen.dart';

class SafariTab extends StatefulWidget {
  const SafariTab({Key? key}) : super(key: key);

  @override
  State<SafariTab> createState() => _SafariTabState();
}

class _SafariTabState extends State<SafariTab> {
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
      'safaritype': 'Budget',


      'description': 'Day 1  Arrival Nairobi Approximately 22kms takes approximately 1 hour’s drive depending on trafficBonfire Adventures guide driver will warmly meet you on arrival at the Jomo Kenyatta International Airport, and transfer you to the Ibis Styles Hotel. Check in then we brief you on what will hopefully be your best holiday in Africa. Enjoy overnight. You are booked on Bed & BreakfastIbis Styles Hotel Located in the Westlands business district, ibis Styles is the ideal spot for a business and leisure traveler who is conscious about value for money and affordability. The hotel provides everything you would need for your trip in a chic atmosphere and an amazing team of rock stars is always in a happy mood to enhance your experience.277 bedrooms mainly characterized by space efficiency are tastefully designed with pops of color, and stylish and trendy touches ready for the savvy explorer. Access to high-speed Wi-Fi is guaranteed for all in-house guests whether with us for a good night’s sleep or for our up-to-date business facilities. The hotel’s meeting rooms accommodate up to 180 delegates amongst other amenities such as a newly opened fitness center, contemporary casual dining restaurant, and Coffee Shop/Take Away bar on the ground floor. The hotel’s rooftop boasts a Sports Bar and a BBQ Restaurant with breathtaking panoramic views of the Nairobi skyline. Day 2   Nairobi – Lake Nakuru National Park Approximately 170kms takes approximately 3.5 hours’ drive depending on trafficEnjoy breakfast then we drive you to the Lake Nakuru national park with a brief stop at the Great Rift Valley viewpoint. We will be arriving at the Flamingo Hill Tented Camp for check-in and then lunch. Enjoy an afternoon game viewing drive. The park is famous for the abundant greater and lesser flamingoes (when the water levels on the lake are low). Wildlife here is bountiful including lion, cheetah, leopard, and hyenas.  Rothschild giraffe, as well as black and white rhino, are also found here. Lake Nakuru National Park is an ornithological paradise for bird lovers as well. Enjoy dinner and overnight. Flamingo Hill Tented Camp The Flamingo Hill Camp is situated within the famous Lake Nakuru National Park, which lies within the Great Rift Valley of Kenya. Nestled between the “honeymoon hills”, and set in beautifully landscaped grounds with natural foliage and a variety of indigenous African plants and flowers, Flamingo Hill Camp provides superb, tented accommodation. Flamingo Hill Camp is an eco-friendly establishment. Part of the money earned from the camp is used for environmental restoration and endangered species. Cozy, warm and inviting with a personal touch, Flamingo Hill Camp offers the traveler a home away from home!Day 3   Lake Nakuru National Park – Masai Mara National Reserve Approximately 270kms takes approximately 6 hours’ drive Enjoy breakfast then we pick and drive you to the Masai Mara National Reserve. This is arguably one of the best African Safaris destinations. You will be arriving at the Zebra Plains Mara Camp for check-in and then lunch. Proceed on an afternoon game viewing drive. Later return back to the camp for dinner and overnight. Day 4   Masai Mara National Reserve Enjoy breakfast then depart with packed lunch for a full day of game viewing drives. You can also opt for morning and afternoon game viewing drives with hot lunch at the lodge. This famous game reserve is world famous for the spectacular wildebeest migration between July through to September each year, and the abundant wildlife including the ‘Big five’ of Africa. The reserve is surrounded by Masai traditional home-steads and so at a small extra cost, you may want to experience a cultural visit to one of them.  Enjoy dinner and overnight at the Zebra Plains Mara Camp. Zebra Plains Mara Camp Zebra Plains Mara Camps luxury tented rooms are furnished with all the amenities that you will require for a comfortable stay whilst visiting the Maasai Mara. The rooms can be converted into doubles, singles, or triples depending on the guests’ requests. Two of our luxury tented rooms are designed for honeymooners and those set to celebrate their special occasions. The camp has one standard luxury tented family tent that has two connected rooms with each of the rooms having its own amenities. It is recommended for families with small children, 4 adults sharing in two twins, or 2 Adults in single room occupancy. It is not recommended for two couples. The camp also has two deluxe tented family Villas. These tents are very spacious and each of them has two rooms connected by a lounge and dining which still can be converted into a room. These villas are recommended for families with small children or teenagers,6 Adults either in 3 twins/2 triples, 2 couples who know each other or even one family that has up to 8 members. Each of the 3 rooms (Lounge & Dining included) in each family Villa has its own amenities, own entrances, and own Verandahs. All of Zebra Plains Mara Camp tents have both cold and hot running water for showers. They are as well furnished with a washing basin, flushing toilet, luggage rack, reading table, mosquito nets, and comfy safari chairs to experience the amazing views from the verandahs. Day 5  Departure Approximately 290kms takes approximately 7 hours’ drive depending on traffic Enjoy breakfast then check out. We drive you back to Nairobi which takes proximately 7 hours. Alternatively, at an extra cost, you may opt for a one-hour light scheduled flight to the Wilson Airport. If time allows you will enjoy lunch before our guide driver drops you at the Jomo Kenyatta International Airport for your departure flight. Thank you for allowing Bonfire Adventures to host you on your Kenya safari.',
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
            hintText: "Type Safari Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value){
            setState(() {
              _searchText = value;
              _filteredItems = safaris
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
                          color: Color(0xFF3EBACE),
                          //  image: DecorationImage(image: AssetImage('lib/assets/images/olesereni.jpg')),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Container(

                          decoration: const BoxDecoration(
                            color: Color(0xFF3EBACE),
                            //image: DecorationImage(image: AssetImage('lib/assets/images/olesereni.jpg')),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(

                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder:  (context) => const SafariTabLocation()
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(

                                      onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder:  (context) => const SafariTabType()
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

                children:  [

                  Text('Search by',style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.8), ),),
                  Icon(Icons.arrow_circle_down,color: Theme.of(context).primaryColor.withOpacity(0.8),),
                ],
              ))

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
