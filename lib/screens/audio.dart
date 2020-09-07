import 'package:audioplayers/audio_cache.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyAudio extends StatefulWidget {
  @override
  _MyAudioState createState() => _MyAudioState();
}

class _MyAudioState extends State<MyAudio> {
  var authc = FirebaseAuth.instance;
  var audio = AudioCache();
  //AudioPlayer audio = AudioPlayer();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text("Welcome to the firebase App"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    print('hi');

                    audio.play('audio/note1.wav');
                  },
                  child: Text("Play"),
                ),
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
                        child: Text("MyProfile"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/profile");
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Material(
                    child: MaterialButton(
                        child: Text("CMD Prompt"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/command");
                        }),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
