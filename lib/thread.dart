import 'package:flutter/material.dart';
import 'package:iosd/widgets/heart.dart';
import 'package:iosd/widgets/heart2.dart';

class Thread extends StatefulWidget {
  @override
  _ThreadState createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
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
                            "If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing. If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing.  Your mind keeps you sending multitude of alternate scenarios and you keep playing.",
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
                    Column(children: [
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
                                "If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing. If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing.If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing",
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
                    Column(children: [
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
                                "If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing. If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing.If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing",
                                style: TextStyle())),
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
                          padding: EdgeInsets.only(
                              top: 4.0, left: 24.0, bottom: 8.0),
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
                    ])
                  ])),
            ),
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
                      onChanged: (value) {},
                    ),
                  ),
                  IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: Icon(
                      Icons.send,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
