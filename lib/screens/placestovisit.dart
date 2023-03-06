
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';


class PvtScreen extends StatelessWidget {
  final Map<String, String>  hotel;
  PvtScreen({Key? key, required this.hotel}) : super(key: key);
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
      body: DefaultTabController(
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
                    TyperAnimatedText(hotel['name']!,textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

                    TyperAnimatedText(hotel['address']!,textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

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
                          hotel['imageUrl']!,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          hotel['imageUrl2']!,
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          hotel['imageUrl3']!,
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
                                Text('\$${hotel['price']!}',style:  GoogleFonts.poppins(fontSize: 25),),




                              ],
                            ),

                            onPressed: (){}

                        )),
                    Positioned(
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
                          title:  Text('Amenities',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

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
                                SizedBox(height: 30,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],

                  ),

                  ExpansionTile(
                    title: Text('Rooms',style:GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

                    children: [



                    ],),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 160.0,
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
                                      hotel['room1name']!,
                                      style:  GoogleFonts.abrilFatface(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        hotel['room1price']! + '\$',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '/night',
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
                                  const Icon(Icons.hotel,size: 15,),
                                  Text(
                                    hotel['room1type']!,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: 100.0,
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
                                                    Text('Room Booking'),
                                                    Text(hotel['room1name']!),
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
                                        maxLines: 1,),
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
                              hotel['room1photo']!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),



                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 160.0,
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
                                      hotel['room2name']!,
                                      style: GoogleFonts.abrilFatface(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        hotel['room2price']! + '\$',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '/night',
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
                                  Icon(Icons.hotel,size: 15,),
                                  Text(
                                    hotel['room2type']!,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: 100.0,
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
                                                    Text('Room Booking'),
                                                    Text(hotel['room2name']!),
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
                                                        SizedBox(height: 16.0),
                                                        MaterialButton(
                                                          child: Text('Submit'),
                                                          onPressed: _submitForm,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                actions: [

                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        'Book Now',
                                        maxLines: 1,),
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
                              hotel['room2photo']!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                  //ROOM3
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 160.0,
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
                                      hotel['room3name']!,
                                      style: GoogleFonts.abrilFatface(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        hotel['room3price']! + '\$',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Text(
                                        '/night',
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
                                  Icon(Icons.hotel,size: 15,),
                                  Text(
                                    hotel['room3type']!,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12

                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: 100.0,
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
                                                    Text('Room Booking'),
                                                    Text(hotel['room3name']!),
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
                                                        SizedBox(height: 16.0),
                                                        MaterialButton(
                                                          color: Theme.of(context).primaryColor.withOpacity(0.8),


                                                          child: Text('Submit'),
                                                          onPressed: _submitForm,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                actions: [

                                                ],
                                              );
                                            });
                                      },
                                      child: Text(
                                        'Book Now',
                                        maxLines: 1,),
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
                              hotel['room3photo']!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),
                  ExpansionTile(
                    title: Text('Description',style:GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

                    children: [

                      Stack(
                        children: <Widget>[
                          Container(



                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: 300.0,
                                        child: Text(
                                          hotel['description']!,
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
                      SizedBox(height: 30,),


                    ],),













                  // ListTiles++
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






