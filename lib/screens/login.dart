import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_juice/screens/home.dart';
import 'package:the_juice/screens/signup.dart';
import 'package:the_juice/sharepreferencehelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            FloatingActionButton(
              backgroundColor: Colors.black,
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
   },
  );
  }
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Column(
                children: [
                  Text(
                    "the",
                    style: GoogleFonts.nothingYouCouldDo(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text("JUICE",
                      style: GoogleFonts.nothingYouCouldDo(
                          fontSize: 42,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                  heightFactor: 1.5,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: usernameController,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.alternate_email_sharp,
                              ),
                              hintText: 'Username',
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*Username can't be empty";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_sharp),
                              hintText: 'Password',
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            } else {
                              return null;
                            }
                          },
                        ),
                        //SizedBox(height: 10,),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot password ?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      ),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                  FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text).then((value) {
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>const HomePage()));
                                  }).catchError((error){
                                    String errorMessage = "Invalid user credentials";
                                    if (error is FirebaseAuthException) {
                                      switch (error.code) {
                                        case "invalid-email":
                                          errorMessage = "Invalid email address";
                                          break;
                                        case "user-not-found":
                                        case "wrong-password":
                                          errorMessage = "Invalid email or password";
                                          break;
                                      }
                                    }
                                    _showErrorDialog(errorMessage);
                                  });
                                  }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            const Text(
              'Or Login with',
              style: TextStyle(
                fontSize: 14.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 55.0, right: 55.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/facebook.png',
                    height: 35,
                    width: 35,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async{
                     await  FirebaseAuth.instance.signInWithProvider(GoogleAuthProvider()).then((value) async{
                       // await FirebaseAuth.instance.getRedirectResult().then((value) {
                        if(value.user!=null){
                          await value.user!.reload(); 
                          await value.user!.getIdToken();
                          //SharedPreferencesHelper.setUserName(userName:value.user!.displayName??"");
                          print('Loggedin');
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        }else{
                          print("Something went wrong");
                        }
                        //});
                      });
                    },
                    child: Image.asset(
                      'assets/google.png',
                      height: 35,
                      width: 35,
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/twitter.png',
                    height: 35,
                    width: 35,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const Text(
                      'Do you have an account?',
                      style: TextStyle(fontSize: 14),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUpPage()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
