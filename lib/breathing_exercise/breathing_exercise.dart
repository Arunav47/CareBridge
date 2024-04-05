import 'dart:async';
import 'package:carebridge/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BreathingPractice extends StatefulWidget {
  BreathingPractice({
    super.key,
  });

  @override
  State<BreathingPractice> createState() => _BreathingPracticeState();
}

class _BreathingPracticeState extends State<BreathingPractice> {
  bool val = false;
  int count = 120;
  Widget? timerReturner(bool val) {
    if (val) {
      return Column(
        children: [
          Container(
            child: Lottie.asset('assets/xvEoTtb4Pg.json'),
          ),
          Text(
            "${count--}",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (val == false) {
            setState(() {
              val = true;
            });
          }
          else{
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));
            });
          }
        },
        child: Icon(Icons.play_arrow),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF2D7A78),
        leading: Container(
          margin: EdgeInsets.only(left: 4),
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            radius: 10,
            child: Image(image: AssetImage("assets/logo.png")),
          ),
        ),
        title: Text("Breathing Practice", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopify, color: Colors.cyan,))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "Anxiety",
              style: TextStyle(color: Colors.white),
            ),
            Container(
              alignment: Alignment.center,
              height: 500,
              child: timerReturner(val),
            )
          ],
        ),
      ),
    );
  }
}
