import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_juice/controllers/user_repository.dart';
import 'package:the_juice/models/usermodel.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, this.userdata});
  final userdata;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final profileController = Get.put(UserRepository());
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController mobileController;
  late TextEditingController addressController;
  late TextEditingController dobController;
  late TextEditingController genderController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: widget.userdata!['Name']);
    emailController = TextEditingController(text: widget.userdata!['Email']);
    mobileController = TextEditingController(text: widget.userdata!['Mobile']);
    addressController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController(text: widget.userdata!['Gender']);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey ,
      child: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Edit Profile',
              style: GoogleFonts.workSans(
                  fontSize: 28,
                  color: Colors.grey.shade200,
                  fontWeight:
                      FontWeight.w500),
            ),
            //SizedBox(height: 10,),
            TextFormField(
              controller: nameController,
              style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                prefixIconColor: Colors.white,
                //filled:true,
                hintText: 'Name',
                hintStyle: GoogleFonts.workSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.only(
                  left: 30,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
              ),
            ),
            TextFormField(
              controller: emailController,
              style: GoogleFonts.workSans(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.alternate_email_sharp),
                prefixIconColor: Colors.white,
                //filled:true,
                hintText: 'Email',
                hintStyle: GoogleFonts.workSans(
                    fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
                contentPadding: const EdgeInsets.only(
                  left: 30,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
              ),
            ),
            TextFormField(
              controller: mobileController,
              style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call_outlined),
                prefixIconColor: Colors.white,
                //filled:true,
                hintText: 'Mobile Number',
                hintStyle: GoogleFonts.workSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.only(
                  left: 30,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
              ),
            ),
            TextFormField(
              controller: addressController,
              style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on_outlined),
                prefixIconColor: Colors.white,
                //filled:true,
                hintText: 'Address',
                hintStyle: GoogleFonts.workSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,color: Colors.white),
                contentPadding: const EdgeInsets.only(
                  left: 30,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
              ),
            ),
            TextFormField(
              controller: dobController,
              style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.cake_outlined),
                prefixIconColor: Colors.white,
                //filled:true,
                hintText: 'Date of Birth',
                hintStyle: GoogleFonts.workSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,color: Colors.white),
                contentPadding: const EdgeInsets.only(
                  left: 30,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
              ),
            ),
            TextFormField(
              controller: genderController,
              style: GoogleFonts.workSans(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon( widget.userdata!['Gender'] == 'Male'
                                          ? Icons.male
                                          : Icons.female),
                prefixIconColor: Colors.white,
                //filled:true,
                hintText: 'Date of Birth',
                hintStyle: GoogleFonts.workSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.only(
                  left: 30,
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),),
              ),
            ),
            //SizedBox(height: 30,),
            InkWell(
              onTap: ()async {
                final userEditedData = UserModel(
                  name: nameController.text.trim(), 
                  email: emailController.text.trim(),
                  mobile: mobileController.text.trim(),
                  gender: genderController.text.trim(),
                  );
                  await profileController.updateUserRecord(userEditedData);
                  // toast msg
                  Get.back();
              },
              child: Container(
                width:
                    MediaQuery.sizeOf(context).width * 0.55,
                height:
                    MediaQuery.sizeOf(context).width * 0.11,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Save Profile',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.workSans(
                        fontSize: 20,
                        color: Color.fromARGB(255, 18, 46, 85),
                        fontWeight: FontWeight.w500),
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