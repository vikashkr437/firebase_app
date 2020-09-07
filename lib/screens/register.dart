import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

class Register extends StatelessWidget {
  var authc = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () async {
                try {
                  var user = await authc.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                  if (user.additionalUserInfo.isNewUser == true) {
                    Navigator.pushNamed(context, "/profile");
                  } else {
                    Toast.show("User Already exist", context, duration: 2);
                  }
                } catch (e) {
                  Toast.show(e.toString(), context, duration: 2);
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
