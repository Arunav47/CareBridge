import 'package:carebridge/cancer_detection/cancer_detection.dart';
import 'package:carebridge/diagnose%20ai/diagnose_ai.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> image = [
    Image(image: AssetImage("assets/car2.jpg")),
    Image(image: AssetImage("assets/car3.jpg")),
    Image(image: AssetImage("assets/car1.jpeg")),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                height: height * 0.24,
              ),
              itemCount: 3,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Card(
                    child: Container(
                        height: height * 0.24,
                        width: width * 0.9,
                        child: image[itemIndex]));
              }),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: [
                  InkWell(
                    child: Card(
                      child: Container(
                        height: height * 0.2,
                        width: width * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height*0.15,
                              child: Image(image: AssetImage('assets/oncology.png'))),
                            Text("Cancer Detection")
                            
                            ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height*0.15,
                              child: Image(image: AssetImage('assets/oncology.png'))),
                            Text("Cancer Detection")
                            
                            ],
                        ),
                        height: height * 0.2,
                        width: width * 0.4,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CancerDetectionScreen()));
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height*0.15,
                              child: Image(image: AssetImage('assets/oncology.png'))),
                            Text("Cancer Detection")
                            
                            ],
                        ),
                        height: height * 0.2,
                        width: width * 0.4,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiagnoseAi()));
                    },
                    child: Card(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height*0.15,
                              child: Image(image: AssetImage('assets/detection.png'))),
                            Text("Cancer Detection")
                            
                            ],
                        ),
                        height: height * 0.2,
                        width: width * 0.4,
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
