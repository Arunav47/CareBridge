import 'dart:convert';

import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiagnoseAi extends StatefulWidget {
  const DiagnoseAi({super.key});

  @override
  State<DiagnoseAi> createState() => _DiagnoseAiState();
}

class _DiagnoseAiState extends State<DiagnoseAi> {
  TextEditingController promptController = TextEditingController();
  String diagnose = "";

  postPrompt(String issue) async {
    final response = await http.post(
      Uri.parse('https://7f67-2409-40e6-11-4776-6c36-8d03-ad00-bd02.ngrok-free.app/diagnose/'),
      body: {'issue_request': issue},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      diagnose = data["diagnoses"];
      setState(() {});
    }
  }
Future<void> sendDiagnosisRequest(String issue) async {
  final String apiUrl = 'https://ce63-2409-40e6-11-4776-6c36-8d03-ad00-bd02.ngrok-free.app/diagnose/'; // Replace with your FastAPI endpoint URL
  
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Map<String, dynamic> body = {
    'issue': issue,
  };

  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Request successful
      final data = jsonDecode(response.body);
      Map<String, dynamic> diagnose = data;
      // Handle the diagnoses data as needed
      print('Diagnoses: ${diagnose.entries.first.value}');
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred
    print('Error occurred: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopify,
                color: Colors.cyan,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 10),
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CustomTextField(
                  label: "Enter your Issue",
                  controller: promptController,
                ),
                IconButton(
                    onPressed: (){
                      // postPrompt(promptController.text);
                      sendDiagnosisRequest(promptController.text);
                      },
                    icon: Icon(Icons.send))
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Text("Diagnose : $diagnose"))
          ],
        ),
      ),
    );
  }
}
