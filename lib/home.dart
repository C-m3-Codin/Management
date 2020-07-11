import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Logged in")),
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(),
              decoration: BoxDecoration(color: Colors.amberAccent),
            ),
            ListTile(
              title: Text("item 1"),
              //trailing: CircleAvatar(),
              leading: Icon(Icons.account_balance),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Text("Logged In")],
      ),
    );
  }
}
