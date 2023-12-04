import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:the_juice/models/usermodel.dart';

class UserRepository extends GetxController{
 static UserRepository get instance => Get.find();

 final _db = FirebaseFirestore.instance;
 final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> createUser(UserModel user)async{
     await  _db.collection("Users").add(user.toJson()).whenComplete((){
     print('**************USER CREATED*************');
     //Get.snackbar("The Juice", "Welcome, you have successfully registered.");
     }
     )
     .catchError((error,stackrace){
      print("ERROR: $error");
      //Get.snackbar("The Juice", "User can't be registered try after sometime.");
     }
     );
    }

   Future<bool> isUserExists(String email) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('Users')
          .where('Email', isEqualTo: email)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking user existence: $e");
      return false;
    }
  }

  Future<Map<String, dynamic>> getCurrentUserDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
      print('Current User Email: ${user.email}');
        // Fetch the user details based on the current user's email
        final snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .where('Email', isEqualTo: user.email)
            .get();
            print("***********************************************$snapshot");
            
        final userData =
            snapshot.docs.map((e) => e.data()).singleOrNull; // Using singleOrNull for safety
            print("#######################################$userData");
        return userData ?? {};
      }
    } catch (error) {
      print("Error fetching user details: $error");
    }

    return {};
  }


  Future <void> updateUserRecord(UserModel user)async{
 print('Updating user record with ID: ${user.id}');
  try {
    await _db.collection("Users").doc(user.id).update(user.toJson());
    print('User record updated successfully.');
  } catch (e) {
    print('Error updating user record: $e');
  }  }

}