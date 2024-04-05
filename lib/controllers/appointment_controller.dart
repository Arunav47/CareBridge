import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentController{
  var appDay = TextEditingController();
  var appTime = TextEditingController();
  var appPhone = TextEditingController();
  var appName = TextEditingController();

  bookAppointment() async{
    var store = FirebaseFirestore.instance.collection('appointments').doc();
    await store.set({
      "appDay" : appDay.text,
      "appTime" : appTime.text,
      "appPhone" : appPhone.text,
      "appName" : appName.text,
      
    });
  }
}