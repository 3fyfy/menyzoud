
import 'package:app/Core/constants/app_contstant.dart';
import 'package:flutter/material.dart';

class BgHome extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey ;


  BgHome(this._scaffoldkey);

  @override
  Widget build(BuildContext context) {

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
                  image: DecorationImage(image: AssetImage("images/bghome.jpg"),fit: BoxFit.cover)
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
                  Text("الاقسام الرئيسية",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),

                  IconButton(icon: Icon(Icons.notifications,color: Colors.white), onPressed: (){
                    Navigator.of(context).pushNamed(RoutePaths.Notification);
                  }),

                ],
              )

          ),



        ],
      ),
    );
  }
}

