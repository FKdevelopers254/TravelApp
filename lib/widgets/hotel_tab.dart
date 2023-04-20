import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:lottie/lottie.dart';




class HotelTab extends StatefulWidget {


  const HotelTab({Key? key}) : super(key: key);

  @override
  State<HotelTab> createState() => _HotelTabState();
}

class _HotelTabState extends State<HotelTab> {

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _hotels = [];
  List<DocumentSnapshot> _filteredHotels = [];



  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('hotels')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _hotels = snapshot.docs;
        _filteredHotels = _hotels;
      });
    });
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 10,

      ),
      padding: const EdgeInsets.all(8),

      itemCount: _filteredHotels.length,
      itemBuilder: (context, index) => _buildItem(index),


    );
  }


  Widget _buildListView() {
    return ListView.builder(
      itemCount: _filteredHotels.length ,
      itemBuilder: (context, index) => _buildItemm(index),




    );
  }


  Widget _buildItem(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
    final user = FirebaseAuth.instance.currentUser;
    double rating = 2.5;
    final CollectionReference _ratingsRef =
    FirebaseFirestore.instance.collection('ratinghotel');






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
          .collection('hotels')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('wishlisthotels')
          .where('email', isEqualTo: email)
          .where('name', isEqualTo: snapshot['name'])
          .get();
      final isWishlisted = wishlistSnapshot.docs.isNotEmpty;
      if (isWishlisted) {
        // Hotel is already in the wishlist, show a snackbar and return

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Hotel added to wishlist!',
              message: 'Thank you for choosing our hotel.',
              contentType: ContentType.success,
            ),
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
      await FirebaseFirestore.instance.collection('wishlisthotels').add({
        'email': email,
        'name': snapshot['name'],
        'address': snapshot['address'],
        'price': snapshot['price'],
        'imageurl': snapshot['imageurl'],
        'id': hotelId,
      });

      // Show a snackbar to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          content: Text('Hotel added to wishlist!'),
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
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
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
          tag: hotel['imageurl'],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              height: 180.0,
              width: 180.0,
              image: AssetImage(hotel['imageurl']),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),






            Positioned(
              bottom: 48,
              left: 5,
              child: StreamBuilder<QuerySnapshot>(
                stream: _ratingsRef.where('email', isEqualTo: hotel['email']).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Lottie.asset('assets/icons/2523-loading.json', height: 30);
                  }

                  List<DocumentSnapshot> documents = snapshot.data!.docs;
                  double averageRating =
                  (documents.fold(0.0, (acc, doc) => acc + doc['rating']) / documents.length);

                  return RatingBar.builder(
                    initialRating: averageRating,
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
                        })  ;
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
                  );
                },
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
                      hotel['name'],
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
                      hotel['address'],
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
                          '${hotel['price']} \$',
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
              top: 10.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('wishlisthotels')
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
                          height: 80,



                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(

                                  child: Lottie.asset('assets/icons/wishlist.json',height: 230,),
                              onTap:_isLoading
                                  ? null // Disable the button while loading
                                  : () => _wishlistHotel(hotelId, context),),



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


  Widget _buildItemm(int index) {
    final hotel = _filteredHotels[index];


    final hotelId = hotel.id;
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
          .collection('hotels')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('wishlisthotels')
          .where('email', isEqualTo: email)
          .where('name', isEqualTo: snapshot['name'])
          .get();
      final isWishlisted = wishlistSnapshot.docs.isNotEmpty;
      if (isWishlisted) {
        // Hotel is already in the wishlist, show a snackbar and return
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Hotel added to wishlist!',
              message: 'Thank you for choosing our hotel.',
              contentType: ContentType.success,
            ),
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
      await FirebaseFirestore.instance.collection('wishlisthotels').add({
        'email': email,
        'name': snapshot['name'],
        'address': snapshot['address'],
        'price': snapshot['price'],
        'imageurl': snapshot['imageurl'],
        'id': hotelId,
      });

      // Show a snackbar to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          content: Text('Hotel added to wishlist!'),
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
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(hotel),),);},
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
              height: 190,
            ),
            Positioned(
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  height: 180.0,
                  width: 180.0,
                  image: AssetImage(hotel['imageurl']),
                  fit: BoxFit.cover,
                ),
              ),),
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
                      hotel['name'],
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
                      hotel['address'],
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
              top: 45,
              left: 10,
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
                          '${hotel['price']} \$',
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

              left: 200,
              child: Container(
                width: 205,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(2),
                ),


                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Wrap(
                      children: [
                        Text(
                          '${hotel['description']} \$',
                          style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),





            Positioned(
              top: 10.0,
              left: 10.0,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('wishlisthotels')
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
    hintText: "Type Hotel Name",
    hintStyle: TextStyle(color: Colors.white,),
    border: InputBorder.none,
        ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredHotels = _hotels.where((hotel) {
                final name = hotel['name'] as String;
                final address = hotel['name'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    address.toLowerCase().contains(searchText);
              }).toList();
            });
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
      body:_filteredHotels.isEmpty
          ? Center(child: Lottie.asset('assets/icons/36352-lion-running.json',height: 350))
          : _isGridView ? _buildGridView() : _buildListView() ,

    );
  }
}








class HotelDetailScreen extends StatelessWidget {
  final CollectionReference _ratingsRef =
  FirebaseFirestore.instance.collection('ratinghotel');



  final DocumentSnapshot documen;





  bool isLoading = false;
  
  HotelDetailScreen(this.documen);





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




  Text _buildRatingStars(double rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }




























  @override
  Widget build(BuildContext context) {
    final email= documen['email'];
    String theid= documen['id'];
   // print(theid);





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
                          TyperAnimatedText(documen['name'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

                          TyperAnimatedText(documen['address'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),

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
                                documen['imageurl'],
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                documen['imageurl'],
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                documen['imageurl'],
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
                              child: StreamBuilder<QuerySnapshot>(

                                stream: _ratingsRef.where('email', isEqualTo: email).snapshots(),
                                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  }

                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return Lottie.asset('assets/icons/2523-loading.json',height: 30);
                                  }

                                  List<DocumentSnapshot> documents = snapshot.data!.docs;

                                  double averageRating = (documents.fold(0.0, (acc, doc) => acc + doc['rating']) / documents.length);
                                  print(averageRating);
                                  print(email);




                                  return Column(
                                    children: [
                                      _buildRatingStars(averageRating),
                                    ],
                                  );
                                },
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
                                  Text('Amenities',style: GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('hotelamenities')

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
                                final wifi = data['wifi'] ?? false;
                                final spa = data['spa'] ?? false;
                                final pool = data['pool'] ?? false;
                                final bar = data['bar'] ?? false;
                                final balcony = data['bar'] ?? false;
                                final parking = data['parking'] ?? false;
                                final restaurant = data['restaurant'] ?? false;
                                return Column(
                                  children: [
                                    Container(

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.wifi,
                                                size: 21.0,
                                                color: wifi ? Colors.green : Colors.red,
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

                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.spa,
                                                size: 21.0,
                                                color: spa ? Colors.green : Colors.red,
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

                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.swimmingPool,
                                                size: 21.0,
                                                color: pool ? Colors.green : Colors.red,
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

                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.wineBottle,
                                                size: 21.0,
                                                color: bar ? Colors.green : Colors.red,
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

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.windows,
                                              size: 21.0,
                                              color: balcony ? Colors.green : Colors.red,
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

                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.parking,
                                              size: 21.0,
                                              color: parking ? Colors.green : Colors.red,
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

                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.wineGlassAlt,
                                              size: 21.0,
                                              color: restaurant ? Colors.green : Colors.red,
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              'Restaurant',
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

                        ExpansionTile(
                          title: Text('Rooms',style:GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

                          children: [

                            FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance.collection('rooms').where('email', isEqualTo: documen['email']).where('availability', isEqualTo: true).get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                }
                                final roomDocs = snapshot.data!.docs;
                                if (roomDocs.isEmpty) {
                                  return Text('No rooms found for this hotel');
                                }
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: roomDocs.length,
                                  itemBuilder: (context, index) {
                                    final roomDoc = roomDocs[index];
                                    DateTime? _selectedDate;
                                    int _adults = 1;
                                    int _children = 0;

                                    return Stack(
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
                                                        roomDoc['name'],
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
                                                          roomDoc['price'].toString() + '\$',
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
                                                      roomDoc['name'],
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
                                                                    Text(roomDoc['name']),
                                                                  ],
                                                                ),
                                                                content: Padding(
                                                                  padding: const EdgeInsets.all(16.0),
                                                                  child: Form(
                                                                    key: _formKey,
                                                                    child: Wrap(
                                                                      children: [
                                                                        TextFormField(
                                                                          decoration: InputDecoration(
                                                                            labelText: 'Contact Number',
                                                                            border: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(10.0), // Adds rounded corners to the border
                                                                              borderSide: BorderSide(color: Colors.grey), // Changes the color of the border
                                                                            ),
                                                                            focusedBorder: OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              borderSide: BorderSide(color: Colors.blue), // Changes the color of the border when the field is focused
                                                                            ),
                                                                            labelStyle: TextStyle(
                                                                              color: Colors.grey, // Changes the color of the label text
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
                                                                          borderSide: BorderSide(color: Colors.grey),
                                                                        ),
                                                                        focusedBorder: OutlineInputBorder(
                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                          borderSide: BorderSide(color: Colors.blue),
                                                                        ),
                                                                        labelStyle: TextStyle(
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
                                                                                'message': 'Hotel name: ${documen["name"]},Room Name: ${roomDoc['name']},Room Price: ${roomDoc['price']},Contact Number: $_title,Description: $_description,', // use the title and description as the message body
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
                                                              );
                                                            },
                                                          );



                                                        },
                                                        child: const Text(
                                                          'Contact Now',
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
                                                roomDoc['imageurl'],
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),



                          ],),
                        ExpansionTile(
                          title: Text('Gallery',style:GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

                          children: [

                            ImageCarouseli(),








                          ],),



                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0,top: 8.0,bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                Text('Description',style:GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),
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
                                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 300.0,
                                              child: Text(
                                                documen['description'],
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
            ),

    );
  }
}





class ImageCarouseli extends StatefulWidget {
  @override
  _ImageCarouseliState createState() => _ImageCarouseliState();
}
class _ImageCarouseliState extends State<ImageCarouseli> {
  int _current = 0;
  List<String> _images = [
    "assets/images/gondola.jpg",
    "assets/images/hotel2.jpg",
    "assets/images/hotel1.jpg",
    "assets/images/fourpoints.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return GestureDetector(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ImageScreen(
                      image: _images[index],
                    ),
                  ),
                );},
                child: Container(
                  child: Image.asset(
                    _images[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 300.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
                if (index == _images.length - 1) {
                  // Go back to the first image
                  Future.delayed(Duration(seconds: 3), () {
                    _carouselController.animateToPage(0);
                  });
                }
              },
            ),
            carouselController: _carouselController,
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _current = entry.key;
                      _carouselController.animateToPage(entry.key);
                    });
                  },
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? Colors.white
                          : Colors.grey,
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            _images[entry.key],
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),


                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
  CarouselController _carouselController = CarouselController();
}





class ImageScreen extends StatefulWidget {
  final String image;

  const ImageScreen({Key? key, required this.image}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onScaleStart: (ScaleStartDetails details) {
          _previousScale = _scale;
          setState(() {});
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          _scale = _previousScale * details.scale;
          _offset += details.focalPoint - details.localFocalPoint;
          setState(() {});
        },
        onDoubleTap: () {
          setState(() {
            _scale = _scale == 1.0 ? 2.0 : 1.0;
          });
        },
        child: Stack(
          children: [
            Hero(
              tag: widget.image,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Positioned(
              top: 50.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(_offset.dx, _offset.dy)
                    ..scale(_scale),
                  child: Hero(
                    tag: widget.image,
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



