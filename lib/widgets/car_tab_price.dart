import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CarTabPrice extends StatefulWidget {
  const CarTabPrice();



  @override
  State<CarTabPrice> createState() => _CarTabPriceState();
}

class _CarTabPriceState extends State<CarTabPrice> {
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
        _cars = snapshot.docs;
        _filteredCars = _cars;
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
            hintText: "Type Car Price",
            hintStyle: TextStyle(color: Colors.white,),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filteredCars = _cars.where((car) {
                final name = car['price'] as String;
                final modelyear = car['price'] as String;
                final searchText = _searchText.toLowerCase();
                return name.toLowerCase().contains(searchText) ||
                    modelyear.toLowerCase().contains(searchText);
              }).toList();
            });
          },




        ),
        actions: [


        ],


      ),
      body: _filteredCars.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        itemCount: _filteredCars.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
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
                              fontSize: 18.0,
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
                    top: 5,
                    left: 5,
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
                                Row(
                                  children: [
                                    const Icon(Icons.luggage_outlined,size: 15,),
                                    Text(
                                      car['luggage'].toString(),
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,

                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.person_2,size: 15,),
                                    Text(
                                      car['pass'].toString(),
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,

                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10,),
                                Row(
                                  children: [
                                    const Icon(Icons.door_front_door_outlined,size: 15,),
                                    Text(
                                      'b',
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,

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
                    top: 50.0,
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
        },
      ),

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
                                      document['name'],
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
                                        document['price'].toString() + '\$',
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
                                        document['modelyear'].toString(),
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
                                            document['pass'].toString(),
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
                                            document['luggage'].toString(),
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
                                        document['geartype'],
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
                                    document['type'],
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
                                                    Text( document['name']),
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
                              document['imageurl'],
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