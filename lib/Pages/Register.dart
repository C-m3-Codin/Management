import 'package:cce/Pages/Login.dart';
import 'package:cce/Pages/home.dart';
import 'package:cce/Theme/COLORS.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _password, _email;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   success = false;
  // }
  addStringToSF(String eml) async {
    print("in before shared");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', eml);
    print("in after shared");
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if ((success == true)) {
      return HomeScreen();
      // return Container(
      // child: Text("Logged in"),
      // );
    } else {
      return Scaffold(
        backgroundColor: COLORS.colorBackground,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome to",
                          style: TextStyle(
                              color: COLORS.colorPrimary,
                              fontSize: 45,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "CCE Notes",
                          style: TextStyle(
                              color: COLORS.colorPrimaryDark,
                              fontSize: 50,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      //Email Field

                      TextFormField(
                        validator: (val) => val.isEmpty || !(val.contains('@'))
                            ? _email = "BackDoor@Login.com"
                            : null,
                        onSaved: (input) {
                          _email = input;
                        },
                        style: TextStyle(color: Colors.white),
                        cursorColor: COLORS.colorAccent,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: COLORS.colorPrimaryDark,
                          ),
                          labelText: "Email",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 1, color: COLORS.colorAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1, color: COLORS.colorPrimaryDark),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      //Password Field

                      TextFormField(
                        validator: (input) => input.isEmpty || input.length < 6
                            ? _password = "BackDoor@Login.com"
                            : 'Successful',
                        onSaved: (input) {
                          _password = input;
                        },

                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        cursorColor: COLORS.colorAccent,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: COLORS.colorPrimaryDark,
                          ),
                          labelText: "Password",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 1, color: COLORS.colorAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 1, color: COLORS.colorPrimaryDark),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () async {
                             signIn();
                          },
                          color: COLORS.colorPrimaryDark,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Text("Sign up"),
                          ),
                        ),
                      ),
                      FlatButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Already registered ? Login Here",
                            style: TextStyle(color: COLORS.colorPrimaryDark),
                          )),
                    ],
                  ),
                )),
          ),
        ),
      );
    }
  }

  void signIn() async {
    final formVal = _formkey.currentState;

    if (formVal.validate()) {}
    //login
    formVal.save();
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: "BackDoor@Login.com",
        password: "BackDoor@Login.com",
      ))
          .user;

      if (user != null) {
        print("before shared");
        await addStringToSF(user.email.toString());
        print("after shared");
        setState(() {
          success = true;
          _email = user.email;
          print(user.email);
        });
      } else {
        setState(() {
          success = false;
        });
      }

      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      print("\n\n\n\nthis shit ran\n\n\n\n");
      print(user.toString());
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      print("\n\n\n\the fuck is it still here\n\n\n\n");
    } catch (e) {
      print(e.message);
    }
  }
}
