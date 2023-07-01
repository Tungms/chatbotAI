import 'dart:ffi';
import 'dart:io';

import 'package:case2/chatbox/chatsample.dart';
import 'package:case2/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class Categories extends StatefulWidget {
  const Categories();
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  var listCates = [
    {
      "icon": "assets/images/categories/icon1.png",
      "title": "Email Writer",
      "id": "1"
    },
    {
      "icon": "assets/images/categories/icon2.png",
      "title": "Academic Writer",
      "id": "2"
    },
    {
      "icon": "assets/images/categories/icon3.png",
      "title": "Comedian",
      "id": "3"
    },
    {
      "icon" : "assets/images/categories/icon4.png",
      "title" : "Answer Interview",
      "id": "4"
    },
    {
      "icon" : "assets/images/categories/icon5.png",
      "title" : "English Translator",
      "id": "5"
    }
  ];

  @override
  Widget build(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            // Center(
            //   child: Text(
            //       'AI Chat',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20
            //       )
            //   ),
            // ),
            Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('User option clicked');
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(32)
                      ),
                      child: Center(
                        child: Text(
                          'User',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                      'AI Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      signOut();
                    },
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Center(
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24,),
            Text(
                '   AI Assistants',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
            ),
            GridView.count(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              children: <Widget>[
                for (var item in listCates)
                GestureDetector(
                  onTap: () {
                    print(item["title"]);
                    if (item["id"] == "1") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmailChat(title: "Email Chatbot", key: null)));
                    } else if (item["id"] == "2") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmailChat(title: "Academic Chatbot", key: null)));
                    } else if (item["id"] == "3") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmailChat(title: "Comedian Chatbot", key: null)));
                    } else if (item["id"] == "4") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmailChat(title: "Interview Chatbot", key: null)));
                    } else if (item["id"] == "5") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmailChat(title: "English Chatbot", key: null)));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 8,),
                        Image.asset(item['icon']!, width: 50,height: 50,),
                        Container(
                            padding: EdgeInsets.only(top: 8,left: 4, right: 4),
                            child: Text(
                              item['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future signOut() async {
    await EasyLoading.show();
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: '', key: null,)));
    EasyLoading.dismiss();
  }
}

