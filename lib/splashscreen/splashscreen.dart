import 'dart:async';

import 'package:carebridge/auth/auth.dart';
import 'package:carebridge/home/homepage.dart';
import 'package:carebridge/splashscreen/splashservices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    SplashServices splashScreen = SplashServices();

  @override
  void initState() {

    super.initState();
    // if(user != null)
    // {
    //   Future.delayed(Duration(seconds: 3), (){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Auth()));
    //  });
    // }
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HealthCare App"),
      ),
    );
  }
}