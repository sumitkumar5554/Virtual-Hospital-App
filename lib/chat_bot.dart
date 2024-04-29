import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ChatBot extends StatefulWidget{
  const ChatBot({super.key});


  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  ChatUser myself=ChatUser(id: '1',firstName: 'sourabh');
  ChatUser bot=ChatUser(id: '2',firstName: 'Chatbot');

  List<ChatMessage> allMessages=[];
  List<ChatUser> typing=[];

  final oururl='https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyD_GYd2yekgy2c-nDa0rLOfdCPev8HiYwM';

  final header={
    'Content-Type': 'application/json'
  };

  getdata(ChatMessage m) async{
    typing.add(bot);
    allMessages.insert(0, m);
    setState((){
    });

    var data={"contents":[{"parts":[{"text":m.text}]}]};

    await http.post(Uri.parse(oururl),headers:header,body: jsonEncode(data))
        .then((value){
      if (value.statusCode==200){
        var result =jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 =ChatMessage(
            text:result['candidates'][0]['content']['parts'][0]['text'] ,
            user:bot ,
            createdAt: DateTime.now());
        allMessages.insert(0, m1);

      }else{
        print("error occured");
      }
    })
        .catchError((e){});

    typing.remove(bot);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatBot",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: DashChat(
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m){
            getdata(m);
          },
          messages: allMessages),
    );
  }
}
//chatbot code...

// in this chatbot we using Gemini chatbot for the chatbot this is a Google gemini bot