import 'package:flutter/material.dart';
import 'package:iosd/widgets/heart.dart';
import 'package:iosd/widgets/heart2.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  List _selectIndex = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Hero(
                    child: Image.asset("assets/images/custom - 2.jpg"),
                    tag: "img"),
                Center(
                    child: Column(children: [
                  Text("Do you Overthink?",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontFamily: "Gilroy",
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  Text("Share your views/",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontFamily: "Gilroy",
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                  Text("expierience",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontFamily: "Gilroy",
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ])),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: IconButton(
                      icon: Icon(Icons.notifications_outlined,
                          color: Colors.white),
                      onPressed: () {}),
                ),
                Positioned(bottom: 40, child: Heart(color: Colors.white))
              ],
            ),
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
                            color:
                                _selectIndex[3] ? Colors.white : Colors.black)),
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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                Column(
                  children : [
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
                              top: 8.0, left: 24.0, bottom: 8.0 , right : 24),
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
                                 Spacer(),
                               GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/thread' ,);},
            child: Text("View all replies",
             style : Theme.of(context).textTheme.bodyText1.copyWith( color : Colors.pink ,)             
            ),
            )
                            ],
                          ))
                  ]),
                  Column(
                children : [
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
                              top: 8.0, left: 24.0, bottom: 8.0 , right : 24.0),
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
                              Spacer(),
                               GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/thread' ,);},
            child: Text("View all replies",
             style : Theme.of(context).textTheme.bodyText1.copyWith( color : Colors.pink ,)             
            ),
            )
                            ],
                          ),
                          
                          )
                ]
                  )
                ],
              
                
              )
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
        ),
      ),
    );
  }
}
