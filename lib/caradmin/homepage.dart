
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../screens/home_screen.dart';
import '../widgets/bottom_bar.dart';
import 'addcar.dart';
import 'addimagetitle.dart';
import 'editcar.dart';



class CarHomePage extends StatefulWidget {

  @override
  State<CarHomePage> createState() => _CarHomePageState();
}

class _CarHomePageState extends State<CarHomePage> {


  final user = FirebaseAuth.instance.currentUser!;










  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey[200],


      body: SafeArea(

        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()
          ),
          children: [
            Column(children: [
              const SizedBox(height: 30,),

              //appbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                    GestureDetector(


                        child: const Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)
                          ,),
                     // onTap: Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen())),
                    ),
                    const SizedBox(height:8),
                    Text(user.email!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                  ],),

                  Container(decoration: BoxDecoration(color: Colors.deepPurple[200],borderRadius: BorderRadius.circular(12)),
                    child: GestureDetector(
                        onLongPress: (){FirebaseAuth.instance.signOut();},
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar()));},
                        child: Lottie.asset('assets/icons/90770-traveller.json',height: 70,)),
                  ),

                ],),
              ),

              const SizedBox(height: 25),








              //doctor list
            ],


            ),
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                      },
                      child: const Text('Add Car')),
                ],
              ),
            ),

            Container(
              height: 600,

              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('cars')
                    .where('email', isEqualTo: user!.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error occurred while loading the data.'),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No  details found.'),
                    );
                  }

                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      final name = document.get('name');
                      final address = document.get('address');
                      final price = document.get('price');
                      final imageurl = document.get('imageurl');


                      return Column(
                        children: [


                          GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditCarPage(docId: document.id,)),
                        );
                      },
                          //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              width: 300.0,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[

                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: const [
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
                                        image: AssetImage('$imageurl'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(


                                    bottom: 10,
                                    left: 20,


                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),

                                        ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('$address'),
                                          )),
                                    ),
                                  ),
                                  Positioned(


                                    bottom: 10,
                                    right: 20,


                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('$price'),
                                          )),
                                    ),
                                  ),
                                  Positioned(


                                    left: 20,
                                    top: 10,


                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('$name'),
                                          )),
                                    ),

                                  ),
                                  Positioned(


                                    right: 20,
                                    top: 10,


                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),

                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => EditCarPage(docId: document.id,)),
                                                  );
                                                },
                                                child: Text('Edit')),
                                          )),
                                    ),

                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
            ),








          ],
        ),
      ),
    );
  }
}
