import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class Deejays extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'artistname': 'DJ NASH TUNIC',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/1.jpg',
      'price' :'50',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'


    },
    {
      'artistname': 'DJ LUCKY DUB',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/2.jpg',
      'price' :'40',
      'genre':'Reggea',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ Tophaz',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/djtopaz.jpg',
      'price' :'100',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ FESTA',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/djfesta.jpg',
      'price' :'90',
      'genre':'Riddim',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ GRAUCHI',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/djgrauchi.jpg',
      'price' :'100',
      'genre':'HipHOP,Kenyan',
      'availability':'Yes',
      'mixcloud':'djgrauchi',
      'youtube':'DJ Grauchi',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ Joe Mfalme',
      'location': 'Nairobi',
      'imagepath':'lib/assets/images/djjoemfalme.jpg',
      'price' :'500',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'nashtunic',
      'youtube':'Nash Tunic',
      'paypal':'djnash',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ NickDee',
      'location': 'Muranga',
      'imagepath':'lib/assets/images/djnickdee.jpg',
      'price' :'50',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'djkuuch',
      'youtube':'Kuuch',
      'paypal':'djkuuch',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ Kalonje',
      'location': 'Mombasa',
      'imagepath':'lib/assets/images/djkalonje.jpg',
      'price' :'50',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'djkuuch',
      'youtube':'Kuuch',
      'paypal':'djkuuch',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ G Money',
      'location': 'Westlands',
      'imagepath':'lib/assets/images/gmoney.jpg',
      'price' :'50',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'djkuuch',
      'youtube':'Kuuch',
      'paypal':'djkuuch',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ RudeBoy',
      'location': 'Kiambu',
      'imagepath':'lib/assets/images/djrudeboy.jpg',
      'price' :'50',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'djkuuch',
      'youtube':'Kuuch',
      'paypal':'djkuuch',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },
    {
      'artistname': 'DJ Double M',
      'location': 'Muranga',
      'imagepath':'lib/assets/images/djdoublem.jpg',
      'price' :'50',
      'genre':'AllRound',
      'availability':'Yes',
      'mixcloud':'djkuuch',
      'youtube':'Kuuch',
      'paypal':'djkuuch',
      'facebook':'nashtunic',
      'instagram':'nash.tunic',
      'Bio':'Dj From Kenya Love Music'

    },








  ];
  final List<Map<String, String>> hotels = [
    {

      'imageUrl': 'assets/images/radissonblu.jpg',
      'name': 'Radisson Blu Hotel',
      'address': 'Nairobi,Kenya',
      'price': '175',
    },
    {

      'imageUrl': 'assets/images/kenyacomfort3.jpg',
      'name': 'Kenya Comfort Suites',
      'address': 'Nairobi,Kenya',
      'price': '300',
    },
    {

      'imageUrl': 'assets/images/olesereni.jpg',
      'name': 'Ole Sereni-Nairobi ',
      'address': 'Nairobi,Kenya',
      'price': '140',
    },
    {

      'imageUrl': 'assets/images/fourpoints.jpg',
      'name': 'Four Points Sheraton',
      'address': 'Nairobi,Kenya',
      'price': '200',
    },
    {

      'imageUrl': 'assets/images/sarovastanley.jpg',
      'name': 'Sarova Stanley',
      'address': 'Nairobi,Kenya',
      'price': '540',
    },
    {

      'imageUrl': 'assets/images/kozi3.jpg',
      'name': 'Kozi Suites Nairobi',
      'address': 'Nairobi,Kenya',
      'price': '124',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          GridView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2/2.6,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,

              ),
              padding: const EdgeInsets.all(8),

              itemCount: items.length,

              itemBuilder: (BuildContext content,int index){
                return InkWell(
                //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DjSingles(item: items[index]),),);},
                  child: Container(
                    margin: const EdgeInsets.only(right: 1),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: AssetImage(items[index]['imagepath']!
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width*0.37,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white.withOpacity(0.8),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    items[index]['artistname']!,
                                    style: GoogleFonts.bebasNeue(color: Colors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        items[index]['location']!,
                                        style: GoogleFonts.bebasNeue(color: Colors.deepPurple),
                                      ),
                                      SizedBox(width: 10,),
                                      Text('\$'+
                                          items[index]['price']!,
                                        style: GoogleFonts.bebasNeue(color: Colors.black),
                                      ),


                                    ],
                                  )
                                ],
                              ),
                              const Icon(
                                Icons.play_circle,
                                color: Colors.deepPurple,
                              ),
                            ],
                          ),
                        )

                      ],

                    ),
                  ),
                );
              }),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Exclusive Hotels',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => print('See All'),
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
                  itemCount: hotels.length,
                  scrollDirection: Axis.horizontal,

                  itemBuilder: (BuildContext context, int index) {

                    return GestureDetector(
                      // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        width: 300.0,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 2.0,
                              child: Container(
                                height: 200.0,
                                width: 300.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'df',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      SizedBox(height: 2.0),
                                      Text(
                                        'df',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 2.0),
                                      Text(
                                        '{hotel.price} / night',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 320.0,
                                  image: AssetImage('hotel.imageUrl'),
                                  fit: BoxFit.cover,
                                ),
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
          )
        ],
      ),
    );
  }
}
