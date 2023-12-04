import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_juice/controllers/user_repository.dart';
import 'package:the_juice/models/usermodel.dart';
import 'package:the_juice/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_juice/screens/toggle.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
  final userRepo = Get.put(UserRepository());
  String? gender;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.06),
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
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, top: screenHeight * 0.02),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome,',
                  style: GoogleFonts.titilliumWeb(
                      fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Looks like you don't have an account already.",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                  heightFactor: screenHeight * 0.00132,
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
                        SizedBox(
                          height: screenHeight * 0.035,
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
                        SizedBox(
                          height: screenHeight * 0.035,
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
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        TextFormField(
                          controller: passwordController,
                          cursorColor: Colors.black,
                          obscureText: true,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock_outline_sharp),
                              hintText: 'Password',
                              helperText:
                                  "* Password should be atleat 6 characters",
                              focusColor: Colors.black,
                              fillColor: Colors.black,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            } else if (value.length < 6) {
                              return "Password length should be atleat 6 characters";
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.035,
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomStart,
                          child: ToggleSwitch(
                            minWidth: 80.0,
                            minHeight: 40.0,
                            initialLabelIndex: 0,
                            cornerRadius: 30.0,
                            totalSwitches: 2,
                            activeBgColor: [Colors.black],
                            activeFgColor: Colors.white,
                            labels: ['Male', 'Female'],
                            onToggle: (index) {
                              if (index == 0) {
                                gender = 'Male';
                                print("@@@@@@@@@@@$index@@@@@@@@$gender");
                              } else {
                                gender = 'Female';
                                print("@@@@@@@@@@@$index@@@@@@@@$gender");
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: screenWidth*0.02,top: screenHeight*0.03),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () async {
                                if(_formKey.currentState!.validate()){
                                try {
                                  final email = usernameController.text.trim();
                                  bool userExists =
                                      await userRepo.isUserExists(email);
                                  if (userExists) {
                                    Get.snackbar("The Juice",
                                        "User with the same email already exists.");
                                  } else {
                                    final user = UserModel(
                                      name: nameController.text.trim(),
                                      email: usernameController.text.trim(),
                                      mobile: mobileController.text.toString(),
                                      gender: gender,
                                    );
                                    await userRepo.createUser(user);
                                    final UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: usernameController.text,
                                                password:
                                                    passwordController.text);
                                    Get.snackbar("The Juice",
                                        "Welcome, you have successfully registered.");
                                    Get.off(() => const ToggleScreen());
                                  }
                                } catch (error) {
                                  print("Error: $error");
                                  Get.snackbar("The Juice",
                                      "User can't be registered try after sometime.");
                                }
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
                          padding: EdgeInsets.only(
                            top: screenHeight * 0.05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(fontSize: 14),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(() => LoginPage());
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ))
                            ],
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
