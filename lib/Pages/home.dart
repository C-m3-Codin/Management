import 'package:cce/Pages/Register.dart';
import 'package:cce/Pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

String userColegeId = "";
// String Name=""
// String

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

    userColegeId = stringValue;
    print(" from getStri " + stringValue);
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawr(),
        appBar: deetsEntered
            ? AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
                title: Text('Welcome'),
              )
            : AppBar(
                title: Text("enter Details"),
              ),
        body: deetsEntered ? SubjectContent() : NoDetails(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("the value of bool is $deetsEntered\n\n\n");
            setState(() {});
          },
        ),
      ),
    );
  }
}

class Drawr extends StatelessWidget {
  const Drawr({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            accountName: Text("Annon "),
            accountEmail: Text(userId),
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
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log out"),
            onTap: () async {
              success = false;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('userId');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext ctx) => RegisterPage()));
              // logout
            },
          )
        ],
      ),
    );
  }
}

class NoDetails extends StatelessWidget {
  const NoDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Please Enter the details of the required Sem"),
          RaisedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          }),
          RaisedButton(
            onPressed: () async {
              success = false;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('userId');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext ctx) => RegisterPage()));
            },
            child: Text('Logout'),
          ),
        ],
      ),
    ));
  }
}

class SubjectContent extends StatefulWidget {
  @override
  _SubjectContentState createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Container(child: Icon(Icons.directions_transit)),
        // TODO notes
        Container(
          child: Text(name),
        ),
        // Announcemets
        // Assignments Due
        Container(child: Icon(Icons.directions_bike)),
      ],
    );
  }
}
