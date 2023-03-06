import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


import 'hotel_screen.dart';
import 'hotel_tab_location.dart';
import 'hotel_tab_price.dart';

class HotelTab extends StatefulWidget {
  const HotelTab({Key? key}) : super(key: key);

  @override
  State<HotelTab> createState() => _HotelTabState();
}

class _HotelTabState extends State<HotelTab> {

  final List<Map<String, String>> hotels =  [
    {

      'imageUrl': 'assets/images/radissonblu.jpg',
      'imageUrl2': 'assets/images/radissonblu.jpg',
      'imageUrl3': 'assets/images/radissonblu.jpg',
      'name': 'Radisson Blu Hotel',
      'address': 'Nairobi,Kenya',
      'price': '175',
      'wifi': 'Available',
      'parking': 'Available',
      'balcony': 'Available',
      'heating': 'Available',
      'spa': 'Available',
      'fitness': 'Available',
      'bar': 'Available',
      'swimmingpool': 'Available',
      'restaurant': 'Available',


      'description': 'Located in centre of Nairobi and neighboring the Statehouse, the hotel and residence is set in the nature of Nairobi Arboretum offerings complimentary access to the city’s nature park for jogging, or walks Radisson Blu Hotel & Residence Nairobi Arboretum offers accommodation with each room having a private balcony access, where guests can enjoy views of the pool or the Arboretum Flora. Each unit has a flat screen TV with cable channels. The rooms are complete with a private bathroom with a rain shower. The 5-star hotel provides bathroom amenities. Turndown service are also available at the hotel. Guest can relax in the treatment rooms, steam room, sauna and the heated swimming pool. Guests can make use of the complimentary WiFi and on-site private parking at the property. Continental and super breakfast options are available every morning at The Fire Lake and Grill House an all-day dining outlet that specializes in American grilled cuisine with an African touch. The hotel also has The Arborista Coffee Lounge a cafe with a grab and go concept with a wide range of teas. The staff at the 24-hour front desk are available. The property also boasts a fully equipped 24-hour gym. Kenyatta International Conference Centre is 3.6 km from Radisson Blu Hotel Nairobi, while Nairobi National Museum is 2.6 km away. The nearest airport is Wilson Airport, 7.4 km from the hotel. Couples particularly like the location — they rated it 9.0 for a two-person trip. Radisson Blu Hotel & Residence Nairobi Arboretum has been welcoming Booking.com guests since 4 Sept 2019. Hotel chain/brand: Radisson Blu',
      'room1name':'Twin Room with Shared Bathroom',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'1 twin bed and 1 queen bed',
      'room1price':'50',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Three-Bedroom Apartment',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'1 queen bed',
      'room2price':'60',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Twin Room with Shared Bathroom',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'1 twin bed',
      'room3price':'70',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/kenyacomfort3.jpg',
      'imageUrl2': 'assets/images/radissonblu.jpg',
      'imageUrl3': 'assets/images/radissonblu.jpg',
      'name': 'Kenya Comfort Suites',
      'address': 'Nairobi,Kenya',
      'price': '300',
      'description': 'Set in Nairobi, 2.7 km from Kenyatta International Conference Centre, Kenya Comfort Suites offers accommodation with a restaurant, free private parking, an outdoor swimming pool and a bar. With free WiFi, this 3-star hotel has a shared lounge and a garden. The accommodation features a 24-hour front desk, room service and currency exchange for guests. The hotel offers a continental or buffet breakfast. Kenya Comfort Suites offers a childrens playground. Popular points of interest near the accommodation include Nairobi Gallery, Central Park and Nairobi Arboretum. The nearest airport is Wilson Airport, 5 km from Kenya Comfort Suites. Kenya Comfort Suites has been welcoming Booking.com guests since 13 Mar 2014. Distance in property description is calculated using © OpenStreetMap Most popular facilities 1 swimming pool Airport shuttle Non-smoking rooms Spa and wellness centre Room service Restaurant Free parking Bar Breakfast Currency exchange: Need local currency? This property offers currency exchange on site',
      'room1name':'Classic Studio Apartment with Extra Bed',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'1 twin bed',
      'room1price':'20',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Comfort Studio Apartment with Balcony',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'1 queen bed',
      'room2price':'30',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Apartment (8 Adults)',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'1 twin bed and 1 queen bed',
      'room3price':'40',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/olesereni.jpg',
      'imageUrl2': 'assets/images/radissonblu.jpg',
      'imageUrl3': 'assets/images/radissonblu.jpg',
      'name': 'Ole Sereni-Nairobi ',
      'address': 'Nairobi,Kenya',
      'price': '140',
      'description': 'Overlooking the Nairobi National Park, Ole-Sereni features an outdoor pool, 2 restaurants and a snack bar. The hotels health club offers aerobics, steam, sauna, massage facilities and a salon. Ole-Sereni Hotel is decorated with the typical style of a safari lodge, including bright colours, wooden details and artwork in raw materials. The contemporary rooms come with wall-mounted flat-screen TVs, free WiFi and a small coffee table. In the bathrooms, black marble combines with large shower boxes, and bathrobes and slippers are available upon request. The main restaurant has a large deck where you can spot wildlife. It offers grills, Italian, Indian and Oriental cuisine. Evening entertainment and steaks can be enjoyed at Eagles, which offers views of the National Park and Nairobis skyline. The Waterhole Snack Bar offers light meals and snacks. Ole-Sereni is a 10-minute drive from the Jomo Kenyatta International Airport. Free private parking is available. Couples particularly like the location — they rated it 8.3 for a two-person trip. 254 Ole Sereni-Nairobi Park View has been welcoming Booking.com guests since 2 Aug 2011.',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'1 twin bed and 1 queen bed',
      'room1price':'22',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'1 queen bed',
      'room2price':'32',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'1 queen bed',
      'room3price':'33',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/fourpoints.jpg',
      'imageUrl2': 'assets/images/radissonblu.jpg',
      'imageUrl3': 'assets/images/radissonblu.jpg',
      'name': 'Four Points Sheraton',
      'address': 'Nairobi,Kenya',
      'price': '200',
      'description': 'Set in Nairobi, 6.4 km from Syokimau Railway Station, Four Points by Sheraton Nairobi Airport features an outdoor swimming pool and complimentary on site private parking. The property boasts a spa and wellness centre with a fitness centre and Jacuzzi. The air conditioned units in the hotel are equipped with a flat screen TV with satellite channels, minibar, coffee maker and electric kettle. The rooms are fitted with a seating area. All the units have a shower and toilet and the property provides free toiletries. Guests at Four Points by Sheraton Nairobi Airport can enjoy continental, American, buffet, full English, Irish and vegetarian breakfast options. The property also features an onsite restaurant that specializes in local, American and Asian cuisines. Staff at the 24-hour front desk can provide advice on what to do in the area. The nearest airport Jomo Kenyatta International Airport is situated 800 m from the property. Four Points by Sheraton Nairobi Airport offers airport shuttle services to its guests Couples particularly like the location — they rated it 9.3 for a two-person trip. Four Points by Sheraton Nairobi Airport has been welcoming Booking.com guests since 13 Nov 2017. Hotel chain/brand: Sheraton',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'1 twin bed and 1 queen bed',
      'room1price':'60',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'1 twin bed',
      'room2price':'70',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'1 queen bed',
      'room3price':'80',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/sarovastanley.jpg',
      'imageUrl2': 'assets/images/radissonblu.jpg',
      'imageUrl3': 'assets/images/radissonblu.jpg',
      'name': 'Sarova Stanley',
      'address': 'Nairobi,Kenya',
      'price': '540',
      'description': 'Featuring a pool terrace and 3 restaurants, the hotel Sarova Stanley is located in central Nairobi. It offers a bar, fitness centre, and luxury rooms with free Wi-Fi. Complimentary private parking is also provided. Most of the rooms at the Sarova overlook Nairobi, and all of them are elegantly decorated in classic style. They all have a seating area or separate living room with a satellite TV, and include a private bathroom. The Pool Deck Restaurant is located on the fifth floor and serves al fresco buffet-style meals. The Thorn Tree Café is an open-air, bistro style café, and the Thai Chi offers authentic Thai cuisine. The Stanley Health Club includes a fitness area, a sauna, and a steam bath. Yoga and aerobics lessons are also available upon request. Kenyatta International Conference Centre is just 400 m away, while Jomo Kenyatta International Airport is 18 km away. The Nairobi National Park is 35 minutes away by car. 10-minute drive from Jomo Kenyatta International Airport via the Nairobi Expressway. This is our guests favourite part of Nairobi, according to independent reviews. Couples particularly like the location — they rated it 9.1 for a two-person trip. Sarova Stanley has been welcoming Booking.com guests since 5 Sept 2012.',
      'room1name':'KingSize',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'1 twin bed and 1 queen bed',
      'room1price':'50',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':'1 queen bed',
      'room2price':'40',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'1 queen bed',
      'room3price':'20',
      'room3desc':'assets/images/radissonblu.jpg',
    },
    {

      'imageUrl': 'assets/images/kozi3.jpg',
      'imageUrl2': 'assets/images/radissonblu.jpg',
      'imageUrl3': 'assets/images/radissonblu.jpg',
      'name': 'Kozi Suites Nairobi',
      'address': 'Nairobi,Kenya',
      'price': '124',
      'description': 'Located in Nairobi, within 17 km of Kenyatta International Conference Centre and 19 km of Nairobi National Museum, Kozi Suites Nairobi Airport provides accommodation with a bar and free WiFi throughout the property as well as free private parking for guests who drive. Each accommodation at the 4-star hotel has city views, and guests can enjoy access to a terrace. The property is allergy-free and is situated 1.8 km from Nairobi SGR Terminus. All units are equipped with a microwave, fridge, a kettle, a shower, slippers and a wardrobe. Every room comes with a private bathroom and free toiletries, and certain units at the hotel have a balcony. All rooms at Kozi Suites Nairobi Airport are fitted with a seating area. Crown Paints Distributor Jihan Freighters Ltd is 14 km from the accommodation, while Nyayo Stadium is 16 km away. The nearest airport is Jomo Kenyatta International, 8 km from Kozi Suites Nairobi Airport, and the property offers a paid airport shuttle service. Kozi Suites Nairobi Airport has been welcoming Booking.com guests since 10 Mar 2021. Distance in property description is calculated using © OpenStreetMap',
      'room1name':'KingSize Kizinga',
      'room1photo':'assets/images/radissonblu.jpg',
      'room1type':'1 twin bed and 1 queen bed',
      'room1price':'50',
      'room1desc':'assets/images/radissonblu.jpg',
      'room2name':'Double Masn',
      'room2photo':'assets/images/radissonblu.jpg',
      'room2type':' 1 queen bed',
      'room2price':'30',
      'room2desc':'assets/images/radissonblu.jpg',
      'room3name':'Single',
      'room3photo':'assets/images/radissonblu.jpg',
      'room3type':'1 queen bed',
      'room3price':'30',
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
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
    hintText: "Type Hotel Name",
    hintStyle: TextStyle(color: Colors.white,),
    border: InputBorder.none,
        ),
        onChanged: (value){
          setState(() {
            _searchText = value;
            _filteredItems = hotels
                .where((item) => item['name']!.toLowerCase().contains(_searchText.toLowerCase()))
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: _filteredItems[index]),),);},
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
                              fontSize: 15.0,
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

                ],
              ),
            ),


          );
        },


      ),

    );
  }
}
