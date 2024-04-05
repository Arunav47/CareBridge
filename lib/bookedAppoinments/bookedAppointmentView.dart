import 'package:carebridge/widgets/customTextButton/custom_text_button.dart';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView
({super.key});

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
        title: Text("Your Appointments"),
        centerTitle: true,

      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select appointment day",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                CustomTextField(label:"Select day"),
                SizedBox(height: 15,),
                Text("Select appointment day",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Selected day"),
                SizedBox(height: 15,),
                Text("Your phone number",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Phone number"),
                SizedBox(height: 15,),
                Text("Your Name",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("Enter your name",)

              ],
            ),
          ],
        ),
      ),
    );
  }
}