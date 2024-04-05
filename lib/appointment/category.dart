import 'package:carebridge/appointment/category_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var IconList = [
  "assets/icons/heart.png",
  "assets/icons/ear.png",
  "assets/icons/lungs.png",
  "assets/icons/liver.png",
  "assets/icons/eye.png"
];

var iconName = [
  "Heart",
  "Ear",
  "Lungs",
  "Liver",
  "Eye"
];

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
          (
            crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200
            ),itemCount: IconList.length, itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: () {
                                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const categoryDetails()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 226, 226, 226),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Image.asset(IconList[index], width : 60, ),
                      const Divider(color: Colors.white,),
                      SizedBox(height: 10,),
                      Text(iconName[index],style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              );
            }
          ),
      )
    );
  }
}