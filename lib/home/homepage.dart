import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 4),
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            radius: 10,
            child: Image(image: AssetImage("assets/logo.png")),
          ),
        ),
        title: Text("CareBridge"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.medication))
        ],
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Container(
                height: height*0.24,
                width: width*0.9,
              ),
            )
          ],
        ),

      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   items: [

      //   ],
        
      //   ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.cyan,
        selectedItemColor: Colors.green[700],
    items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Appointment'),
          BottomNavigationBarItem(icon: Icon(Icons.shopify), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
  ),
    );
  }
}