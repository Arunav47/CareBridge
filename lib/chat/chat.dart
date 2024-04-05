import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> messages = [];

Future<String> getChatResponse(String message) async {
  String apiKey = '';
  String endpoint = 'https://api.openai.com/v1/chat/completions';
  String prompt = '{"messages": [{"role": "user", "content": "$message"}]}';
  int maxTokens = 100;
  String model = 'gpt-3.5-turbo'; // You can try different models

  Map<String, dynamic> body = {
    "model": model,
    "prompt": prompt,
    "max_tokens": maxTokens,
    "temperature": 0.7,
    "stop": ["\n"]
  };

  var response = await http.post(
    Uri.parse(endpoint),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    return data['choices'][0]['text'];
  } else {
    print(response.body); // Print the response body for debugging
    throw Exception('Failed to load chat response');
  }
}


  void sendMessage(String message) {
    setState(() {
      messages.add("You: $message");
    });

    getChatResponse(message).then((response) {
      setState(() {
        messages.add("AI: $response");
      });
    }).catchError((error) {
      print("Error: $error");
      setState(() {
        messages.add("AI: Error processing request.");
      });
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = _controller.text.trim();
                    if (message.isNotEmpty) {
                      sendMessage(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}