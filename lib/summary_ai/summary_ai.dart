import 'dart:convert';

import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class SummaryAI extends StatefulWidget {
  const SummaryAI({super.key});

  @override
  State<SummaryAI> createState() => _SummaryAIState();
}

class _SummaryAIState extends State<SummaryAI> {
  TextEditingController promptController = TextEditingController();
  String summary = "";

Future<void> summarizeText(String text) async {
  final String apiUrl = 'https://dce9-2409-40e6-38-6731-6c95-99cd-2911-fba8.ngrok-free.app/summarize/';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Map<String, String> body = {
    'text': text,
  };

  final http.Response response = await http.post(
    Uri.parse(apiUrl),
    headers: headers,
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    final resJson = jsonDecode(response.body);
    summary = resJson['summary'];
    setState(() {
    });
  } else {
    throw Exception('Failed to load data');
  }
}
  // Future<void> sendProductDescription(String name) async {
  //   final String url =
  //       'https://dce9-2409-40e6-38-6731-6c95-99cd-2911-fba8.ngrok-free.app/summarize/';

  //   Map<String, dynamic> productData = {
  //     'text': name,
  //   };
  //   String jsonData = jsonEncode(productData);

  //   try {
  //     final http.Response response = await http.post(
  //       Uri.parse(url),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: name,
  //     );
  //     if (response.statusCode == 200) {
  //       final resJson = jsonDecode(response.body);
  //       summary = resJson['summary'];
  //       setState(() {});
  //     } else {
  //       print(
  //           'Failed to send product description. Error: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }
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
                            summarizeText(
                                promptController.text);
                          },
                          icon: Icon(Icons.send))
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    width: width,
                    child: Text("Summary: $summary")),
              ],
            ),
          ),
        ));
  }
}