import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

import 'editsafari.dart';
import 'addsafari.dart';
import 'editroom.dart';







class HomePageSafari extends StatefulWidget {
  const HomePageSafari({Key? key}) : super(key: key);

  @override
  State<HomePageSafari> createState() => _HomePageSafariState();
}

class _HomePageSafariState extends State<HomePageSafari> with SingleTickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;
  late TabController tabController;
  @override
  void  initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EFEB),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()
        ),
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100.0,

                decoration: const BoxDecoration(
                    color: Color(0xFFFD7465),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(75.0,),bottomLeft: Radius.circular(75.0,)



                    )
                ),
              ),
               Padding(
                padding: EdgeInsets.only(top: 15.0,left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.email!,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Lottie.asset('assets/icons/133390-hotel-pop-up.json',height: 70,)
                  ],
                ),


              ),


            ],
          ),

          TabBar(
            controller: tabController,
            indicatorColor: const Color(0xFFFE8A7E),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            isScrollable: true,
            labelColor: const Color(0xFF440206),
            unselectedLabelColor: const Color(0xFF440206),
            tabs: const [
              Tab(
                child: Text(
                  'Safaris',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,
                ),
                ),
              ),
              Tab(
                child: Text(
                  'Inclusives',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Rates',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),
              Tab(
                child: Text(
                  'Amenities',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15.0,

                ),
                ),
              ),


            ],



          ),
          const SizedBox(height: 10.0,),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: tabController,
              children:  <Widget>[

                const MilkPage(),
                const RoomP(),


                const MilkPage(),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: Text('Add Hotel')),
                  ],
                ),







              ],
            ),
          ),


        ],
      ),
    );
  }


}


class MilkPage extends StatefulWidget {
  const MilkPage({Key? key}) : super(key: key);

  @override
  State<MilkPage> createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(


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
                      width: 400.0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0,top: 15.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 170.0,
                              width: MediaQuery.of(context).size.width,


                            ),
                            Positioned(
                              left: 15.0,
                              top: 30.0,
                              child: Container(
                                height: 125.0,
                                width: MediaQuery.of(context).size.width - 15.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9EFEB),
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3.0,
                                          blurRadius: 3.0
                                      )
                                    ]

                                ),






                              ),
                            ),
                            Positioned(
                              left: 95.0,
                              top: 64.0,
                              child: Container(
                                height: 105.0,
                                width: MediaQuery.of(context).size.width - 15.0,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF9EFEB),
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3.0,
                                          blurRadius: 3.0

                                      )
                                    ]
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.favorite,color: Colors.red,),
                                        SizedBox(width: 5.0,),
                                        Text('$price'.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),
                                        const SizedBox(width: 25.0,),
                                        Icon(Icons.account_box,color: Colors.red,),
                                        Text('$price'.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),

                                        SizedBox(width: 25.0,),
                                        Icon(Icons.account_box,color: Colors.red,),
                                        Text('$price'.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),





                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 60,),
                            Container(
                              height: 125.0,
                              width: MediaQuery.of(context).size.width - 15.0,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset('$imageurl',fit: BoxFit.cover,),
                                    SizedBox(width: 10.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        SizedBox(height: 10.0,),
                                        Wrap(
                                          children: [
                                            Text('$name',
                                              style: const TextStyle(
                                                color: Color(0xFF563724),
                                                fontFamily: 'Montserrat',
                                                fontSize: 14.0,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,


                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          width: 175,
                                          child: Text('$address', style: TextStyle(
                                              color: Color(0xFFB2A9A9),
                                              fontFamily: 'Montserrat',
                                              fontSize: 11.0
                                          ),),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(price.toString(),
                                              style: const TextStyle(
                                                  color: Color(0xFFF76053),
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15.0
                                              ),

                                            ),
                                            SizedBox(width:
                                            80),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => EditHotelPage(docId: document.id,)),
                                                );
                                              },
                                              child: const Text('Edit',
                                                style: TextStyle(
                                                    color: Color(0xFFF76053),
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 15.0
                                                ),

                                              ),
                                            )
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
class RoomP extends StatefulWidget {
  const RoomP({Key? key}) : super(key: key);

  @override
  State<RoomP> createState() => _RoomPState();
}

class _RoomPState extends State<RoomP> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,

      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('rooms')
            .where('email', isEqualTo: user!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred while loading the data.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
                        MaterialPageRoute(builder: (context) => EditHotelPage(docId: document.id,)),
                      );
                    },
                    //  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelScreen(hotel: hotels[index]),),);},
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 400.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,top: 15.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 170.0,
                              width: MediaQuery.of(context).size.width,


                            ),
                            Positioned(
                              left: 15.0,
                              top: 30.0,
                              child: Container(
                                height: 125.0,
                                width: MediaQuery.of(context).size.width - 15.0,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF9EFEB),
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3.0,
                                          blurRadius: 3.0
                                      )
                                    ]

                                ),






                              ),
                            ),
                            Positioned(
                              left: 95.0,
                              top: 64.0,
                              child: Container(
                                height: 105.0,
                                width: MediaQuery.of(context).size.width - 15.0,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF9EFEB),
                                    borderRadius: BorderRadius.circular(5.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 3.0,
                                          blurRadius: 3.0

                                      )
                                    ]
                                ),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 10.0,left: 10.0),
                                    child: Row(
                                      children: <Widget>[
                                        const Icon(Icons.favorite,color: Colors.red,),
                                        SizedBox(width: 5.0,),
                                        Text('$price'.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),
                                        const SizedBox(width: 25.0,),
                                        Icon(Icons.account_box,color: Colors.red,),
                                        Text('$price'.toString(),
                                          style: const TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),

                                        const SizedBox(width: 25.0,),
                                        Icon(Icons.account_box,color: Colors.red,),
                                        Text('$price'.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),

                                        ),





                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 125.0,
                              width: MediaQuery.of(context).size.width - 15.0,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset('$imageurl',fit: BoxFit.cover,),
                                    SizedBox(width: 10.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        SizedBox(height: 10.0,),
                                        Wrap(
                                          children: [
                                            Text('$name',
                                              style: TextStyle(
                                                color: Color(0xFF563724),
                                                fontFamily: 'Montserrat',
                                                fontSize: 14.0,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,


                                            ),

                                          ],
                                        ),
                                        SizedBox(height: 5.0,),
                                        Container(
                                          width: 175,
                                          child: Text('$address', style: TextStyle(
                                              color: Color(0xFFB2A9A9),
                                              fontFamily: 'Montserrat',
                                              fontSize: 11.0
                                          ),),
                                        ),
                                        SizedBox(height: 5.0,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                          children: [
                                            Text(price.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFFF76053),
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15.0
                                              ),

                                            ),
                                            SizedBox(width:
                                            80),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => EditRoomPage(docId: document.id,)),
                                                );
                                              },
                                              child: Text('Edit',
                                                style: TextStyle(
                                                    color: Color(0xFFF76053),
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 15.0
                                                ),

                                              ),
                                            )
                                          ],
                                        ),


                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}



