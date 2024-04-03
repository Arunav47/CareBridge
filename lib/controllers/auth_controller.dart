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
  signout() async{
    await FirebaseAuth.instance.signOut();
  }
}