import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iosd/widgets/heart.dart';

class Topics extends StatefulWidget {
  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  

Widget comment(){
  return Row(
    children: [
       IconButton(
          icon: Icon(
            Icons.comment_outlined,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/comments' ,);
          },
        ),
        Text("5",
      style : Theme.of(context).textTheme.button.copyWith(color : Colors.grey[800] , fontSize: 16.0)             
        )
    ],
    );
}
 Widget menu() {
return Container(
  color: Colors.white,
  child: TabBar(
    labelColor: Colors.pink,
    unselectedLabelColor: Colors.grey[800],
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.all(5.0),
    indicatorColor: Colors.pink,
    tabs: [
      Tab(
        text: "Anonymous Community",
        icon: Icon(Icons.group),
      ),
      Tab(
        text: "Counsellor Support",
        icon: Icon(Icons.medical_services),
      ),
     
    ],
  ),
);
 }

  @override
  Widget build(BuildContext context) {
    return 
     DefaultTabController(
          length: 2,
          child:  Scaffold(
        drawer: Drawer(
        ),
      
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "TalkItOut",
          style : Theme.of(context).textTheme.button.copyWith(fontWeight : FontWeight.bold , color : Colors.black , fontSize: 20.0)
          ),
        iconTheme: new IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline_rounded), onPressed: (){}
              ),
            IconButton(
              icon: Icon(Icons.notifications_outlined), onPressed: (){}
              )
          ],
          ),
body : Column(
  children: [
          Expanded(
                    child: ListView.builder(
      
      //itemCount : 400,
      
      itemBuilder: (context , index) =>
      
        Flexible( 
      
         child :Column(
      
               crossAxisAlignment: CrossAxisAlignment.start,
      
               children: [
      
               Padding(
      
                padding: EdgeInsets.all(16.0),
      
                child : Text("Trending",
      
        style : Theme.of(context).textTheme.button.copyWith(fontWeight : FontWeight.bold , color : Colors.pink , fontSize: 22.0)        
      
                )
      
              ),
      
              Stack(
      
                alignment: Alignment.center,
      
                children: [  
      
                
      
              
      
                 Image.asset("assets/images/custom - 2.jpg"),  
      
              
      
                   
      
              Center(
      
              child :  Column( 
      
                  children : [
      
                     Text(
      
                      "Do you Overthink?",
      
                  style : Theme.of(context).textTheme.headline5.copyWith(fontFamily: "Gilroy", color : Colors.white , fontWeight: FontWeight.w500)             
      
                    ),
      
                       Text(
      
                      "Share your views/",
      
                  style : Theme.of(context).textTheme.headline5.copyWith(fontFamily: "Gilroy", color : Colors.white , fontWeight: FontWeight.w500)             
      
                    ),
      
                      Text(
      
                      "expierience",
      
                  style : Theme.of(context).textTheme.headline5.copyWith(fontFamily: "Gilroy", color : Colors.white , fontWeight: FontWeight.w500)             
      
                    )
      
                  ]
      
                )
      
              ),
      
                ],
      
              ),
      
              Padding(
      
              padding : EdgeInsets.all(16.0),
      
             child : Row(
      
                mainAxisAlignment : MainAxisAlignment.spaceAround,
      
                children : [
      
                  Heart(color: Colors.grey[400],),
      
                 comment()
      
                ]
      
              ),  
      
              ),
      
              Stack(
      
            children : [
      
              Container(
      
                   padding: EdgeInsets.only(
      
                          top : 32,
      
                          left: 16,
      
                          right : 16,
      
                          bottom : 10
      
                        ),
      
                  margin: EdgeInsets.symmetric(
      
                          vertical: 12,
      
                          horizontal: 16,
      
                        ),
      
                  color : Color(0xffEEEEEE),
      
                  child : RichText(
      
                      text :   TextSpan(
      
                      style: Theme.of(context).textTheme.bodyText1,                                   
      
                        children: [
      
               TextSpan(text: "If I could make money by overthinking, I'd suppress Bill Gates by now. Overthinking is such a painful feeling. Your mind keeps you sending multitude of alternate scenarios and you keep playing"),
      
                TextSpan(text: "...Continue reading",
      
                style: Theme.of(context).textTheme.bodyText1.copyWith( color : Colors.pink ,),
      
                recognizer: TapGestureRecognizer()..onTap = (){ Navigator.pushNamed(context, '/comments' ,);
      
      }            
      
      
      
                )       
      
                       
      
                        ]
      
                    )
      
                    )
      
              ),
      
              Positioned(
      
                left : 30.0,
      
                //top : 10.0,
      
                child : CircleAvatar(
      
                  radius : 15.0,
      
                  backgroundColor : Colors.amberAccent,
      
                  child : Icon(Icons.account_circle , color : Colors.white)
      
                )
      
              )
      
            ]
      
              ),
      
              Padding(
      
                padding : EdgeInsets.only(left : 24.0),
      
                child : Text("14d",
      
                      style : Theme.of(context).textTheme.button.copyWith(color : Colors.grey[600] , fontSize: 12.0)             
      
                )
      
              ),
      
              Padding(
      
                padding : EdgeInsets.all(12.0),
      
                child : Center(
      
                  child: GestureDetector(
      
                    onTap: (){Navigator.pushNamed(context, '/comments' ,);},
      
                    child: Text("View all 5 comments",
      
                     style : Theme.of(context).textTheme.headline6.copyWith( color : Colors.pink ,)             
      
                    ),
      
                    )
      
                  )
      
              ),
      
              SizedBox(height : 8.0),
      
              Divider(
      
                color : Colors.grey[400],
      
                thickness: 3.0,
      
              )
      
               ],
      
             ),
      
         )
      
         ),
         
         
          ),

          menu()
  ],
),
 ),
    );
  }
  
}