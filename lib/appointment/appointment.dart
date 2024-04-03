import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  List<Map<String, String>> Doctorlist = [
    {}
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(itemBuilder: (context, index){
        return ListTile(
          title:Text(Doctorlist[index].entries.first.key),
          subtitle: Text(Doctorlist[index].entries.first.value),
        );
      })
    );
  }
}