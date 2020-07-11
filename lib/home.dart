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
          child: DrawList(),
        ),
        body: ListView.builder(
          itemBuilder: null,
          //TO Do add add elements from firebase
        ));
  }
}

class DrawList extends StatelessWidget {
  const DrawList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
