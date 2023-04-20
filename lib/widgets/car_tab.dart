import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'dart:convert';


import '../screens/hotel_screen.dart';
import 'hotel_tab_location.dart';
import 'hotel_tab_price.dart';

class CarTab extends StatefulWidget {
  const CarTab({Key? key}) : super(key: key);

  @override
  State<CarTab> createState() => _CarTabState();
}

class _CarTabState extends State<CarTab> {

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _cars = [];
  List<DocumentSnapshot> _filteredCars = [];



  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('cars')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _cars = snapshot.docs.where((doc) => doc['availability'] == true).toList();
        _filteredCars = _cars;
      });
    });

  }


  Widget _buildGridView(){
    return GridView.builder(
      itemCount: _filteredCars.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => _buildItem(index),
    );
  }

  Widget _buildListView(){
    return ListView.builder(
      itemCount: _filteredCars.length,

      itemBuilder: (context, index) => _buildItem(index),
    );

  }

  Widget _buildItem(int index) {
    final car = _filteredCars[index];
    final hotelId = car.id;
    final user = FirebaseAuth.instance.currentUser;

    bool _isLoading = false;

    void _wishlistHotel(String hotelId, BuildContext context) async {
      // Set the loading state to true
      setState(() {
        _isLoading = true;
      });
      // Get the current user's email and name
      final FirebaseAuth auth = FirebaseAuth.instance;
      final User? user = auth.currentUser;
      final String? email = user!.email;
      // final String email = user?.email ?? 'nashtunic@gmail.com';


      // Get the hotel data using its ID
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('cars')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('wishlistcars')
          .where('email', isEqualTo: email)
          .where('name', isEqualTo: snapshot['name'])
          .get();
      final isWishlisted = wishlistSnapshot.docs.isNotEmpty;
      if (isWishlisted) {
        // Hotel is already in the wishlist, show a snackbar and return
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(

            content: Text('Car is already in wishlist!'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
        // Set the loading state back to false
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Add the hotel data to the wishlisthotels collection
      await FirebaseFirestore.instance.collection('wishlistcars').add({
        'email': email,
        'name': snapshot['name'],
        'address': snapshot['address'],
        'price': snapshot['price'],
        'imageurl': snapshot['imageurl'],
        'id': hotelId,
      });

      // Show a snackbar to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(

          content: Text('Car added to wishlist!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Set the loading state back to false
      setState(() {
        _isLoading = false;
      });
    }


    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetailScreen(car),
          ),
        );
      },
      child: Card(
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
                tag:  car['imageurl'],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    height: 180.0,
                    width: 180.0,
                    image: AssetImage(car['imageurl']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(2),
                ),


                child: Wrap(
                  children: [
                    Text(
                      car['name'],
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
              bottom: 48,
              left: 5,
              child: RatingBar.builder(
                initialRating: 2.5,
                itemSize: 17,
                minRating: 0,
                maxRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) async {
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final User? user = auth.currentUser;
                  final String? email = user!.email;

                  final DocumentReference hotelRef = FirebaseFirestore.instance
                      .collection('hotels')
                      .doc(hotelId);

                  final QuerySnapshot ratingSnapshot = await FirebaseFirestore.instance
                      .collection('ratinghotel')
                      .where('hotelId', isEqualTo: hotelId)
                      .where('email', isEqualTo: email)
                      .get();

                  final bool isRated = ratingSnapshot.docs.isNotEmpty;

                  if (isRated) {
                    // Update the existing rating document
                    ratingSnapshot.docs.first.reference.update({'rating': rating});
                  } else {
                    // Create a new rating document
                    await FirebaseFirestore.instance.collection('ratinghotel').add({
                      'email': email,
                      'hotelId': hotelId,
                      'rating': rating,
                    });
                  }

                  // Update the hotel rating
                  final QuerySnapshot ratings = await FirebaseFirestore.instance
                      .collection('ratinghotel')
                      .where('hotelId', isEqualTo: hotelId)
                      .get();

                  final int numRatings = ratings.docs.length;
                  final double totalRating = ratings.docs.fold(0, (acc, doc) => acc + doc['rating']);
                  final double newRating = totalRating / numRatings;

                  await hotelRef.update({'rating': newRating});
                },

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
                      car['address'],
                      style: GoogleFonts.bebasNeue(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        // letterSpacing: 1.2,
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
                          car['price'].toString(),
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
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),


                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.luggage_outlined,size: 15,),
                              Text(
                                car['luggage'].toString(),
                                style: GoogleFonts.bebasNeue(
                                  color: Theme.of(context).primaryColor.withOpacity(0.8),

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Icon(Icons.person_2,size: 15,),
                              Text(
                                car['pass'].toString(),
                                style: GoogleFonts.bebasNeue(
                                  color: Theme.of(context).primaryColor.withOpacity(0.8),

                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Icon(Icons.door_front_door_outlined,size: 15,),
                              Text(
                                'b',
                                style: GoogleFonts.bebasNeue(
                                  color: Theme.of(context).primaryColor.withOpacity(0.8),

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






            Positioned(
              top: 10.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('wishlistcars')
                    .where('email', isEqualTo: user!.email)
                    .where('id', isEqualTo: hotelId)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      if (snapshot.data!.docs.isNotEmpty) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: Colors.white,
                          ),

                          child: Text(
                            'Wishlisted',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor.withOpacity(0.8),
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          height: 30,

                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(2),
                          ),

                          child: Row(
                            children: [
                              IconButton(


                                icon: Icon(


                                  Icons.favorite ,
                                  color: Colors.white,
                                ),
                                iconSize: 20,

                                onPressed: _isLoading
                                    ? null // Disable the button while loading
                                    : () => _wishlistHotel(hotelId, context),

                              ),


                              if (_isLoading)
                                Positioned.fill(
                                  child: Container(
                                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    ),
                                  ),
                                ),


                            ],
                          ),
                        );
                      }
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
  bool _isGridView = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Type Car Name or Fuel type",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredCars = _cars.where((car) {
                final name = car['name'] as String;
                final modelyear = car['engine'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    modelyear.toLowerCase().contains(searchText);
              }).toList();
            });
            _filteredCars.sort((a, b) => a['price'].compareTo(b['price']));
          },




        ),
        actions: [

          MaterialButton(
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
            child: Icon(_isGridView ? Icons.view_list : Icons.view_module),

          )


        ],


      ),
      body: _filteredCars.isEmpty
          ? Center(child: Lottie.asset('assets/icons/36352-lion-running.json',height: 350))
          : _isGridView ? _buildGridView() : _buildListView(),

    );
  }
}


class CarDetailScreen extends StatelessWidget {
  final DocumentSnapshot document;

  bool isLoading = false;


  CarDetailScreen(this.document);
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
    final email= document['email'];
    return Scaffold(
      body:  DefaultTabController(
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
                    TypewriterAnimatedText(document['name'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    TypewriterAnimatedText(document['price'].toString(),textStyle: GoogleFonts.bebasNeue(color: Colors.white)),


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
                          document['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          document['imageurl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          document['imageurl'],
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
                                Text( document['price'].toString(),style: const TextStyle(fontSize: 25),),




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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Features',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('caramenities')

                            .where('email', isEqualTo: email)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.data!.docs.isEmpty) {
                            return Text('No data');
                          }
                          final data = snapshot.data!.docs.first;
                          final doorstepdelivery = data['doorstepdelivery'] ?? false;
                          final driverincluded = data['driverincluded'] ?? false;
                          final freecancellation = data['freecancellation'] ?? false;
                          final payatpickup = data['payatpickup'] ?? false;
                          final unlimitedmileage = data['unlimitedmileage'] ?? false;

                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.paypal,
                                        size: 21.0,
                                        color: payatpickup ? Colors.green : Colors.red,
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        'Pay at PickUp',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),

                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.road,
                                        size: 21.0,
                                        color: unlimitedmileage ? Colors.green : Colors.red,
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

                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.removeFormat,
                                        size: 21.0,
                                        color: freecancellation ? Colors.green : Colors.red,
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        'Free cancellation',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),

                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.car,
                                        size: 21.0,
                                        color: doorstepdelivery ? Colors.green : Colors.red,
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        'Door step delivery',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),

                                    ],
                                  ),



                                ],
                              ),
                            ],
                          );
                        },
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
                        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 5.0, 5.0),
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
                                      document['name'],
                                      style:  GoogleFonts.abrilFatface(
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
                                        document['price'].toString() + '\$',
                                        style: GoogleFonts.abrilFatface(
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
                              _buildRatingStars(5),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.date_range,size: 17,),
                                      Text(
                                        document['modelyear'].toString(),
                                        style: GoogleFonts.abrilFatface(
                                            color: Colors.grey,
                                            fontSize: 15

                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          const Icon(Icons.person,size: 17,),
                                          Text(
                                            document['pass'].toString(),
                                            style: GoogleFonts.abrilFatface(
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
                                  Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          const Icon(Icons.luggage,size: 17,),
                                          Text(
                                            document['luggage'].toString(),
                                            style: GoogleFonts.abrilFatface(
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
                                  Row(
                                    children: [
                                      const Icon(Icons.car_repair_sharp,size: 17,),
                                      Text(
                                        document['type'],
                                        style: GoogleFonts.abrilFatface(
                                            color: Colors.grey,
                                            fontSize: 15

                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),

                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              ),


                              Row(
                                children: [


                                  Row(
                                    children: [
                                      const Icon(Icons.settings,size: 17,),
                                      Text(
                                        document['geartype'],
                                        style: GoogleFonts.abrilFatface(
                                            color: Colors.grey,
                                            fontSize: 15

                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    child: Container(

                                      child: GestureDetector(

                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Stack(

                                                children: [
                                                  BackdropFilter(
                                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                                    child: Container(
                                                      color: Colors.black.withOpacity(0.5),
                                                    ),
                                                  ),
                                                  AlertDialog(
                                                    backgroundColor: Colors.black.withOpacity(0.5),
                                                    title: Column(
                                                      children: [
                                                        Text('Car Booking',style: GoogleFonts.abrilFatface(color: Colors.white),),
                                                        Text(document['name'],style: GoogleFonts.abrilFatface(color: Colors.white),),
                                                      ],
                                                    ),
                                                    content: Padding(
                                                      padding: const EdgeInsets.all(16.0),
                                                      child: Form(
                                                        key: _formKey,
                                                        child: Wrap(
                                                          children: [
                                                            TextFormField(
                                                              decoration: InputDecoration(labelText: 'Title',
                                                                border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(10.0), // Adds rounded corners to the border
                                                                  borderSide: const BorderSide(color: Colors.white), // Changes the color of the border
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                  borderSide: const BorderSide(color: Colors.blue), // Changes the color of the border when the field is focused
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                  color: Colors.white, // Changes the color of the label text
                                                                ),
                                                              ),

                                                              onSaved: (value) => _title = value!,
                                                            ),
                                                            SizedBox(height: 16.0),
                                                            TextFormField(
                                                              maxLength: 400, // Sets a maximum length of 400 characters
                                                              maxLines: null, // Allows for multiple lines of text
                                                              decoration: InputDecoration(
                                                                labelText: 'Enquire with details',
                                                                border: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                  borderSide: BorderSide(color: Colors.white),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                  borderSide: BorderSide(color: Colors.white),
                                                                ),
                                                                labelStyle: const TextStyle(
                                                                  color: Colors.grey,
                                                                ),
                                                                helperText: 'Enter up to 400 characters', // Adds helper text to provide feedback on character count
                                                              ),
                                                              onSaved: (value) => _description = value!,
                                                            ),
                                                            const SizedBox(height: 16.0),
                                                            MaterialButton(
                                                              color: Colors.red,
                                                              child: Text('Submit'),
                                                              onPressed: () async {
                                                                _submitForm();
                                                                // initiate cURL request to Twilio API to send SMS message
                                                                final response = await http.post(
                                                                  Uri.parse('https://markiniltd.com/twilio.php'),
                                                                  body: {
                                                                    'to': '+254794155449', // replace with recipient phone number
                                                                    'message': 'Car name: ${document["name"]},Owner email: ${document["email"]},Title:$_title, Description: $_description,', // use the title and description as the message body
                                                                  },
                                                                );
                                                                print(response.body);


                                                                Navigator.of(context).pop();



                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  SnackBar(
                                                                    backgroundColor: Colors.green,
                                                                    content: Text('Message sent successfully'),
                                                                    duration: Duration(seconds: 3),
                                                                  ),
                                                                );



                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    actions:  [

                                                      ElevatedButton(
                                                        child: Text('Close'),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          );



                                        },
                                        child:  Text(
                                          'Book Now',
                                          style: GoogleFonts.bebasNeue(

                                              fontSize: 14

                                          ),
                                          maxLines: 2,),
                                      ),
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
                              document['imageurl'],
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





                        Text(
                          'Description ',
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
                                      document['description'],
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