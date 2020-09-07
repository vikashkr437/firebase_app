import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var authc = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase App"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                print("sign off");
                await authc.signOut();
                Navigator.pushNamed(context, "/login");
              }),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("this is your profile"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: MaterialButton(
                      child: Text("CMD Prompt"),
                      minWidth: MediaQuery.of(context).size.width * 0.48,
                      onPressed: () {
                        Navigator.pushNamed(context, "/command");
                      }),
                ),
                SizedBox(
                  width: 10,
                ),
                Material(
                  child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.48,
                      child: Text("Audio"),
                      onPressed: () {
                        Navigator.pushNamed(context, "/audio");
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
