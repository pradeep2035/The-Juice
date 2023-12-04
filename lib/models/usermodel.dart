import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String? id;
  final String? name;
  final String? email;
  final String? mobile;
  final String?gender;
  
  const UserModel({this.id,required this.name,required this.email,required this.mobile,required this.gender});

    Map<String, dynamic> toJson(){
    return{
      "Name": name,
      "Email": email,
      "Mobile":mobile,
      "Gender":gender,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data();
    print("++++++++++++++++++++++++++++++++++++++++++++++");
    print(document.id);
    return UserModel(
       id: document.id,
       name: data!['Name'],
       email: data['Email'], 
       mobile: data['Mobile'], 
       gender: data['Gender'],
      );
  }
}