import 'package:carebridge/appointment/appointment_view.dart';
import 'package:flutter/material.dart';

class BookedAppointments extends StatelessWidget {
  const BookedAppointments({super.key});

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
        title: Text("Book an appointment"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopify, color: Colors.cyan,))
        ],
      ),
      body: ListView.builder(itemCount:4, itemBuilder: (BuildContext context, int index)
      {return ListTile(
        onTap: (){
         Navigator.push(
        context,
        MaterialPageRoute(
        builder: (context) => const AppointmentView()));
        },
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