
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SafariScreen extends StatelessWidget {
  final String safari;
  bool isLoading = false;
  SafariScreen({Key? key, required this.safari}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _hotelname;


  void _submitForm() {

    _formKey.currentState?.save();

    _uploadData();

  }

  void _uploadData() async {

    final url = Uri.https('markiniltd.com', '/add.php');
    final response = await http.post(url,
        body: {'title': _title, 'description': _description});

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == 'success') {
        print('Succesfull');
      }

      else {
        print('Error');
      }
    } else {
      print('Error');
    }
  }




  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('safaris').doc(safari).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final name = snapshot.data!.get('name');
            final price = snapshot.data!.get('price');

            final imageUrl = snapshot.data!.get('imageUrl');
            final description = snapshot.data!.get('description');
            final hotelname = snapshot.data!.get('hotelname');
            final location = snapshot.data!.get('location');
            final days = snapshot.data!.get('days');



            return DefaultTabController(
        length: 1,
        child: CustomScrollView(

          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
              pinned: true,
              stretch: true,
              onStretchTrigger: () {
                // Function callback for stretch
                return Future<void>.value();
              },
              expandedHeight: 300.0,
              shadowColor: Colors.red[100],
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                centerTitle: true,
                title:  AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('$name',textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    TypewriterAnimatedText('$hotelname',textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    TypewriterAnimatedText('$location',textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    TypewriterAnimatedText('$price',textStyle: GoogleFonts.bebasNeue(color: Colors.white)),


                  ],
                  pause: const Duration(milliseconds: 3000),
                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', fit: BoxFit.cover,),
                    CarouselSlider(
                      items: [
                        Image.asset(
                          '$imageUrl',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          '$imageUrl',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          '$imageUrl',
                          fit: BoxFit.cover,
                        ),
                      ],
                      options: CarouselOptions(
                        height: 355,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        enlargeCenterPage: false,
                      ),
                    ),
                    Positioned(
                        top: 30,
                        right: 20  ,
                        child: ElevatedButton(

                            child: Row(
                              children: [
                                Text('\$''$price',style: const TextStyle(fontSize: 20),),




                              ],
                            ),

                            onPressed: (){}

                        )),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: Text(
                        '${3} Pictures', // replace 3 with the actual count of images
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
            ),


            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[

                  Wrap(
                    children: [

                      Container(

                        child: ExpansionTile(
                          title: const Text('Amenities'),

                          children: [
                            Column(
                              children: [
                                Row(
                                  children: <Widget>[



                                    ElevatedButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            FontAwesomeIcons.wifi,
                                            size: 21.0,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Wifi',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                    ElevatedButton(

                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.spa,
                                          size: 21.0,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Spa',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.swimmingPool,
                                          size: 21.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Pool',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.wineBottle,
                                          size: 21.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Bar',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                  ],
                                ),

                                Row(
                                  children: <Widget>[



                                    ElevatedButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            FontAwesomeIcons.windows,
                                            size: 21.0,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Balcony',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.parking,
                                          size: 21.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Parking',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.wineGlassAlt,
                                          size: 21.0,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Restaurant',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        )

                                      ],
                                    ),

                                    ),

                                  ],
                                ),
                                const SizedBox(height: 30,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],

                  ),

                  Wrap(
                    children: [
                      Container(

                        child: Column(
                          children: [

                            ExpansionTile(
                              title: const Text('Year Rates'),
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Text('Hotel'),
                                        Text('Dates'),
                                        Text('Meal Plan'),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('$hotelname'),
                                    Text('Dates'),
                                    const Text('Meal Plan'),
                                  ],
                                )

                              ],
                            ),
                            ExpansionTile(
                              title: Text('Inclusives'),
                              children: [
                                Row(
                                  children: <Widget>[




                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.busAlt,
                                          size: 15.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Tour Guide',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.airbnb,
                                          size: 15.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Accommodation',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        )

                                      ],
                                    ),

                                    ),

                                  ],
                                ),
                                Row(
                                  children: <Widget>[



                                    ElevatedButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            FontAwesomeIcons.parking,
                                            size: 15.0,
                                            color: Colors.green,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Park Entrance',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.busAlt,
                                          size: 15.0,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Unlimited Game Drives',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),


                                  ],
                                ),
                                Row(
                                  children: <Widget>[



                                    ElevatedButton(
                                      onPressed: (){},
                                      child: Row(
                                        children: const [
                                          Icon(
                                            FontAwesomeIcons.wineBottle,
                                            size: 15.0,
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 10,),
                                          Text(
                                            'Drinks',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.info,
                                          size: 15.0,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Travel Insurance',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ),
                                    ElevatedButton(
                                      onPressed: (){}, child: Row(
                                      children: const [
                                        Icon(
                                          FontAwesomeIcons.wineGlassAlt,
                                          size: 15.0,
                                          color: Colors.red,
                                        ),
                                        SizedBox(width: 10,),
                                        Text(
                                          'Meals',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          ),
                                        )

                                      ],
                                    ),

                                    ),

                                  ],
                                ),
                              ],
                            ),




                          ],
                        ),
                      ),
                    ],

                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[





                        const Text(
                          'Tour Package',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        GestureDetector(
                          // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelTab(),),);},
                          child: Text(
                            'Available',
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
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 250.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 130.0,
                                    child: Text(
                                      '$name',
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                       '$price' + '\$',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '/2pax',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),



                                    ],
                                  ),
                                ],
                              ),
                              _buildRatingStars(5),
                              Row(
                                children: [
                                  const Icon(Icons.tour_outlined,size: 15,),
                                  Text(
                                    '$location',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              Wrap(
                                children: [
                                  const Icon(Icons.tour_outlined,size: 15,),
                                  Text(
                                   '$hotelname',
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '$days',
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Text(
                                    '/Days',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    '$days',
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Text(
                                    '/Nights',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: 110.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: GestureDetector(

                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Column(
                                                  children: [
                                                    Text('Safari Booking'),
                                                    Text('$name'),
                                                  ],
                                                ),
                                                content: Padding(
                                                  padding: const EdgeInsets.all(16.0),
                                                  child: Form(
                                                    key: _formKey,
                                                    child: Wrap(
                                                      children: [

                                                        TextFormField(
                                                          decoration: InputDecoration(labelText: 'Email'),

                                                          onSaved: (value) => _title = value!,
                                                        ),
                                                        SizedBox(height: 16.0),
                                                        TextFormField(
                                                          decoration: InputDecoration(labelText: 'Description'),

                                                          onSaved: (value) => _description = value!,
                                                        ),
                                                        const SizedBox(height: 16.0),
                                                        MaterialButton(
                                                          color: Theme.of(context).primaryColor.withOpacity(0.8),
                                                          child: Text('Submit'),
                                                          onPressed: _submitForm,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                actions: const [

                                                ],
                                              );
                                            });
                                      },
                                      child: const Text(
                                        'Book Now',
                                        maxLines: 2,),
                                    ),
                                  ),


                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(
                              '$imageUrl',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Itinerary',
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        GestureDetector(
                          // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelTab(),),);},
                          child: Text(
                            ' ',
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
                  Stack(
                    children: <Widget>[
                      Container(



                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 190.0,
                                    child: Text(
                                      '$description',
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2000,
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













                  // ListTiles++
                ],
              ),
            ),
          ],
        ),
      );

  }
  ), );
  }
}






