import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/material.dart';

class CallUs extends StatefulWidget {
  @override
  _CallUsState createState() => _CallUsState();
}

class _CallUsState extends State<CallUs> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    double  width= MediaQuery.of(context).size.width;
    double  height= MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("اتصل بنا",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Theme.of(context).primaryColor), onPressed: (){
            _scaffoldkey.currentState.openEndDrawer();
          }),
        ],

      ),

      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(right:width*.04,left: width*.04),


        child: ListView(
          children: <Widget>[
            
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Text("تواصل معنا عن طريق مواقع التواصل الاجتماعي",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),

            Container(
              padding: EdgeInsets.only(right:width*.2 ,left:width*.2,top: height*.1 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(image: AssetImage("images/facebook.png"),width: 50,),
                  Image(image: AssetImage("images/twitter.jpg"),width: 50,),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: height*.1),
              height: height*.25,
              child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("او وسائل الاتصال",style: TextStyle(fontSize: 15),),
                  Text("email@gmail.com",style: TextStyle(fontSize: 15),),
                  Text("0503421113",style: TextStyle(fontSize: 15),)
                ],
              ),
            )

          ],
        ),
      ),

      endDrawer: ListDrawer(),

    );
  }

}
