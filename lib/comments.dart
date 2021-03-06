import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:iosd/thread.dart';
import 'package:iosd/widgets/commentListt.dart';
//import 'package:iosd/widgets/heart2.dart';
import 'package:http/http.dart' as http;

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  List _selectIndex = [true, false, false, false];
  Future userFuture;
  String messageText = "";
    final _controller = TextEditingController();

  Future<http.Response> addComment(String message) {
    print("Message: $message");

    return http.post(
      'https://iosd1.herokuapp.com/comments',
      body: jsonEncode({'message': message}),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  ScrollController _scrollController;
  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (300 - kToolbarHeight);
  }

  @override
  void initState() {
    userFuture = fetchComments();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  fetchComments() async {
    http.Response response =
        await http.get('https://iosd1.herokuapp.com/comments');
    return jsonDecode(response.body);
    //  print("data : $data");
  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
              body: CustomScrollView(controller: _scrollController, slivers: <
                  Widget>[
            SliverAppBar(
              automaticallyImplyLeading : false,
              iconTheme: IconThemeData(
                color: isShrink
                    ? Colors.black
                    : Colors.white, //change your color here
              ),
              backgroundColor: Colors.white,
              pinned: true,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                title: !isShrink
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 6,
                            child: Container(),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text("Do you Overthink?",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontFamily: "Gilroy",
                                        fontSize: 20.0,
                                        color: isShrink
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center),
                          ),
                          Flexible(
                              flex: 1,
                              child: Text(
                                "Share your views/",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontFamily: "Gilroy",
                                        fontSize: 20.0,
                                        color: isShrink
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )),
                          Flexible(
                              flex: 1,
                              child: Text(
                                "expieriences",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontFamily: "Gilroy",
                                        fontSize: 20.0,
                                        color: isShrink
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              )),
                          Flexible(
                            flex: 1,
                            child: Container(),
                          )
                        ],
                      )
                    : Text("Do you Overthink?...",
                        style: TextStyle(color: Colors.black)),
                background: Image.asset("assets/images/custom - 2.jpg",
                    fit: BoxFit.cover),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(Icons.notifications_outlined,
                        color: !isShrink ? Colors.white : Colors.black),
                    onPressed: () {}),
              ],
            ),
            SliverFillRemaining(
                child: Column(children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                        height: 25.0,
                        width: 60.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _selectIndex[0] = true;
                              _selectIndex[1] = false;
                              _selectIndex[2] = false;
                              _selectIndex[3] = false;
                            });
                          },
                          child: Text("Top",
                              style: TextStyle(
                                  color: _selectIndex[0]
                                      ? Colors.white
                                      : Colors.black)),
                          color: _selectIndex[0] == false
                              ? Colors.white
                              : Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        )),
                    SizedBox(width: 16.0),
                    SizedBox(
                        height: 25.0,
                        width: 70.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _selectIndex[0] = false;
                              _selectIndex[1] = true;
                              _selectIndex[2] = false;
                              _selectIndex[3] = false;
                            });
                          },
                          child: Text("New",
                              style: TextStyle(
                                  color: _selectIndex[1]
                                      ? Colors.white
                                      : Colors.black)),
                          color: _selectIndex[1] == false
                              ? Colors.white
                              : Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        )),
                    SizedBox(width: 16.0),
                    SizedBox(
                        height: 25.0,
                        width: 60.0,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _selectIndex[0] = false;
                              _selectIndex[1] = false;
                              _selectIndex[2] = true;
                              _selectIndex[3] = false;
                            });
                          },
                          child: Text("My",
                              style: TextStyle(
                                  color: _selectIndex[2]
                                      ? Colors.white
                                      : Colors.black)),
                          color: _selectIndex[2] == false
                              ? Colors.white
                              : Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                        )),
                    SizedBox(width: 16.0),
                    Flexible(
                        //  height : 25.0,
                        // width : 100.0,
                        child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _selectIndex[0] = false;
                          _selectIndex[1] = false;
                          _selectIndex[2] = false;
                          _selectIndex[3] = true;
                        });
                      },
                      child: Text("Counsellor",
                          style: TextStyle(
                              color: _selectIndex[3]
                                  ? Colors.white
                                  : Colors.black)),
                      color:
                          _selectIndex[3] == false ? Colors.white : Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    )),
                    SizedBox(width: 16.0)
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.2,
              ),
             /* Expanded(
                  child: ListView.builder(
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
                          ]))),*/
              CommentList(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(0))),
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                       onTap: (){
                      //  setState(() {
                        //                        _scrollController.removeListener(_scrollListener);  
                       // }); 
                       },
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
                      
                       messageText = value;
              _scrollController.animateTo(324, duration: Duration(milliseconds: 100), curve: Curves.linear);

                          });
                        },
                      ),
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: Icon(
                        Icons.send,
                    color : messageText == "" ? Colors.grey[800] :  Colors.pink,
                      ),
                      onPressed: messageText == "" ? null :() async {   
                        addComment(messageText).then((value) {
                          setState(() {
                          _controller.text = "";
                   FocusScope.of(context).unfocus();
                        
                          });
                        });
                      }
                    )
                  ],
                ),
              ),
            ]))
          ]));
        }
     
        
  }

