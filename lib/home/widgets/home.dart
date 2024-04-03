import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Container(
                height: height*0.24,
                width: width*0.9,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                    ),
                  children: [
                    InkWell(
                      child: Card(
                        child: Container(
                          height: height*0.2,
                          width: width*0.4,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        child: Container(
                          height: height*0.2,
                          width: width*0.4,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        child: Container(
                          height: height*0.2,
                          width: width*0.4,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Card(
                        child: Container(
                          height: height*0.2,
                          width: width*0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

      );
  }
}