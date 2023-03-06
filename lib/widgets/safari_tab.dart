import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eastravel/widgets/safari_tab_location.dart';
import 'package:eastravel/widgets/safari_tab_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body:_filteredSafaris.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 10,

        ),
        padding: const EdgeInsets.all(8),

        itemCount: _filteredSafaris.length,
        itemBuilder: (BuildContext content,int index){
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
                  content: Text('Hotel is already in wishlist!'),
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
                    child: Container(
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
                    ),
                  ),

                  Positioned(
                    top: 50.0,
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
                              return Container();
                            }
                        }
                      },
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
                          TypewriterAnimatedText(documentt['name'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                          TypewriterAnimatedText(documentt['hotelname'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                          TypewriterAnimatedText(documentt['location'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),
                          TypewriterAnimatedText(documentt['price'],textStyle: GoogleFonts.bebasNeue(color: Colors.white)),


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
                              top: 30,
                              right: 20  ,
                              child: ElevatedButton(

                                  child: Row(
                                    children: [
                                      Text('\$'+ documentt['price'],style: const TextStyle(fontSize: 20),),




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
                                          Text(documentt['hotelname']),
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
                                              documentt['price'] + '\$',
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
                                                          Text(documentt['name']),
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
