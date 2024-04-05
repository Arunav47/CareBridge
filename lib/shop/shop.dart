import 'package:carebridge/const/const.dart';
import 'package:flutter/material.dart';

class MedicineShop extends StatefulWidget {
  const MedicineShop({super.key});

  @override
  State<MedicineShop> createState() => _MedicineShopState();
}

class _MedicineShopState extends State<MedicineShop> {
  MedicineList mdlist = MedicineList();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: ListView.builder(
        itemCount: mdlist.medications.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(mdlist.medications[index]),
          );
        })
    );
  }
}