
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {



  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _priceController = TextEditingController();
  final _modelyearController = TextEditingController();

  final _geartypeController = TextEditingController();
  final _typeController = TextEditingController();
  final _doorsController = TextEditingController();
  final _engineController = TextEditingController();
  final _passController = TextEditingController();
  final _luggageController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageurlController = TextEditingController();



  @override
  void dispose(){



    _nameController.dispose();
    _addressController.dispose();
    _priceController.dispose();
     _modelyearController.dispose();
     _geartypeController.dispose();
     _typeController.dispose();
     _doorsController.dispose();
     _engineController.dispose();
     _passController.dispose();
     _luggageController.dispose();
    _descriptionController.dispose();
    _imageurlController.dispose();
    super.dispose();
  }


  Future<void> addHotel() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    final user = FirebaseAuth.instance.currentUser!;
    print(user.email);
    final userDetailsSnapshot = await FirebaseFirestore.instance
        .collection('carusers')
        .where('email', isEqualTo: user.email)
        .get();

    if (userDetailsSnapshot.docs.isNotEmpty) {
      final documentId = userDetailsSnapshot.docs[0].id;
      final userDetails = userDetailsSnapshot.docs.first.data();
      final email = userDetails['email'];

      final name = _nameController.text;


      final address = _addressController.text;
      final price = _priceController.text;
      final modelyear = _modelyearController.text;
    final geartype =  _geartypeController.text;
    final type = _typeController.text;
    final doors =  _doorsController.text;
    final engine =  _engineController.text;
    final pass =  _passController.text;
    final luggage =  _luggageController.text;


      final description = _descriptionController.text;
      final imageurl = _imageurlController.text;


      print('User details found: ${userDetails.toString()}');

      try {
        String docId = FirebaseFirestore.instance.collection('cars').doc().id;
        await FirebaseFirestore.instance.collection('cars').doc(docId).set({

          'email': email,
          'name': name,
          'address': address,
          'price': price,
          'modelyear': modelyear,
          'geartype': geartype,
          'type': type,
          'doors': doors,
          'engine': engine,
          'pass': pass,
          'luggage': luggage,
          'description': description,
          'imageurl': imageurl,
          'id': docId

        });

        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Your Car  details have been saved.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CarHomePage())),
                ),
              ],
            );
          },
        );// dismiss the progress indicator dialog
      } catch (e) {
        print('Error writing car details to Firestore: $e');
        Navigator.pop(context); // dismiss the progress indicator dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('An error occurred while saving your car details. Please try again later.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    } else {
      // handle the case where the user details document doesn't exist
      Navigator.pop(context); // dismiss the progress indicator dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('User Details Not Found'),
            content: Text('We could not find your user details. Please try again later.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //greetings
                Text('Add Car ',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,

                  ),
                ),
                SizedBox(height: 10,),
                Text('EAS SAFARIS',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Car Name',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Car Address',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),



                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _priceController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Price',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _modelyearController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Model Year',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _geartypeController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Gear Type',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _typeController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Vehicle Type e.g SUV/Van',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _doorsController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Number of Doors',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _engineController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Engine Fuel Type',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _passController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Number of Passengers',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _luggageController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Luggage Number',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),





                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Description',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),



                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
                        controller: _imageurlController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          hintText: 'Enter Image Url',
                          fillColor: Colors.grey[200],
                          filled: true,

                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: addHotel,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}