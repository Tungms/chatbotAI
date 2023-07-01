import 'dart:ffi';

import 'package:case2/home.dart';
import 'package:case2/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});

  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailAddressTextEditingController = new TextEditingController();
  TextEditingController passwordTextEdittingController = new TextEditingController();
  TextEditingController confirmPasswordTextEdittingController = new TextEditingController();

  @override
  void dispose() {
    emailAddressTextEditingController.dispose();
    passwordTextEdittingController.dispose();
    confirmPasswordTextEdittingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffBDFFF3),
                Color(0xff4AC29A),
              ],
            )
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.red,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Create Account',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            'to get started now!',
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val){
                              return
                                val!.isEmpty || val!.length < 4 ? "Vui lòng điền Email" : null;
                            },
                            controller: emailAddressTextEditingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                                labelText: 'Email Address',
                                labelStyle: TextStyle(color: Colors.white)
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            validator: (val){
                              return
                                val!.length > 6 ? null : "Vui lòng nhập Password từ 6 chữ số trở lên";
                            },
                            obscureText: true,
                            controller: passwordTextEdittingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                                labelText: 'Password'
                            ),
                          ),
                          SizedBox(height: 8),
                          TextFormField(
                            obscureText: true,
                            controller: confirmPasswordTextEdittingController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                                labelText: 'Confirm Password'
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 32,),
                    GestureDetector(
                      onTap: () {
                        SignUp();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: 64,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '-------------------------',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              'Or Sign Up with',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                            Text(
                              '-------------------------',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('Login with Google pressed');
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Center(
                                  child: Image.asset('assets/images/google.png', width: 32, height: 32),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Login with Facebook pressed');
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                child: Center(
                                  child: Image.asset('assets/images/facebook.png', width: 32, height: 32),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    // SizedBox(height: 16)
                  ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: '', key: null)));
                    },
                    child: const Text(
                      'Login Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  // SizedBox(height: 64)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future SignUp() async {
    EasyLoading.show();

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddressTextEditingController.text.trim(),
          password: 'password'
      );
      var userCheck = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddressTextEditingController.text.trim(),
          password: 'password'
      );
      if (userCheck.user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: '', key: null,)));
      } else (e) {
        print(e.toString());
      };
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }

    EasyLoading.dismiss();
  }
}