import 'package:carebridge/appointment/appointment.dart';
import 'package:carebridge/appointment/appointment_view.dart';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var Names = [
  "Dr. Arunav",
  "Dr. Satyam",
  "Dr. Suman",
  "Dr. Siman",
];


class Doctors extends StatelessWidget {
  const Doctors({super.key});

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
        title: Text("Available Doctors"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopify, color: Colors.cyan,))
        ],
      ),
      body : Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: () {
          Navigator.push(context, MaterialPageRoute(
          builder: (context) => const AppointmentView()));
          },
          child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 170, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemCount: Names.length,
           itemBuilder: (BuildContext context, int index){
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 135, 134, 134), borderRadius: BorderRadius.circular(12),
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
                  Text(Names[index], style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      Text(' '),
                      StarRating(rating: index),
                    ],
                  ),
          
                  
                ],
              ),
            );
           }),
        ),
      )
    );
  }
}

class StarRating extends StatelessWidget {
  final int rating;

  const StarRating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) => _star(index < rating)),
    );
  }

  Widget _star(bool filled) {
    return Icon(
      filled ? Icons.star : Icons.star_border,
      color: Colors.amber,
      size: 16,
    );
  }
}