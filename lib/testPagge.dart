import 'package:flutter/cupertino.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Logged in"),
      ),
    );
  }
}
