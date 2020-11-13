import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iosd/widgets/heart2.dart';

class ReplyList extends StatefulWidget {
  final String id;
  ReplyList({this.id});
  @override
  _ReplyListState createState() => _ReplyListState();
}

class _ReplyListState extends State<ReplyList> {
  
  
  fetchComment()async {
 // print("id : ${widget.id}");
  http.Response response = await http.get('https://iosd1.herokuapp.com/comments/${widget.id}');
         return jsonDecode(response.body);
}

  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future : fetchComment(),  
      builder : (context , snapshot) 
      { 
        if(!snapshot.hasData){
        return Expanded(
       child : Container()
        );
      }
    
    
     return Expanded(
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
                                  Heart2(
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
                      ])
                
      
    );
      }
    );
  }
}
  
