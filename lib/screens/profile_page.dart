import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:the_juice/controllers/user_repository.dart';
import 'package:the_juice/screens/edit_profile.dart';
import 'package:the_juice/sharepreferencehelper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  final profileController = Get.put(UserRepository());
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child:FutureBuilder(
        future: profileController.getCurrentUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('User not found'));
          } else {
            SharedPreferencesHelper.setUserName(userName:snapshot.data!['Name']);
       return Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.36,
                //color: Colors.white,
                child: Lottie.asset("assets/Animation - 1701373919300.json",
                    fit: BoxFit.fitHeight),
              )),
          Positioned(
            top: screenHeight*0.06,
            right: 20,
            child: Column(
              children: [
                Text(
                  "the",
                  style: GoogleFonts.nothingYouCouldDo(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                Text("JUICE",
                    style: GoogleFonts.nothingYouCouldDo(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              heightFactor: 2.9,
              child: CircleAvatar(
                radius: 50,
                child: Lottie.asset(snapshot.data!['Gender']=='Male'?"assets/Animation - 1701373782694.json":"assets/Animation - 1701373859049.json"),
              ),
            ),
          ),
          Positioned(
              top: screenHeight*0.04,
              child: IconButton.filled(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.grey.shade700,
                ),
                splashColor: Colors.grey,
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: MediaQuery.sizeOf(context).height * 0.72,
                decoration: const BoxDecoration(
                    color: Color(0xFFF2F3F4),
                    // color: Colors.deepPurpleAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child:Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Profile",
                                style: GoogleFonts.workSans(
                                    fontSize: 28,
                                    color: Color.fromARGB(255, 18, 46, 85),
                                    fontWeight: FontWeight.w600),
                              ),
                              TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  //filled:true,
                                  hintText: snapshot.data!['Name'] ?? 'N/A',
                                  hintStyle: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  contentPadding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.alternate_email_sharp),
                                  //filled:true,
                                  hintText: snapshot.data!['Email'] ?? 'N/A',
                                  hintStyle: GoogleFonts.workSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  contentPadding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.call_outlined),
                                  //filled:true,
                                  hintText: snapshot.data!['Mobile'] ?? 'N/A',
                                  hintStyle: GoogleFonts.workSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  contentPadding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.location_on_outlined),
                                  //filled:true,
                                  hintText: 'Address',
                                  hintStyle: GoogleFonts.workSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  contentPadding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.cake_outlined),
                                  //filled:true,
                                  hintText: 'Date of Birth',
                                  hintStyle: GoogleFonts.workSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  contentPadding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      snapshot.data!['Gender'] == 'Male'
                                          ? Icons.male
                                          : Icons.female),
                                  //filled:true,
                                  hintText: snapshot.data!['Gender'] ?? 'N/A',
                                  hintStyle: GoogleFonts.workSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  contentPadding: const EdgeInsets.only(
                                    left: 30,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  disabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showBottomSheet(
                                      context: context,
                                      shape: CircleBorder(eccentricity: 1.0),
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.72,
                                          width: double.maxFinite,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 18, 46, 85),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight:
                                                      Radius.circular(30))),
                                          child: EditProfilePage(userdata:snapshot.data),
                                        );
                                      });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.55,
                                  height:
                                      MediaQuery.sizeOf(context).width * 0.11,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 18, 46, 85),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Edit Profile',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.workSans(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        
                      //}),
                ),
              )),
        ],
      );
      }}),
    ));
  }
}
