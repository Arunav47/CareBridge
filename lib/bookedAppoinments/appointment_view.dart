import 'package:flutter/material.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

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
      body: ListView.builder(itemCount:4, itemBuilder: (BuildContext context, int index)
      {return ListTile(
        leading: CircleAvatar(
          child: Image.asset("assets/icons/doc.png"),
        ),
        title: Text("Doctor Name"),
        subtitle: Text("Appointment time"),
      );}
      ),    
    );
  }
}