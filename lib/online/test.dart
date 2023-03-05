import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventSingles extends StatelessWidget {
  bool _showFullText = false;

  final Map<String, String>  car;
  EventSingles({required this.car});
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
    return  Scaffold(
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
                    RotateAnimatedText(car['name']!,textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    RotateAnimatedText(car['price']!,textStyle: GoogleFonts.bebasNeue(color: Colors.white)),


                  ],
                  stopPauseOnTap: true,
                  repeatForever: true,
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg', fit: BoxFit.cover,),
                    Image.asset(car['imageUrl']!
                      ,fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 50,
                        right: 20  ,
                        child: ElevatedButton(

                          child: Row(
                            children: [
                              Text('\$${car['price']!}',style: const TextStyle(fontSize: 25),),




                            ],
                          ),

                          onPressed: (){}

                        )),

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[





                        const Text(
                          'Car ',
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
                                      car['name']!,
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
                                        car['price']! + '\$',
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
                                      const Icon(Icons.date_range,size: 15,),
                                      Text(
                                        car['modelyear']!,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12

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
                                          const Icon(Icons.person,size: 15,),
                                          Text(
                                            car['pass']!,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12

                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Wrap(
                                        children: [
                                          const Icon(Icons.luggage,size: 15,),
                                          Text(
                                            car['luggage']!,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12

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
                                      const Icon(Icons.settings,size: 15,),
                                      Text(
                                        car['geartype']!,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12

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
                                    car['type']!,
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
                                                    Text(car['name']!),
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
                              car['imageUrl']!,
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
                          'Description',
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
                                      car['description']!,
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
      ),
    );
  }
}
