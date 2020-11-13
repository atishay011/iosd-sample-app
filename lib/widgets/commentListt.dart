import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iosd/thread.dart';
import 'package:iosd/widgets/heart2.dart';


class CommentList extends StatefulWidget {
  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {

fetchComments() async {
    http.Response response =
        await http.get('https://iosd1.herokuapp.com/comments');
    return jsonDecode(response.body);
    //  print("data : $data");
  }
  Future userFuture;
void initState(){
  super.initState();
  userFuture = fetchComments();
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future : fetchComments(),  
      builder : (context , snapshot) 
      { 
        if(!snapshot.hasData){
        return Expanded(
       child : Container()
        );
      }
      return Expanded(
                  child: ListView.builder(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) => Column(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                            top: 32,
                                            left: 16,
                                            right: 16,
                                            bottom: 10),
                                        margin: EdgeInsets.only(
                                          top: 12,
                                          bottom: 0,
                                          left: 32,
                                          right: 32,
                                        ),
                                        color: Color(0xffEEEEEE),
                                        child: Text(
                                            snapshot.data[index]['message'],
                                            style: TextStyle())),
                                    Positioned(
                                        left: 2.0,
                                        top: 10.0,
                                        child: CircleAvatar(
                                            radius: 15.0,
                                            backgroundColor: Colors.amberAccent,
                                            child: Icon(Icons.account_circle,
                                                color: Colors.white))),
                                    Positioned(
                                        right: 15.0,
                                        bottom: -15.0,
                                        child: Heart2(
                                            color: Colors.grey[100], size: 20))
                                  ]),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 0.0,
                                        left: 48.0,
                                        bottom: 8.0,
                                        right: 24),
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
                                        Icon(Icons.reply),
                                      ],
                                    ),
                                  ),
                                  snapshot.data[index]['replies'].length != 0
                                      ? Center(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 8.0, 8.0, 0.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Thread(
                                                            id: snapshot
                                                                    .data[index]
                                                                ['_id']),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                  "View all replies (${snapshot.data[index]['replies'].length} )",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      .copyWith(
                                                        color: Colors.pink,
                                                      )),
                                            ),
                                          ),
                                        )
                                      : Container(height: 0)
                                ]),
                            snapshot.data[index]['replies'].length != 0
                                ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Stack(children: [
                                        Container(
                                            padding: EdgeInsets.only(
                                                top: 32,
                                                left: 16,
                                                right: 16,
                                                bottom: 10),
                                            margin: EdgeInsets.only(
                                              top: 12,
                                              bottom: 0,
                                              left: 48,
                                              right: 16,
                                            ),
                                            color: Color(0xffEEEEEE),
                                            child: Text(
                                                snapshot.data[index]['replies']
                                                    [0],
                                                style: TextStyle())),
                                        Positioned(
                                            left: 30.0,
                                            top: 10.0,
                                            child: CircleAvatar(
                                                radius: 15.0,
                                                backgroundColor:
                                                    Colors.amberAccent,
                                                child: Icon(
                                                    Icons.account_circle,
                                                    color: Colors.white))),
                                        Positioned(
                                            right: 0.0,
                                            bottom: -15.0,
                                            child: Heart2(
                                                color: Colors.grey[100],
                                                size: 20))
                                      ]),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 0.0, bottom: 8.0, right: 24),
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Text("14d",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    .copyWith(
                                                        color: Colors.grey[600],
                                                        fontSize: 12.0)),
                                            SizedBox(width: 8.0),
                                            Icon(Icons.reply),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 0.0, bottom: 8.0, right: 24),
                                        child: Row(
                                          children: [
                                            Spacer(flex: 3),
                                            Expanded(
                                              child: TextFormField(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Thread(
                                                              id: snapshot.data[
                                                                      index]
                                                                  ['_id']),
                                                    ),
                                                  );
                                                },
                                                decoration: InputDecoration(
                                                  hintText: 'Write a reply',
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[800]),
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(height: 0),
                          ])));
      }  
    );

}
}