import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:log_in_theme/home.dart';
import 'package:log_in_theme/storage_utlies.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _key = GlobalKey<FormState>();

  TextEditingController nameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();
  bool secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          width: MediaQuery.of(context).size.width,
          child: Form(
              key: _key,
              child: Card(
                elevation: 25,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 55,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: nameClt,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Your Name',
                                contentPadding: EdgeInsets.only(left: 20)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Empty Feild';
                              }
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            controller: emailClt,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Your Email',
                                contentPadding: EdgeInsets.only(left: 20)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Empty Feild';
                              }
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey),
                          child: TextFormField(
                            obscureText: secureText,
                            controller: passwordClt,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                fillColor: Colors.black,
                                border: InputBorder.none,
                                hintText: 'Enter Your Password',
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      secureText = !secureText;
                                    });
                                  },
                                  child: Icon(
                                    secureText
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye,
                                    color: Colors.black,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.only(left: 20, top: 15)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Empty Feild';
                              }
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                _key.currentState!.save();
                                StorageUtiles.setLogindata(false);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Home()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: Text(
                              'Registration',
                              style: TextStyle(fontSize: 20),
                            )),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
