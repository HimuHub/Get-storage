import 'package:flutter/material.dart';
import 'package:log_in_theme/login_page.dart';
import 'package:log_in_theme/storage_utlies.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 2.0,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Container(
          color: Colors.grey,
          child: TextButton(
              onPressed: () {
                StorageUtiles.setLogindata(true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text(
                "Log out",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
        ),
      ),
    );
  }
}
