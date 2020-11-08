import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iosd/comments.dart';
import 'package:iosd/thread.dart';
import 'package:iosd/topics.dart';
void main() {
   SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );
  runApp(
    
    MaterialApp(
       theme: ThemeData(
      fontFamily: 'Gilroy',
      ),
      initialRoute: '/topics',
      routes: {
        '/topics' : (context){return Topics();},
        '/thread' : (context){return Thread();},
        '/comments' : (context){return Comments();},
      },
    ),
  );
}
