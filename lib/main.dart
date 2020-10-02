import 'package:cce/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/Register.dart';

String userId;
bool success = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('userId');
  print(email);
  userId = email;
  runApp(MaterialApp(home: email == null ? RegisterPage() : HomeScreen()));
}

//TODO check and remove redirection to container from here if possible
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CCE',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: success ? HomeScreen() : RegisterPage(),
    );
  }
}
