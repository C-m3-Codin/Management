import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class UserModel {
  String name;
  String sem;
  String id;
  String branch;
  String email;
  // userModel({this.name})

  UserModel({this.sem, this.name, this.id, this.branch, this.email});

  // uploadDeets() async {
  //   //  upload user details
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   CollectionReference users = FirebaseFirestore.instance.collection('Students');
  // }

  Future<void> uploadDeets() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference users =
        FirebaseFirestore.instance.collection('Students');
    return users.doc(id).set({
      'full_name': name,
      'branch': branch,
      'sem': sem,
      'email': email,
      'id': id
    }).then((value) async {
      print("\n\n\n\n\n\nUser Added\n\n\n\n");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('name', name);
      prefs.setString('sem', sem);
      prefs.setString('branch', branch);
      prefs.setString('id', id);
    }).catchError((error) => print("Failed to add user: $error"));
  }
}
