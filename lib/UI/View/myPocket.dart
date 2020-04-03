import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/carousel.dart';
import 'package:app/UI/Widget/listDrawer.dart';
import 'package:app/UI/Widget/pullbalance.dart';
import 'package:app/UI/Widget/rechargebalance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPocket extends StatefulWidget {
  @override
  _MyPocketState createState() => _MyPocketState();
}

class _MyPocketState extends State<MyPocket> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  int tabindex=0;


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
key: _scaffoldkey,
      appBar: PreferredSize(child:Container(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PreferredSize(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.av_timer,color: Theme.of(context).primaryColor),
              InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(RoutePaths.history);
                  },
                  child: Text("سجل الحسابات",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)),
            ],
          ),
            preferredSize: Size(width*.3, kToolbarHeight),
        ),
    Text("محفظتي",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
    IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Theme.of(context).primaryColor), onPressed: (){
    _scaffoldkey.currentState.openEndDrawer();
    },
    padding: EdgeInsets.all(0),
        alignment: Alignment.center,
    ),


    ],

    ),
      ),preferredSize: Size(width, kToolbarHeight),),


      body: new ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10,bottom: 20),
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text("945",style: TextStyle(fontSize: 20),),
                    SizedBox(width: 10,),
                    Text("ريال")
                  ],
                ),
                Text("رصيدك الحالي")
              ],
            ),
          ),
          new DefaultTabController(
              length: 2,
              child: new Container(
                height: height-130,
                child: new Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: width*.1),

                          width: width*.4,
                          height: (tabindex==1) ?1:2,
                          color: Theme.of(context).primaryColor,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: width*.1),
                          width: width*.4,
                          height:(tabindex==0) ?1:2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      child: new TabBar(
                          labelColor: Theme.of(context).accentColor,
                          indicatorColor: Colors.transparent,
                          onTap: (value){
                            setState(() {
                              tabindex=value;
                            });
                          },
                          tabs: [
                            new Tab(text: 'سحب رصيد'),
                            new Tab(text: 'شحن رصيد',),
                          ]
                      ),
                    ),
                    Container(
                     // height: height-135-50-32,
                      height: height-130-52,
                      child: new TabBarView(
                        children: [
                          new Tab(child: new Pull()),
                          new Tab(child: new Recharge(),),

                        ],
                      ),
                    ),

                  ],
                ),
              )
          ),
        ],
      ),


      endDrawer: ListDrawer(),
    );
  }
}
