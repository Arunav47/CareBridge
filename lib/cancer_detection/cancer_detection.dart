import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CancerDetectionScreen extends StatefulWidget {
  const CancerDetectionScreen({super.key});

  @override
  State<CancerDetectionScreen> createState() => _CancerDetectionScreenState();
}

class _CancerDetectionScreenState extends State<CancerDetectionScreen> {
  File? selectedImage;
  String? message = "";

  uploadImage() async{
    final request = http.MultipartRequest("POST", Uri.parse("https://5a3e-2409-40e6-e-c969-d70-7e12-c1a3-d781.ngrok-free.app/"));
    final header = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('imagefile', selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(), filename: selectedImage!.path.split("/").last));
    request.headers.addAll(header);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson = jsonDecode(res.body);
    message = resJson['prediction'];
    setState(() {});
  }

  Future getImage() async{
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D7A78),
        leading: Container(
          margin: EdgeInsets.only(left: 4),
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            radius: 10,
            child: Image(image: AssetImage("assets/logo.png")),
          ),
        ),
        title: Text("CareBridge", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopify, color: Colors.cyan,))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: height*0.3,
              width: width*0.7,
              child: selectedImage == null ? Text("Upload your CT scan Image")
            : Image.file(selectedImage!),
            ),
            selectedImage == null? 
            Container(height: 70, width: 100):
            ElevatedButton(
              onPressed: uploadImage, 
              child: Container(
                width: 100,
                height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload),
                  Text("Upload")
                ],
              ),
            )
            ),
            Text("$message")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: getImage),
    );
  }
}