import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_juice/screens/login.dart';
import 'package:the_juice/screens/profile_page.dart';
import 'package:the_juice/screens/toggle.dart';
import 'package:the_juice/sharepreferencehelper.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
   bool isSelectedHome=false;
   bool isSelectedOrder=false;
   bool isSelectedProfile=false;
   bool isSelectedAbout=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:const Color(0xff243949) ,
      child: Padding(
        padding: const EdgeInsets.only(top:60,left: 10,bottom:60 ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
             const CircleAvatar(),
             const SizedBox(width: 10,),
             Text(SharedPreferencesHelper.getUserName(),style:const TextStyle(fontSize: 15,color: Colors.white),),
              ],
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Get.to(()=>ToggleScreen());
                      //Get.back();
                    isSelectedHome=true;
                    isSelectedProfile=false;
                    isSelectedAbout=false;
                    isSelectedOrder=false;
                    });
                  },
                  child:  Row(children: [
                    Icon(Icons.home_outlined,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('H O M E',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:isSelectedHome?17:15),),
                  ],),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                    isSelectedHome=false;
                    isSelectedProfile=false;
                    isSelectedAbout=false;
                    isSelectedOrder=true;
                    });
                    
                  },
                  child:  Row(children: [
                    Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('M Y  O R D E R S',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:isSelectedOrder?17:15),),
                  ],),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                onTap: (){
                  setState(() {
                    Get.to(()=>ProfilePage());
                    isSelectedHome=false;
                    isSelectedProfile=true;
                    isSelectedAbout=false;
                    isSelectedOrder=false;
                  });

                },
                  child:  Row(children: [
                    Icon(Icons.person_2_outlined,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('P R O F I L E',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:isSelectedProfile?17:15),),
                  ],),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                    isSelectedHome=false;
                    isSelectedProfile=false;
                    isSelectedAbout=true;
                    isSelectedOrder=false;
                    });
                  },
                  child:  Row(children: [
                    Icon(Icons.info_outline,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('A B O U T',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:isSelectedAbout?17:15),),
                  ],),
                ),
              ],
            ),
            GestureDetector(
              onTap: ()async{
                try {
              await FirebaseAuth.instance.signOut();
             Get.off(()=>LoginPage());
            } catch (e) {
              print("Error logging out: $e");
            }
              },
              child:  Row(
                children: [
                  Icon(Icons.logout_outlined,color: Colors.white,),
                  Text('LOG OUT',style: TextStyle(fontSize: 15,color: Colors.white),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}