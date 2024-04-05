import 'dart:convert';
import 'package:carebridge/widgets/customTextField/custom_text_field.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiagnoseAi extends StatefulWidget {
  const DiagnoseAi({super.key});

  @override
  State<DiagnoseAi> createState() => _DiagnoseAiState();
}

class _DiagnoseAiState extends State<DiagnoseAi> {

  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'Guest');
  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: 'ChatGPT');

  TextEditingController promptController = TextEditingController();
  String diagnose = "";

  Future<void> sendProductDescription(String name, String notes) async {
  final String url = 'https://791a-14-139-217-140.ngrok-free.app/product_description';
  
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
      diagnose = response.body;
      setState(() {
      });
    } else {
      print('Failed to send product description. Error: ${response.statusCode}');
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
                      onPressed: () async{
                        sendProductDescription(promptController.text, "cough");
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
      )
    );
  }
}

// Future<void> sendDiagnosisRequest(String issue) async {
//   final String apiUrl = 'https://9829-2401-4900-3a68-68ad-5400-7d53-3ca4-c20d.ngrok-free.app/diagnose/'; 
//   final Map<String, String> headers = {
//     'Content-Type': 'application/json',
//   };

//   final Map<String, dynamic> body = {
//     'issue': issue,
//   };

//   try {
//     final http.Response response = await http.post(
//       Uri.parse(apiUrl),
//       headers: headers,
//       body: jsonEncode(body),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       Map<String, dynamic> diagnose = data;
//       print('Diagnoses: ${diagnose.entries.first.value}');
//     } else {
//       print('Request failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error occurred: $e');
//   }
// }

//   Future<void> getResponse(String s) async {
//     final prompt = s;
//     if(prompt.isNotEmpty){
//       print(await callChatGPT(prompt));
//     }
//   }
//   Future<String?> callChatGPT(String prompt) async {
//     const apiKey = "";
//     const apiUrl = "https://api.openai.com/v1/chat/completions";
//     final headers = {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $apiKey'
//     };
//     final body = jsonEncode(
//       {
//         "model": "gpt-3.5-turbo",
//         "messages": [
//                 {
//                     "role": "system",
//                     "content": "You are a helpful assistant that tells diseases from symptoms"
//                 },
//                 {
//                     "role" : "user",
//                     "content":  "I am having $prompt what disease i whight be suffering from?"// note the removal of quotes
//                 }
//             ],
//         "max_tokens": 10,
//       }
//     );
//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: headers,
//         body: body
//       );
//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         final result = jsonResponse['choices'][0]['text'];
//         return result.trim();
//       }
//       else{
//         return "Failed to call ChatGPT API: ${response.statusCode}";
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
  // Future<void> getChatResponse(ChatMessage m) async {
  //   setState(() {
  //     messagesList.insert(0, {'user': m.user, 'content': 'I am having ${m.text}. Can you please tell me the disease i might be suffering from based on the symptoms?'});
  //     chatMessagesList.insert(0, m);
  //   });
  //   List<Map<String, dynamic>> messageHistory = messagesList.reversed.map((e) {
  //     if(e['user'] == _currentUser){
  //       return e;
  //     }
  //     else {
  //       return e;
  //     }
  //   }).toList();
  //   final request = ChatCompleteText(
  //     model: GptTurbo0301ChatModel(), 
  //     messages: messageHistory,
  //     maxToken: 100
  //   );
  //   final response = await _openAI.onChatCompletion(request: request);
  //   for(var element in response!.choices) {
  //     if(element.message != null) {
  //       setState(() {
  //         chatMessagesList.insert(
  //           0, 
  //           ChatMessage(
  //             user: _gptChatUser, 
  //             createdAt: DateTime.now(), 
  //             text: element.message!.content)
  //           );
  //       });
  //     }
  //   }
  // }
