import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:second_firebase_app/screens/audio.dart';
import 'package:second_firebase_app/screens/command.dart';
import 'package:second_firebase_app/screens/login.dart';
import 'package:second_firebase_app/screens/profile.dart';

import 'screens/myhome.dart';
import 'screens/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MyHome(),
        "/login": (context) => MyLogin(),
        "/register": (context) => Register(),
        "/audio": (context) => MyAudio(),
        "/profile": (context) => MyProfile(),
        "/command": (context) => MyCommand(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
