import 'dart:async';
import 'package:carebridge/auth/auth.dart';
import 'package:carebridge/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SplashServices {
  final _auth = FirebaseAuth.instance;

  void isLogin(BuildContext context) {
    if (_auth.currentUser != null) {
      Timer(
          const Duration(seconds: 6),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePageScreen())));
    } else {
      Timer(
          const Duration(seconds: 6),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Auth())));
    }
  }
}
