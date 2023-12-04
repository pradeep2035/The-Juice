import 'package:flutter/material.dart';
import 'package:the_juice/screens/drawer.dart';
import 'package:the_juice/screens/home.dart';

class ToggleScreen extends StatefulWidget {
  const ToggleScreen({super.key});

  @override
  State<ToggleScreen> createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Stack(
        children:[
        DrawerScreen(),
        HomePage(),
        ]
      ),
    );
  }
}