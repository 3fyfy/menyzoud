import 'package:app/UI/View/products.dart';
import 'package:app/UI/Widget/bgHome.dart';
import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubHome extends StatefulWidget {

  final String image;
  final String title;

  SubHome(this.image,this.title);

  @override
  _SubHomeState createState() => _SubHomeState();
}

class _SubHomeState extends State<SubHome> {

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Products(url,"الكنب"),));
            },
            child:  Container(
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
                      child: Text("الكنب",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: heightItem*.1,
                      width: width/2-35,
                      padding: const EdgeInsets.only(right:8.0),
                      child: Text("احدث المزادات على الاثاث",textAlign: TextAlign.right,maxLines: 1,overflow: TextOverflow.ellipsis,),
                    ),
                  )
                ],
              ),

            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildBg(){
    double heightBgHome= MediaQuery.of(context).size.height/4;
    double widthBgHome= MediaQuery.of(context).size.width;

    var controller;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        alignment: Alignment.topCenter,

        children: <Widget>[
          Container(
            height: heightBgHome+75,
            color: Colors.white,
            width: widthBgHome,

          ),


          Container(
            height: (heightBgHome)+35,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover)
              ),
            ),
          ),
          Container(
            height: (heightBgHome)+35,
            decoration: BoxDecoration(
              color: Color.fromRGBO(128,0,128,.7),
            ),
          ),

          Positioned(
              top: heightBgHome/2 ,

              child: Container(
                  child: Row(
                    children: <Widget>[
                      Text("من يزود ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),),
                      Text(", جميع ما تحتاجه في مكان واحد",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  )
              )),

          Positioned(
              top: heightBgHome ,
              child: Container(
                  width: widthBgHome-widthBgHome*.1,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(.2, .3),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child:TextFormField(
                    controller: controller,
                    textDirection: TextDirection.ltr,
                    decoration:InputDecoration(
                        hintText:"البحث والفلترة",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                            gapPadding: 3
                        ),
                        hintStyle: TextStyle(fontSize: 16,),
                        prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: (){})
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  )
              )),

          Container(
              height: 50,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Colors.white), onPressed: (){

                    _scaffoldkey.currentState.openEndDrawer();

                  }),
                  Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                  IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,textDirection: TextDirection.ltr,), onPressed: (){
                    Navigator.of(context).pop();
                  }),

                ],
              )

          ),



        ],
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
           buildBg(),
            _buildGrid()

          ],
        ),
      ),
      endDrawer: ListDrawer(),
    );
  }
}
