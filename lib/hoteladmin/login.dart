import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


import 'forgotpassword.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{


//show  indicator

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }on FirebaseAuthException catch (e){
      if (kDebugMode) {
        print(e);
      }
      showDialog(
          context:context,
          builder: (context){
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          }
      );
    }

    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator());

    },
    );
    Navigator.of(context).pop();



  }


  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Lottie.asset('assets/icons/73387-tourist-travel.json',height: 120,),

                    Lottie.asset('assets/icons/76908-travel-for-girl.json',height: 120,),

                  ],),

                //greetings
                Wrap(
                  children: [
                    Text('East African Safaris',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 52,

                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                const Text('"We Care About your Business"',
                  style: TextStyle(
                    fontSize: 20,
                  ),),
                SizedBox(height: 50,),
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
                        controller:_emailController,
                        decoration: InputDecoration(

                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            hintText: 'Email'
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),

                            hintText: 'Password'
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ForgotPasswordPage();
                          }));
                        },
                        child: Text('Forgot Password?',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a Member?',style: TextStyle(fontWeight: FontWeight.bold,),),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(' Register now', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
