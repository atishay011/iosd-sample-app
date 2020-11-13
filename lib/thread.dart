import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:iosd/widgets/replyList.dart';

class Thread extends StatefulWidget {
  final String id;
  Thread({this.id});
  @override
  _ThreadState createState() => _ThreadState();
}

final _controller = TextEditingController();

String replyText = "";
FocusNode _focusNode = FocusNode();

class _ThreadState extends State<Thread> {
  Future userFuture;
  fetchComment() async {
    print("id : ${widget.id}");
    http.Response response =
        await http.get('https://iosd1.herokuapp.com/comments/${widget.id}');
    return jsonDecode(response.body);
  }

  Future<http.Response> addReply(String message) {
    // print("Message: $message");

    return http.patch(
      'https://iosd1.herokuapp.com/comments/${widget.id}',
      body: jsonEncode({'reply': message}),
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
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
                  ReplyList(id: snapshot.data['_id']),
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
                            focusNode: _focusNode,
                            controller: _controller,
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
                            color: replyText == ""
                                ? Colors.grey[800]
                                : Colors.pink,
                          ),
                          onPressed: replyText == ""
                              ? null
                              : () async {
                                  addReply(_controller.text).then((value) {
                                    setState(() {
                                       _controller.text = "";
                                      FocusScope.of(context).unfocus();

                                      // userFuture = fetchComment();
                                    });
                                  });
                                },
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
