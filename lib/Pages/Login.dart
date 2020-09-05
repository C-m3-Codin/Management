import 'package:cce/Theme/COLORS.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _password, _email;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        "Hello there",
                        style: TextStyle(
                            color: COLORS.colorPrimary,
                            fontSize: 55,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: COLORS.colorPrimaryDark,
                            fontSize: 42,
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
                          ? 'Enter a valid email address'
                          : null,
                      onSaved: (input){
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
                      validator: (val) => val.isEmpty || val.length < 6
                          ? 'Enter a password greater than 6 characters'
                          : null,
                      onSaved: (input){
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
                 //         loginIn();
                        },
                        color: COLORS.colorPrimaryDark,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Text("Sign In"),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
