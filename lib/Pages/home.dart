import 'package:cce/Pages/Login.dart';
import 'package:cce/Pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Null> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('userId');
    print("from getStri" + stringValue);
    String us = prefs.getString('userId');
    // return stringValue;
    setState(() {
      userId = us;
    });
  }

  @override
  Future<void> initState() {
    // TODO: implement initState
    userId = "Fetching..";
    getStringValuesSF();

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                onDetailsPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                accountName: Text("Annon Here"),
                accountEmail: Text("Annon@gotYou.com"),
                currentAccountPicture: CircleAvatar(
                  // backgroundColor:
                  //     Theme.of(context).platform == TargetPlatform.iOS
                  //         ? Colors.blue
                  //         : Colors.white,

                  backgroundImage: NetworkImage(
                    "https://images5.alphacoders.com/423/thumb-1920-423529.jpg",
                  ),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(userId),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Logged in"),
          actions: [
            IconButton(icon: Icon(Icons.notifications), onPressed: null)
          ],
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("from login now Home stateless from sub directory"),
            RaisedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            }),
            RaisedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('userId');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext ctx) => LoginPage()));
              },
              child: Text('Logout'),
            ),
          ],
        )));
  }
}
