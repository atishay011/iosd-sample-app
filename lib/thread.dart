import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iosd/widgets/heart.dart';
import 'package:iosd/widgets/heart2.dart';
import 'package:http/http.dart' as http;

class Thread extends StatefulWidget {
  final String id;
  Thread({this.id});
  @override
  _ThreadState createState() => _ThreadState();
}
      final _controller = TextEditingController();

String replyText = "";



class _ThreadState extends State<Thread> {
Future userFuture;
fetchComment()async {
  print("id : ${widget.id}");
  http.Response response = await http.get('https://iosd1.herokuapp.com/comments/${widget.id}');
         return jsonDecode(response.body);
}
Future<http.Response> addReply(String message) {
   // print("Message: $message");

    return http.patch(
      'https://iosd1.herokuapp.com/comments/${widget.id}',
      body: jsonEncode({
        'reply': message}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

@override
  void initState() {
                    super.initState();
                userFuture = fetchComment();        
              }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userFuture,
      builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
        return Scaffold(
       body : Center(child: CircularProgressIndicator(),
          )  
        );
      }
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text("Thread",
                  style: Theme.of(context).textTheme.button.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0)),
              iconTheme: new IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: [
                Expanded(
                  child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                            padding: EdgeInsets.only(top: 32, left: 32),
                            child: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: Colors.amberAccent,
                                child: Icon(Icons.account_circle,
                                    color: Colors.white))),
                        Padding(
                            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Text(
                              "${snapshot.data['message']}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ))),
                        Padding(
                            padding: EdgeInsets.all(32),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Heart(
                                    color: Colors.grey[400],
                                  ),
                                  Text("14d",
                                      style: Theme.of(context)
                                          .textTheme
                                          .button
                                          .copyWith(
                                              color: Colors.grey[600],
                                              fontSize: 12.0))
                                ])),
                        SizedBox(height: 8.0),
                        Divider(
                          color: Colors.grey[200],
                          thickness: 10.0,
                        ),
                        Expanded(
                  child: ListView.builder(
                    itemCount : snapshot.data['replies'].length,
                          shrinkWrap: true,
                          itemBuilder : (context , index) => 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Stack(children: [
                                Container(
                                    padding: EdgeInsets.only(
                                        top: 32, left: 16, right: 16, bottom: 10),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 16,
                                    ),
                                    color: Color(0xffEEEEEE),
                                    child: Text(
                                      "${snapshot.data['replies'][index]}",
                                        style: Theme.of(context).textTheme.bodyText1)),
                                Positioned(
                                    left: 10.0,
                                    top: 10.0,
                                    child: CircleAvatar(
                                        radius: 15.0,
                                        backgroundColor: Colors.amberAccent,
                                        child: Icon(Icons.account_circle,
                                            color: Colors.white))),
                                     Positioned(
                                    right: 0.0,
                                    bottom: -5.0,
                                    child: Heart2(color: Colors.grey[400], size : 25))           
                              ]),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0, left: 24.0),
                                  child: Row(
                                    children: [
                                      Text("14d",
                                          style: Theme.of(context)
                                              .textTheme
                                              .button
                                              .copyWith(
                                                  color: Colors.grey[600],
                                                  fontSize: 12.0)),
                                      SizedBox(width: 8.0),
                                      Icon(Icons.reply)
                                    ],
                                  ))
                            ]),
                          ),
                        ),                      
                      ])),
                
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  margin: EdgeInsets.only(top: 8),
                  padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                             controller : _controller,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Write your comment',
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (value) {
                            setState(() {
                              replyText = value;
                            });
                          },
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).primaryColor,
                        icon: Icon(
                          Icons.send,
                          color: replyText == "" ? Colors.grey[800] : Colors.pink,
                        ),
                        onPressed:  replyText == "" ? null : () async{
                              addReply(_controller.text).then((value) {
                          setState(() {
                            userFuture = fetchComment();
                          });
                        });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ));
      }
    );
  }
}
