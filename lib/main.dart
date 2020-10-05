import 'package:cce/Pages/home.dart';
import 'package:cce/models/UserModels.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/Register.dart';

String userId;
bool success = false;
bool deetsEntered = false;
String name = "";
String id = "";
String sem = "S1";
String branch = "CSE";
// UserModel user;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('userId');
  id = prefs.getString('id');
  name = prefs.getString('name');
  sem = prefs.getString('sem');
  branch = prefs.getString("branch");
  print(email);
  userId = email;
  await Firebase.initializeApp();
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
