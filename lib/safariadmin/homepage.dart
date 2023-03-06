
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../caradmin/mainpage.dart';
import '../screens/home_screen.dart';
import '../widgets/bottom_bar.dart';
import 'addsafari.dart';
import 'addimagetitle.dart';
import 'editsafari.dart';



class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final user = FirebaseAuth.instance.currentUser!;










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,




      body: ListView(
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


                      child: const Text('Hotel Dashboard',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)
                        ,),
                   // onTap: Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen())),
                  ),
                  const SizedBox(height:8),
                  Text(user.email!,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),),
                ],),

                Container(decoration: BoxDecoration(color: Colors.deepPurple[200],borderRadius: BorderRadius.circular(12)),
                  child: GestureDetector(
                      onLongPress: (){FirebaseAuth.instance.signOut();},
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage()));},
                      child: Lottie.asset('assets/icons/90724-travel-world-usa.json',height: 70,)),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Text('Add Hotel')),
              ],
            ),
          ),

          Container(
            height: 600,

            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('hotels')
                  .where('email', isEqualTo: user!.email)
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
                        MaterialPageRoute(builder: (context) => EditHotelPage(docId: document.id,)),
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
                                  bottom: 10,
                                  left: 20,
                                ),
                                Positioned(


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
                                  bottom: 10,
                                  right: 20,
                                ),
                                Positioned(


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
                                  left: 20,
                                  top: 10,

                                ),
                                Positioned(


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
                                                  MaterialPageRoute(builder: (context) => EditHotelPage(docId: document.id,)),
                                                );
                                              },
                                              child: Text('Edit')),
                                        )),
                                  ),
                                  right: 20,
                                  top: 10,

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
    );
  }
}
