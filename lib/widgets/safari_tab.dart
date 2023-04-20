import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastravel/widgets/safari_tab_location.dart';
import 'package:eastravel/widgets/safari_tab_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'package:google_fonts/google_fonts.dart';



class SafariTab extends StatefulWidget {
  const SafariTab({Key? key}) : super(key: key);

  @override
  State<SafariTab> createState() => _SafariTabState();
}

class _SafariTabState extends State<SafariTab> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  List<DocumentSnapshot> _safaris = [];
  List<DocumentSnapshot> _filteredSafaris = [];




  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('safaris')
        .get()
        .then((QuerySnapshot snapshot) {
      setState(() {
        _safaris = snapshot.docs;
        _filteredSafaris = _safaris;
      });
    });
  }


  Widget _buildGridView(){
    return GridView.builder(
      itemCount: _filteredSafaris.length,
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
      itemCount: _filteredSafaris.length,

      itemBuilder: (context, index) => _buildItem(index),
    );

  }

  Widget _buildItem(int index) {
    final safari = _filteredSafaris[index];

    final hotelId = safari.id;
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
          .collection('safaris')
          .doc(hotelId)
          .get();

      // Check if the hotel is already in the user's wishlist
      final QuerySnapshot wishlistSnapshot = await FirebaseFirestore.instance
          .collection('wishlistsafaris')
          .where('email', isEqualTo: email)
          .where('name', isEqualTo: snapshot['name'])
          .get();
      final isWishlisted = wishlistSnapshot.docs.isNotEmpty;
      if (isWishlisted) {
        // Hotel is already in the wishlist, show a snackbar and return
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Safari is already in wishlist!'),
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
      await FirebaseFirestore.instance.collection('wishlistsafaris').add({
        'email': email,
        'name': snapshot['name'],
        'address': snapshot['address'],
        'price': snapshot['price'],
        'imageurl': snapshot['imageUrl'],
        'id': hotelId,
      });

      // Show a snackbar to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(

          content: Text('Safari added to wishlist!'),
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
              builder: (context) => SafariDetailScreen(safari),
            ),
          );
        },
        //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SafariScreen(safari: _filteredItems[index]),),);},
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
                  tag: safari['imageUrl'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      height: 180.0,
                      width: 180.0,
                      image: AssetImage(safari['imageUrl']),
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
                        safari['name'],
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
                        safari['hotelname'],
                        style: GoogleFonts.bebasNeue(
                          color: Theme.of(context).primaryColor.withOpacity(0.8),
                          fontSize: 16.0,
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
                              '${safari['price'].toString()} \$',
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
                top: 30,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.date_range,size: 15,),
                                Text(
                                  safari['days'].toString(),
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
                  stream: FirebaseFirestore.instance.collection('wishlistsafaris')
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
        )


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
            hintText: "Type Safari Name",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredSafaris = _safaris.where((safari) {
                final name = safari['name'] as String;
                final hotelname = safari['hotelname'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    hotelname.toLowerCase().contains(searchText);
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
      body:_filteredSafaris.isEmpty
          ? Center(child: CircularProgressIndicator())
          : _isGridView ? _buildGridView() : _buildListView(),

    );
  }
}


class SafariDetailScreen extends StatelessWidget {
  final DocumentSnapshot documentt;

  bool isLoading = false;


  SafariDetailScreen(this.documentt);
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

  void deleteSafari(String hotelId) {
    FirebaseFirestore.instance
        .collection('wishlistsafaris')
        .doc(hotelId)
        .delete()
        .then((value) => print('Safari deleted'))
        .catchError((error) => print('Failed to delete Safari: $error'));
  }


  @override
  Widget build(BuildContext context) {
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
                    TypewriterAnimatedText(documentt['name'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                    TypewriterAnimatedText(documentt['price'].toString(),textStyle: GoogleFonts.bebasNeue(color: Colors.white)),


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
                          documentt['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          documentt['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          documentt['imageUrl'],
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
                                Text( documentt['price'].toString(),style: const TextStyle(fontSize: 25),),




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

                        child: Column(
                          children: [

                            ExpansionTile(
                              title: const Text('Year Rates'),
                              children: [

                                StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('season')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Center(
                                        child: Text('An error occurred while loading the data.'),
                                      );
                                    }

                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    if (snapshot.data!.docs.isEmpty) {
                                      return Center(
                                        child: Text('No  details found.'),
                                      );
                                    }

                                    return Row(


                                      children: snapshot.data!.docs.map((document) {
                                        final seasontitle = document.get('seasontitle');
                                        final startdate = document.get('startdate');
                                        final enddate = document.get('enddate');
                                        final value = document.get('value');


                                        return Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 28.0),
                                            child: InkWell(
                                              // onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => EventSingles(document.id),),);},
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  Container(






                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [


                                                        Column(

                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                                              children: [

                                                                Column(

                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [

                                                                    Row(
                                                                      children: [
                                                                        Icon(Icons.holiday_village,
                                                                            size: 17,
                                                                            color: Colors.red.shade900
                                                                                .withOpacity(0.8)),
                                                                        // Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                                        Text(
                                                                            '$seasontitle',
                                                                            style: GoogleFonts
                                                                                .bebasNeue(
                                                                                fontSize: 22,
                                                                                color: Colors.white)),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(height: 5,),


                                                                    Container(
                                                                      decoration: BoxDecoration(

                                                                          borderRadius: BorderRadius
                                                                              .circular(15),

                                                                          color: Colors.white
                                                                              .withOpacity(0.2)
                                                                      ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(right: 8.0),
                                                                        child: Row(
                                                                          children: [
                                                                            Icon(Icons.location_on,
                                                                                size: 15,
                                                                                color: Colors.red
                                                                                    .shade900
                                                                                    .withOpacity(
                                                                                    0.8)),
                                                                            //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                                            Text(
                                                                                '$startdate',
                                                                                style: GoogleFonts
                                                                                    .bebasNeue(
                                                                                    fontSize: 17,
                                                                                    color: Colors
                                                                                        .black)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 5,),
                                                                    Row(
                                                                      children: [
                                                                        Icon(Icons.timelapse_rounded,
                                                                            size: 15,
                                                                            color: Colors.red.shade900
                                                                                .withOpacity(0.8)),
                                                                        Text('$startdate''-' '$enddate',
                                                                            style: GoogleFonts
                                                                                .bebasNeue(
                                                                                fontSize: 17,
                                                                                color: Colors.white)),
                                                                        const SizedBox(width: 12.0),

                                                                      ],
                                                                    ),
                                                                    const SizedBox(height: 5,),
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius
                                                                              .circular(15),

                                                                          color: Colors.white
                                                                              .withOpacity(0.2)
                                                                      ),


                                                                      child: Row(
                                                                        children: [
                                                                          Icon(Icons.location_on,
                                                                              size: 15,
                                                                              color: Colors.red
                                                                                  .shade900
                                                                                  .withOpacity(0.8)),
                                                                          //Text(':',style: GoogleFonts.bebasNeue(fontSize:20,color: Colors.red)),
                                                                          Padding(
                                                                            padding: const EdgeInsets
                                                                                .only(right: 8.0),
                                                                            child: Text(
                                                                                '$seasontitle',
                                                                                style: GoogleFonts
                                                                                    .bebasNeue(
                                                                                    fontSize: 17,
                                                                                    color: Colors
                                                                                        .black)),
                                                                          ),



                                                                        ],
                                                                      ),
                                                                    ),


                                                                  ],
                                                                ),
                                                              ],
                                                            ),

                                                          ],

                                                        ),

                                                      ],
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        color: Colors.blueAccent.withOpacity(0.6)
                                                    ),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                                SizedBox(height: 40,)

                              ],
                            ),

                            Text('Inclusives'),
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('safariamenities')

                                  .where('safariid', isEqualTo: documentt['id'])
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return CircularProgressIndicator();
                                }
                                if (snapshot.data!.docs.isEmpty) {
                                  return Text('No data');
                                }
                                final data = snapshot.data!.docs.first;
                                final wifi = data['pe'] ?? false;
                                final spa = data['ti'] ?? false;
                                final pool = data['ugd'] ?? false;
                                final drinks = data['drinks'] ?? false;

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 30,),
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.caravan,
                                              size: 21.0,
                                              color: wifi ? Colors.green : Colors.red,
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
                                        SizedBox(width: 30,),
                                        Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.spa,
                                              size: 21.0,
                                              color: spa ? Colors.green : Colors.red,
                                            ),
                                            SizedBox(width: 10,),
                                            Text(
                                              'Tourism Insurance',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                              ),
                                            ),

                                          ],
                                        ),
                                        SizedBox(width: 30,),


                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.swimmingPool,
                                                size: 21.0,
                                                color: pool ? Colors.green : Colors.red,
                                              ),
                                              Text(
                                                'Unlimited Game Drives',
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
                                                color: drinks ? Colors.green : Colors.red,
                                              ),
                                              Text(
                                                'Drinks',
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
                                  ],
                                );
                              },
                            )




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

                  //Book Safari
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
                                      documentt['name'],
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
                                        documentt['price'].toString() + '\$',
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
                                    documentt['location'],
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
                                    documentt['hotelname'],
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
                                    documentt['days'],
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
                                    documentt['days'],
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
                                                  Text(documentt['name']),
                                                  Text(documentt['price'].toString()),
                                                ],
                                              ),
                                              content: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Form(
                                                  key: _formKey,
                                                  child: Wrap(
                                                    children: [
                                                      TextFormField(
                                                        decoration: InputDecoration(labelText: 'Contact Number'),
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
                                                        onPressed: () async {
                                                          _submitForm();
                                                          // initiate cURL request to Twilio API to send SMS message
                                                          final response = await http.post(
                                                            Uri.parse('https://markiniltd.com/twilio.php'),
                                                            body: {
                                                              'to': '+254794155449', // replace with recipient phone number
                                                              'message': 'Safari name: ${documentt["name"]},Safari Price: ${documentt['price'].toString()},$_title: $_description,', // use the title and description as the message body
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
                              documentt['imageUrl'],
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

                  //Book Safari
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
                                      documentt['description'],
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



                  //Safari days
                  ExpansionTile(
                    title: Text('Days',style:GoogleFonts.poppins(color:Colors.black,fontWeight: FontWeight.w500),),

                    children: [

                      FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance.collection('safaridays').where('email', isEqualTo: documentt['email']).get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          final roomDocs = snapshot.data!.docs;
                          if (roomDocs.isEmpty) {
                            return Text('No days found for this Safari'+ documentt['id']);
                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: roomDocs.length,
                            itemBuilder: (context, index) {
                              final roomDoc = roomDocs[index];

                              return Stack(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),


                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Wrap(
                                            children: [
                                              Text(
                                                roomDoc['dayname'],
                                                style:  GoogleFonts.abrilFatface(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 4,
                                              ),
                                            ],
                                          ),

                                          Wrap(
                                            children: [
                                              const Icon(Icons.hotel,size: 15,),
                                              Text(
                                                roomDoc['desc'],
                                                style: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12

                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 60,
                                              ),
                                            ],
                                          ),

                                          const SizedBox(height: 10.0),

                                        ],
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
































