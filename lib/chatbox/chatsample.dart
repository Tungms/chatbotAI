import 'dart:async';

import 'package:case2/categories.dart';
import 'package:case2/services/api_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Message {
  final String sender;
  final String text;
  Message({required this.sender, required this.text});
}

class EmailChat extends StatefulWidget {
  const EmailChat({super.key, required this.title});
  final String title;

  @override
  State<EmailChat> createState() => _EmailChatState(title);
}

class _EmailChatState extends State<EmailChat> {
  List<Message> _messages = [
    Message(sender: 'Timi', text: 'Hello, how can i help you ?')
  ];

  String title;
  _EmailChatState(this.title);
  final textcontroller = TextEditingController();
  final scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        color: Colors.black87,
        child: Column(
          children: [
            SizedBox(height: 32),
            Container(
              // color: Colors.red,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    },
                    child: Container(
                      child: Image.asset(
                        'assets/images/chatboxicon/back-button.png',
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    // '${widget.title}',
                    '${title}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                  )
                ],
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              //listview
              flex: 6,
              // child: Container(
              //   padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              //   width: 600,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.only(topLeft: Radius.circular(32))
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: [
              //           Expanded(
              //             flex: 4,
              //             child: Container(
              //               padding: EdgeInsets.all(8),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(16),
              //                 color: Colors.grey
              //               ),
              //               child: Text(
              //                 'How can i help you? How can i help you? How can i help you? How can i help you? How can i help you? How can i help you? How can i help you?  How can i help you? How can i help you? How can i help you? How can i help you? How can i help you? How can i help you? ',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   color: Colors.white
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             child: Column(
              //               children: [
              //                 Text('10:10pm')
              //               ],
              //             )
              //           )
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.end,
              //         children: [],
              //       )
              //     ],
              //   ),
              // ),
              child: Container(
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32))),
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      controller: scrollcontroller,
                      reverse: false,
                      physics: BouncingScrollPhysics(), //note
                      itemCount: _messages.length,
                      itemBuilder: (context, index) {
                        final message = _messages[index];
                        return Card(
                          elevation: 5,
                          color: message.sender == 'Me'
                              ? Colors.lightBlueAccent
                              : Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: message.sender == 'Me'
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(message.sender, style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Text(message.text)
                              ],
                            ),
                          ),
                        );
                  }),
              ),
            ), //Chat Box
            SizedBox(height: 8),
            Expanded(
                child: TextFormField(
                  controller: textcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Please ask me something!',
                      hintStyle: TextStyle(color: Colors.white60),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: () async {
                          setState(() {
                            _messages.add(Message(sender: 'Me', text: textcontroller.text));
                            Timer(Duration(milliseconds: 500), () {
                              scrollcontroller.animateTo(
                                  scrollcontroller.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 50),
                                  curve: Curves.fastOutSlowIn
                              );
                            },);
                          });
                          var input = textcontroller.text;
                          textcontroller.clear();
                          await generateResponse(input).then((value) {
                            setState(() {
                              _messages.add(Message(sender: 'Timi', text: value));
                            });
                          });
                          Timer(Duration(milliseconds: 500), () {
                            scrollcontroller.animateTo(
                                scrollcontroller.position.maxScrollExtent,
                                duration: Duration(milliseconds: 50),
                                curve: Curves.fastOutSlowIn
                            );
                          },);
                        },
                      )),
                  style: TextStyle(color: Colors.white),
                )), //TextFormField - Send button
            SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}
