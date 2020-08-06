import 'package:cce/Pages/home.dart';
import 'package:cce/testPagge.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Pages/Login.dart';

bool success = false;
void main() {
  runApp(MyApp());
}

//TODO check and remove redirection to container from here if possible
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CCE',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: success
          ? Container(
              child: Text("from main page"),
            )
          : LoginPage(),
    );
  }
}
