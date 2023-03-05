
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../widgets/car_tab.dart';
import '../widgets/carbooking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class CarScreen extends StatelessWidget {

  bool isLoading = false;
  final String car;

  CarScreen({Key? key, required this.car,}) : super(key: key);
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
        body: {'title':  'imageUrl', 'description': _description});

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      if (responseBody['status'] == 'success') {



         print('Succesfull');

      }

      else {
        print('Error');
      }
    } else {
      print('Loading');
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
        stream: FirebaseFirestore.instance.collection('cars').doc(car).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final name = snapshot.data!.get('name');
          final price = snapshot.data!.get('price');
          final address = snapshot.data!.get('address');
          final imageUrl = snapshot.data!.get('imageurl');
          final description = snapshot.data!.get('description');
          final luggage = snapshot.data!.get('luggage');
          final geartype = snapshot.data!.get('geartype');
          final type = snapshot.data!.get('type');
          final modelyear = snapshot.data!.get('modelyear');

          final pass = snapshot.data!.get('pass');
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
                            top: 50,
                            right: 20  ,
                            child: ElevatedButton(

                                child: Row(
                                  children: [
                                    Text( '$price',style: const TextStyle(fontSize: 25),),




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

                      ExpansionTile(
                        title: Text('Features'),
                        children: [
                          Wrap(
                            children: [
                              Container(

                                child: Column(
                                  children: [


                                    Row(


                                      children: <Widget>[



                                        ElevatedButton(
                                          onPressed: (){},
                                          child: Row(
                                            children: const [
                                              Icon(
                                                FontAwesomeIcons.moneyBill,
                                                size: 15.0,
                                                color: Colors.green,
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                'Pay at Pickup',
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
                                              'Unlimited Mileage',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ],
                                        ),

                                        ),


                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                'Doorstep Delivery',
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
                                              'Free Cancellation',
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

                                  ],
                                ),
                              ),
                            ],

                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[





                            Text(
                              'Car ',
                              style: GoogleFonts.bebasNeue(

                                  fontSize: 22

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
                            height: 180.0,
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
                                          style:  GoogleFonts.bebasNeue(
                                            fontSize: 19.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.clip,
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
                                            '/PerDay',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),



                                        ],
                                      ),
                                    ],
                                  ),
                                  _buildRatingStars(2),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.date_range,size: 17,),
                                          Text(
                                            '$modelyear',
                                            style: GoogleFonts.bebasNeue(
                                                color: Colors.grey,
                                                fontSize: 15

                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Row(
                                        children: [
                                          Wrap(
                                            children: [
                                              const Icon(Icons.person,size: 17,),
                                              Text(
                                                '$pass',
                                                style: GoogleFonts.bebasNeue(
                                                    color: Colors.grey,
                                                    fontSize: 15

                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          Wrap(
                                            children: [
                                              const Icon(Icons.luggage,size: 17,),
                                              Text(
                                                '$luggage',
                                                style: GoogleFonts.bebasNeue(
                                                    color: Colors.grey,
                                                    fontSize: 15

                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Row(
                                        children: [
                                          const Icon(Icons.settings,size: 17,),
                                          Text(
                                            '$geartype',
                                            style: GoogleFonts.bebasNeue(
                                                color: Colors.grey,
                                                fontSize: 15

                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  Wrap(
                                    children: [
                                      const Icon(Icons.car_repair_sharp,size: 15,),
                                      Text(
                                        '$type',
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12

                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
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
                                          color: Theme.of(context).primaryColor,
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
                                                        Text('Car Booking'),
                                                        Text( '$name'),
                                                      ],
                                                    ),
                                                    content: Padding(
                                                      padding: const EdgeInsets.all(16.0),
                                                      child: Form(
                                                        key: _formKey,
                                                        child: Wrap(
                                                          children: [
                                                            TextFormField(
                                                              decoration: InputDecoration(labelText: 'Email or contact'),

                                                              onSaved: (value) => _title = value!,
                                                            ),

                                                            TextFormField(
                                                              decoration: InputDecoration(labelText: 'Email or contact'),

                                                              onSaved: (value) => _title = value!,
                                                            ),
                                                            SizedBox(height: 16.0),
                                                            TextFormField(
                                                              decoration: InputDecoration(labelText: 'Description'),

                                                              onSaved: (value) => _description = value!,
                                                            ),
                                                            const SizedBox(height: 16.0),
                                                            MaterialButton(
                                                              color: Theme.of(context).primaryColor,
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
                                          child:  Text(
                                            'Book Now',
                                            style: GoogleFonts.bebasNeue(

                                                fontSize: 14

                                            ),
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



                      ExpansionTile(
                        title: Text('Description',style: GoogleFonts.bebasNeue(

                            fontSize: 19

                        ),),
                        children: [
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
                        ],
                      ),











                      // ListTiles++
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}





