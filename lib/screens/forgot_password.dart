import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:the_juice/screens/login.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded))),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Forgot',
                    style: GoogleFonts.workSans(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 18, 46, 85),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password ?',
                    style: GoogleFonts.workSans(
                        fontSize: 36,
                        color: const Color.fromARGB(255, 18, 46, 85),
                        fontWeight: FontWeight.w700),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Lottie.asset("assets/Animation - 1701017478293.json", height: MediaQuery.sizeOf(context).height * 0.33),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Input the Email associated with your account.",
              textAlign: TextAlign.center,
              style: GoogleFonts.workSans(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "We will email you a link to reset your password.",
              textAlign: TextAlign.center,
              style: GoogleFonts.workSans(fontSize: 17, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.07,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16)),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color.fromARGB(255, 18, 46, 85),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 20, top: 5),
                      hintText: 'Enter email address',
                      hintStyle: GoogleFonts.workSans(fontSize: 17)),
                ),
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async{
                try{
              await auth.sendPasswordResetEmail(email:emailController.text.trim()).then((value) =>
              {
                print('Email Sent'),
                //Fluttertoast.showToast(msg:"Sent"),
                Get.off(()=>LoginPage()),
              });
                }on FirebaseAuthException catch(e){
                  print("Error: $e");
                }
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.05,
                width: MediaQuery.sizeOf(context).width * 0.6,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 18, 46, 85),
                    borderRadius: BorderRadius.circular(22)),
                child: const Padding(
                  padding: EdgeInsets.only(top: 9.0),
                  child: Text(
                    'S E N D',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
