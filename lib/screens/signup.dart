import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_juice/screens/home.dart';
import 'package:the_juice/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_juice/sharepreferencehelper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
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
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome,',
                  style: GoogleFonts.titilliumWeb(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Looks like you don't have account already.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                  heightFactor: 1.2,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          textCapitalization: TextCapitalization.words,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline_sharp,
                              ),
                              hintText: 'Name',
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please fill the name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: usernameController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.alternate_email_sharp,
                              ),
                              hintText: 'Email',
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter valid email address";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: mobileController,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.call_outlined,
                              ),
                              hintText: 'Phone Number',
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Mobile number required";
                            } else if (value.length != 10) {
                              return "Mobile number must be 10-digit";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
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
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () async {
                                try {
                                  final UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: usernameController.text,
                                              password:
                                                  passwordController.text);
                                                  SharedPreferencesHelper.setUserName(userName:nameController.text);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                } catch (error) {
                                  print("Error: $error");
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
                              child: const Text('SignUp'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 60, left: 40, right: 30),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
