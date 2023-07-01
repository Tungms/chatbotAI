import 'package:case2/categories.dart';
import 'package:case2/chatbox/chatsample.dart';
import 'package:case2/chatbox/example.dart';
import 'package:case2/eg.dart';
import 'package:case2/home.dart';
import 'package:case2/modal/splashscreen.dart';
import 'package:case2/signup.dart';
import 'package:case2/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: Container(
//       //     decoration: BoxDecoration(
//       //       gradient: LinearGradient(
//       //         begin: Alignment.topCenter,
//       //         end: Alignment.bottomCenter,
//       //         colors: [
//       //           Color(0xffBDFFF3),
//       //           Color(0xff4AC29A),
//       //         ],
//       //       )
//       //     ),
//       //     child: Padding(
//       //         padding: EdgeInsets.all(16),
//       //         child: Column(
//       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //           children: [
//       //             Container(height: 50,),
//       //             Column(children: [
//       //               FlutterLogo(
//       //                 size: 100
//       //               ),
//       //               SizedBox(
//       //                 height: 16,
//       //               ),
//       //               Text(
//       //                   'PixelPro Digital',
//       //                 style: TextStyle(
//       //                   fontSize: 30,
//       //                   color: Colors.white
//       //                 ),
//       //               ),
//       //               SizedBox(height: 32),
//       //               TextButton(
//       //                 onPressed: () {
//       //                   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: '', key: null)));
//       //                 },
//       //                 style: TextButton.styleFrom(
//       //                   padding: EdgeInsets.zero,
//       //                   elevation: 0
//       //                 ),
//       //                 child: Container(
//       //                     // margin: EdgeInsets.only(top: 32),
//       //                     height: 50,
//       //                     decoration: BoxDecoration(
//       //                         color: Colors.white,
//       //                         borderRadius: BorderRadius.circular(16)
//       //                     ),
//       //                     child:
//       //                     Center(child: Text(
//       //                       'Login',
//       //                       style: TextStyle(
//       //                           fontSize: 20,
//       //                           color: Colors.black,
//       //                           fontWeight: FontWeight.bold
//       //                       ),
//       //                     ),)
//       //
//       //                 ),
//       //
//       //               ),
//       //               SizedBox(height: 16),
//       //               GestureDetector(
//       //                 onTap: () {
//       //                   Navigator.push(
//       //                       context,
//       //                       MaterialPageRoute(builder: (context) => SignupPage(key: null, title: ''))
//       //                   );
//       //                 },
//       //                 child: Container(
//       //                   height: 50,
//       //                   decoration: BoxDecoration(
//       //                       // color: Colors.black,
//       //                       borderRadius: BorderRadius.circular(16),
//       //                       border: Border.all(width: 2, color: Colors.white)
//       //                   ),
//       //                   child:
//       //                   Center(child: Text(
//       //                     'Sign up',
//       //                     style: TextStyle(
//       //                         fontSize: 20,
//       //                         color: Colors.white,
//       //                         fontWeight: FontWeight.bold
//       //                     ),
//       //                   )),
//       //                 ),
//       //               )
//       //             ]),
//       //             GestureDetector(
//       //               onTap: () {
//       //                 print('Login as guess');
//       //               },
//       //               child: Padding(child: Center(child: Text(
//       //                 'Continue as guest',
//       //                 style: TextStyle(
//       //                     color: Colors.white,
//       //                     fontSize: 20
//       //                 ),
//       //               )), padding: EdgeInsets.all(20),)
//       //             )
//       //           ],
//       //         ),
//       //     ),
//       // ),
//       resizeToAvoidBottomInset: false,
//       body:
//     );
//   }
//
// }
