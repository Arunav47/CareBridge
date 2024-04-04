import 'package:carebridge/home/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  signupUser() async{
    UserCredential? userCredential;
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    if(userCredential != null){
      await storeUserData(userCredential.user!.uid, fullNameController.text, emailController.text);
    }
  }

  storeUserData(String uid, String fullName, String email) async{
    var storeUser = FirebaseFirestore.instance.collection('users').doc(uid);
    await storeUser.set({
      'fullName' : fullName,
      'email' : email
    });
  }
  login(BuildContext context) async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));});
  }
  signout() async{
    await FirebaseAuth.instance.signOut();
  }
}