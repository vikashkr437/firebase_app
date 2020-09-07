import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyLogin extends StatelessWidget {
  var authc = FirebaseAuth.instance;
  String email;
  String password;
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
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Text("Log In"),
                onPressed: () async {
                  try {
                    var userSignin = await authc.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (userSignin.user.email != null)
                      Navigator.pushNamed(context, "/profile");
                    else
                      Toast.show("User does not exist", context);
                  } catch (e) {
                    Toast.show(e.toString(), context);
                    print(e);
                  }
                }),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
