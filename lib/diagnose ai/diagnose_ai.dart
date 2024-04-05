import 'dart:convert';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
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

  Future<void> sendProductDescription(String name, String notes) async {
    final String url =
        'https://791a-14-139-217-140.ngrok-free.app/product_description';

    Map<String, dynamic> productData = {
      'name': name,
      'notes': notes,
    };
    String jsonData = jsonEncode(productData);

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );
      if (response.statusCode == 200) {
        final resJson = jsonDecode(response.body);
        diagnose = resJson['product_description'];
        setState(() {});
      } else {
        print(
            'Failed to send product description. Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  List<Map<String, dynamic>> messagesList = <Map<String, dynamic>>[];
  List<ChatMessage> chatMessagesList = <ChatMessage>[];
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
          width: width,
          child: Form(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        label: "Enter your issue",
                        controller: promptController,
                      ),
                      IconButton(
                          onPressed: () async {
                            sendProductDescription(
                                promptController.text, "cough");
                          },
                          icon: Icon(Icons.send))
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    width: width,
                    child: Text("Diagnoses: ${diagnose}")),
              ],
            ),
          ),
        ));
  }
}

