import 'package:app/UI/View/subHome.dart';
import 'package:app/UI/Widget/bgHome.dart';
import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {


 @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

List<String>images=["images/bghome.jpg","images/bghome.jpg","images/room.jpg","images/bghome.jpg","images/bghome.jpg","images/room.jpg"];

 Widget   _buildGrid(){

   double height=MediaQuery.of(context).size.height;
   double width=MediaQuery.of(context).size.width;
   double heightItem=250;

  return   Container(
    height: height-(MediaQuery.of(context).size.height/4+75),
    color: Colors.white,
    child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: (width/2)/heightItem),
      children: images.map((url) {
        return InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubHome(url,"الاثاث"),));
          },
          child: Container(
            width: width/2,
            height: heightItem,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.only(bottom: heightItem*.05),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.black12),
                color: Colors.white,
                boxShadow:[
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5.0, // has the effect of softening the shadow
                    spreadRadius: 0.3, // has the effect of extending the shadow
                    offset: Offset(
                      2.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )

                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image(image: AssetImage(url),height: heightItem*.6,width: width/2-16,fit: BoxFit.cover,),
                Expanded(
                  child: Container(
                    //height: heightItem*.1,
                    width: width/2,
                    padding:  EdgeInsets.only(right:8.0,top: heightItem*.02),
                    child: Text("الاثاث",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                  ),
                ),
                Container(
                  // height: heightItem*.1,
                  width: width/2-35,
                  padding: const EdgeInsets.only(right:8.0),
                  child: Text("احدث المزادات على الاثاث",textAlign: TextAlign.right,maxLines: 1,overflow: TextOverflow.ellipsis,),
                )
              ],
            ),

          ),
        );
      }).toList(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    double heightItem=height*.4;
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(

        children: <Widget>[
          BgHome(_scaffoldkey),
          _buildGrid()

        ],
      ),
      ),
      endDrawer: ListDrawer(),
    );
  }
}
