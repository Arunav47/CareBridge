import 'package:carebridge/auth/auth.dart';
import 'package:carebridge/controllers/auth_controller.dart';
import 'package:carebridge/profile/widgets/prescriptions.dart';
import 'package:carebridge/profile/widgets/profile_page.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
            },
            leading: CircleAvatar(
              child: Image(image: AssetImage("assets/logo.png")),
            ),
            title: Text("Username"),
            subtitle: Text("useremail@gmail.com")
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text("Prescriptions"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Prescription()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Signout"),
            onTap: () async{
              AuthController().signout();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Auth()));
            },
          )
        ],
      )
    );
  }
}