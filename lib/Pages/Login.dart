import 'package:cce/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _password, _email;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   success = false;
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if ((success == true)) {
      return HomeScreen();
    } else {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Login",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              //logout option widget
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Please enter something";
                          }
                        },
                        onSaved: (input) {
                          _email = input;
                        },
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            // return "Enter Password";
                          }
                        },
                        onSaved: (input) {
                          _password = input;
                        },
                        decoration: InputDecoration(labelText: "Password"),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(52),
                        child: RaisedButton(
                          //shape: ShapeBorder.,
                          color: Colors.orangeAccent,
                          splashColor: Colors.orange[200],
                          animationDuration: Duration(seconds: 2),
                          textColor: Colors.white,
                          onPressed: signIn,
                          child: Text("Sign In"),
                        ),
                      ),
                      RaisedButton(onPressed: () {
                        success = true;
                        setState(() {});
                      })
                    ],
                  )),
            ),
          ));
    }
  }

  void signIn() async {
    final formVal = _formkey.currentState;

    if (formVal.validate()) {}
    //login
    formVal.save();
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      ))
          .user;

      if (user != null) {
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
