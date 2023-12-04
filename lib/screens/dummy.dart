// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class Dummy extends StatefulWidget {
//   const Dummy({super.key});

//   @override
//   State<Dummy> createState() => _DummyState();
// }

// class _DummyState extends State<Dummy> {
//   File? imageFile;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             imageFile==null?Image.asset("assets/c.png"):
//             ClipRRect(
//               borderRadius: BorderRadius.circular(50),
//               child: Image.file(imageFile!,height:300 ,),
//             ),
//             ElevatedButton(onPressed: ()async{
//             Map<Permission,PermissionStatus> status = await[Permission.storage,Permission.camera].request();
//             if(status[Permission.storage]!.isGranted&& status[Permission.camera]!.isGranted){
//               showImagePicker(context);
//             }else{
//               print("Not allwed");
//             }
//             }, child: Text("Show"))
//           ],
//         ),
//       ),
//     );
//   }

// final picker = ImagePicker();

// void showImagePicker(BuildContext context){
//   showBottomSheet(context:context , 
//   builder: (builder){
//     return Card(
//       child: Container(
//         height: 50,
//         width: double.maxFinite,
//         child: Row(
//           children: [  
//             IconButton(onPressed: (){}, icon: Icon(Icons.camera)),
//             Spacer(),
//             IconButton(onPressed: (){

//             }, icon: Icon(Icons.browse_gallery))
//           ],
//         ),
//       ),
//     );
//   });
// }