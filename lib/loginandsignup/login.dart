
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mock/loginandsignup/signup.dart';

import '../home/callEmployii.dart';




class loginn extends StatefulWidget {

  loginn({super.key});

  @override
  State<loginn> createState() => _loginnState();
}

class _loginnState extends State<loginn> {
  final emailcontro = TextEditingController();

  final passcontro = TextEditingController();

  bool isPasswordVisible = false;

  sign(
      {required String email,
        required String password,
        required BuildContext context}) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        String userid = userCredential.user!.uid;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
              return callApi();
            }));
      }
    } on FirebaseAuthException catch (logerror) {
      print("+++++${logerror}");
      if (logerror.code == "invalid-email") {
        return Fluttertoast.showToast(
            msg: "The email address is badly formatted.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      if (logerror.code == "INVALID_LOGIN_CREDENTIALS") {
        return Fluttertoast.showToast(
            msg: "Please check your email address or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [


                      const SizedBox(
                        height:250
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontro,

                          decoration: const InputDecoration(
                              labelText: "  email address",
                              labelStyle: TextStyle(color: CupertinoColors.black),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 65,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passcontro,
                          obscureText: !isPasswordVisible,
                          decoration:  InputDecoration(
                              suffixIcon: IconButton(icon:  Icon(isPasswordVisible? Icons.visibility:Icons.visibility_off),onPressed: () {
                                setState(() {
                                  isPasswordVisible=!isPasswordVisible;
                                });
                              },),
                              labelText: "  password",
                              labelStyle: TextStyle(color: CupertinoColors.black),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                        child: Center(
                          child: TextButton(
                              onPressed: () {
                                sign(
                                    context: context,
                                    email: emailcontro.text,
                                    password: passcontro.text);
                              },
                              child: const Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      const SizedBox(
                        height: 150,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return loginn();
                          }));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade900),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return signup();
                                  },
                                ));
                                signup();
                              },
                              child: Text(
                                "create new account",
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}