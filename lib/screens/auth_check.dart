import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_juice/screens/onboarding.dart';
import 'package:the_juice/screens/toggle.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return ToggleScreen(); // User is authenticated, navigate to HomeScreen
        } else {
          return OnboardingScreen(); // User is not authenticated, navigate to LoginScreen
        }
      },
    );
  }
}