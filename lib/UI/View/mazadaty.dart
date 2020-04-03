import 'package:app/UI/Widget/listDrawer.dart';
import 'package:app/UI/Widget/nofinishmazad.dart';
import 'package:app/UI/Widget/successmazada.dart';
import 'package:flutter/material.dart';

class Mazadaty extends StatefulWidget {
  @override
  _MazadatyState createState() => _MazadatyState();
}

class _MazadatyState extends State<Mazadaty> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  int tabindex=0;


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("مزاداتي",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Theme.of(context).primaryColor), onPressed: (){
            _scaffoldkey.currentState.openEndDrawer();
          }),
        ],
      ),


      body: new ListView(
        padding: EdgeInsets.only(top: 20),
        children: <Widget>[
          new DefaultTabController(
              length: 2,
              child: new Container(
                height: height,
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
                            new Tab(text: 'غير المنتهية'),
                            new Tab(text: 'المزادات الفائزة',),
                          ]
                      ),
                    ),
                    Container(
                      height: height-50-kToolbarHeight-30-18,
                      child: new TabBarView(

                        children: [
                          new Tab(child: new NoFinishMazad()),
                          new Tab(child: new SuccessMazad(),),

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
