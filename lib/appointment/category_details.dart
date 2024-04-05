import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class categoryDetails extends StatelessWidget {
  const categoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.green[700],
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
          IconButton(onPressed: (){}, icon: Icon(Icons.shopify, color: Colors.cyan,))
        ],
      ),
      body : Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 170, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemCount: 6,
         itemBuilder: (BuildContext context, int index){
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(right: 8),
            height: 100,
            width: 150,
            child: Column(
              children: [
                Container(
                  
                  alignment: Alignment.center,
                  color: Colors.green[700],
                  child: Image.asset( "assets/icons/doc.png", width:100, fit: BoxFit.cover),
                ),
                SizedBox(height: 5,),
                Text("Doctor name", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                
              ],
            ),
          );
         }),
      )
    );
  }
}