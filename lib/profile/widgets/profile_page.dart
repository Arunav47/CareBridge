// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:carebridge/home/widgets/home.dart';
import 'package:carebridge/profile/widgets/profile_controller.dart';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

String? email = FirebaseAuth.instance.currentUser!.email;

// String name = "";
// String email = "";


// final user = FirebaseAuth.instance.currentUser;
// final firestore = FirebaseFirestore.instance;

//   final docRef = firestore.collection('users').doc(user?.uid); // Replace 'userId' with your logic to get the document ID
//   docRef.get().then((docSnapshot) {
//     if (docSnapshot.exists) {
//       final username = docSnapshot.data()!['username'];
//       final email = docSnapshot.data()!['email'];
//       // Display fetched username and email
//       // ...
//     } else {
//       // Handle document not found scenario
//     }
//   });



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // String? email;
  // String? fullName;
  // void demo() async {
  //   DocumentSnapshot documentSnapshot;
  //   final user = await FirebaseAuth.instance.currentUser!.uid;

  //   await FirebaseFirestore.instance
  //   .collection('users')
  //   .doc(user)
  //   .get()
  //   .then((value) {
  //     documentSnapshot = value;
  //   });
  //   if (documentSnapshot != null) { // Check if it's not null before using
  //   final email = documentSnapshot!['email']; // Using the non-null assertion operator (!)
  //   print(email);
  // } else {
  //   print('Document snapshot is null!');
  // }
  // }
  
  
  


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    // print(entry!['email']);
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: Container(
          margin: EdgeInsets.only(left: 4),
          padding: EdgeInsets.all(4),
        ),
        title: Text("Profile"),
        centerTitle: true,
      ),
        // body: FutureBuilder(
        //   future: controller.getUserData(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot){
        //    if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        //    else{
        //     return Column(
        //       children: [
        //           Text(controller.email.value),
        //       ],
        //     );
        //    }
        //   }),

        body: Obx(
          ()=> controller.isLoading.value? const Center(child: CircularProgressIndicator()):
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              CircleAvatar(
            radius: 100,
            child: Image(image: AssetImage("assets/logo.png")),
          ),
              SizedBox(height: 15,),
              Center(
                child: Column(
                  children: [Text("You are signed in as:",style: TextStyle(fontWeight: FontWeight.bold),),  
              SizedBox(height: 10,),
              Text(email!,style: TextStyle(fontWeight: FontWeight.w300),),],
                ),
              )
              ],
          ),
        )

    );
  }
}



// class userManagement {
//   storeUser(user,context) async {
//     var fuser = await FirebaseAuth.instance.currentUser!;
//     FirebaseFirestore.instance.collection('users').add({'email':user.email, 'uid': user.uid}).then((value) =>
//     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))).catchError((e){print(e);}); 
//   }
// }

// _fetch() async{
//   final firebaseUser = await FirebaseAuth.instance.currentUser!;
//   if(firebaseUser != null){
//     await FirebaseFirestore.instance.collection('user').
//     doc(firebaseUser.uid).get().then((ds) {
//       email = ds.data['email'],
//     })
//   }
// }

// _fetch() async {
//   final firebaseUser = await FirebaseAuth.instance.currentUser!;

//   if (firebaseUser != null) {
//     await FirebaseFirestore.instance.collection('user').doc(firebaseUser.uid).get().then((ds) {
//       // Access the data first using ds.data()
//       final data = ds.data();
//       // Then use the [] operator on the actual data
//       email = data!['email'];
//       name = data!['fullName'];
//     });
//   }
// }