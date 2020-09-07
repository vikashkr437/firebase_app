import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase App"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.yellow,
        // ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Register"),
              onPressed: () => Navigator.pushNamed(context, "/register"),
            ),
            RaisedButton(
              child: Text("Log In"),
              onPressed: () => Navigator.pushNamed(context, "/login"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
