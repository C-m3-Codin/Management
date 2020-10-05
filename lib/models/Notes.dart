import 'package:cloud_firestore/cloud_firestore.dart';

class NotePage {
  List<Subject> subjectNames;
  String sem;
  String branch;

  NotePage({this.branch, this.sem});

  DocumentSnapshot snapshot;

  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection(branch + sem)
        .doc('subject names')
        .get(); //get the data
    snapshot = data;
  }
}

class Subject {
  List<Modules> moduleNames;
}

class Modules {
  List fileNameUrl;
}
