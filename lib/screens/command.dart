import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class MyCommand extends StatefulWidget {
  @override
  _MyCommandState createState() => _MyCommandState();
}

class _MyCommandState extends State<MyCommand> {
  String cmd;
  var webdata = "output will be here";
  var data;
  var authc = FirebaseAuth.instance;

  myweb() async {
    var url = "http://192.168.43.153//cgi-bin/cmd.py?x=${cmd}";
    var res = await http.get(url);
    setState(() {
      data = jsonDecode(res.body);
      webdata = data['output'];
    });
  }

  printOutput() {
    try {
      return Text(webdata);
    } catch (e) {
      print(e);
    }
  }

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
                Toast.show("signing off", context);
                await authc.signOut();
                Navigator.pushNamed(context, "/login");
              }),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          children: [
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                cmd = value;
              },
              decoration: InputDecoration(
                hintText: "Enter Command",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: myweb,
              child: Text("Submit"),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.80,
              color: Colors.transparent,
              child: printOutput(),
            ),
            SizedBox(height: 10),
            Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    child: MaterialButton(
                        child: Text("MyProfile"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/profile");
                        }),
                  ),
                  SizedBox(width: 10),
                  Material(
                    child: MaterialButton(
                        child: Text("Audio"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/audio");
                        }),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
