import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

String sem = 'S1';
String branch = 'CSE';
// String dropdownValue = 'One';

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Profile"),
        // ),
// =============================

        body: Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.redAccent, Colors.pinkAccent])),
                child: Container(
                  width: double.infinity,
                  height: 350.0,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                          ),
                          radius: 50.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Alice James",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Semester",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      DropdownButton<String>(
                                        value: sem,
                                        icon: Icon(Icons.arrow_downward),
                                        iconSize: 24,
                                        elevation: 16,
                                        style:
                                            TextStyle(color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            sem = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'S1',
                                          'S2',
                                          'S3',
                                          'S4',
                                          'S5',
                                          'S6',
                                          'S7'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),

// =====================================

                                      // Text(
                                      //   "Posts",
                                      //   style: TextStyle(
                                      //     color: Colors.redAccent,
                                      //     fontSize: 22.0,
                                      //     fontWeight: FontWeight.bold,
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 5.0,
                                      // ),
                                      // Text(
                                      //   "5200",
                                      //   style: TextStyle(
                                      //     fontSize: 20.0,
                                      //     color: Colors.pinkAccent,
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Branch",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      DropdownButton<String>(
                                        value: branch,
                                        icon: Icon(Icons.arrow_downward),
                                        iconSize: 24,
                                        elevation: 16,
                                        style:
                                            TextStyle(color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            branch = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'CE',
                                          'CSE',
                                          'EC',
                                          'EEE',
                                          'ME'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        // onChanged: null
                                      )
                                    ],
                                  ),
                                ),
                                // Expanded(
                                //   child: Column(
                                //     children: <Widget>[
                                //       Text(
                                //         "Follow",
                                //         style: TextStyle(
                                //           color: Colors.redAccent,
                                //           fontSize: 22.0,
                                //           fontWeight: FontWeight.bold,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         height: 5.0,
                                //       ),
                                //       Text(
                                //         "1300",
                                //         style: TextStyle(
                                //           fontSize: 20.0,
                                //           color: Colors.pinkAccent,
                                //         ),
                                //       )
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Enter id'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Enter Name'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("tadaaa"),
              ],
            ),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(
            //         vertical: 30.0, horizontal: 16.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text(
            //           "Bio:",
            //           style: TextStyle(
            //               color: Colors.redAccent,
            //               fontStyle: FontStyle.normal,
            //               fontSize: 28.0),
            //         ),
            //         SizedBox(
            //           height: 10.0,
            //         ),
            //         Text(
            //           'My name is Alice and I am  a freelance mobile app developper.\n'
            //           'if you need any mobile app for your company then contact me for more informations',
            //           style: TextStyle(
            //             fontSize: 22.0,
            //             fontStyle: FontStyle.italic,
            //             fontWeight: FontWeight.w300,
            //             color: Colors.black,
            //             letterSpacing: 2.0,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 300.00,
              child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  elevation: 0.0,
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [Colors.redAccent, Colors.pinkAccent]),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Update Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  )),
            ),
          ],
        ),

// ==============================
      ),
    );
  }
}
