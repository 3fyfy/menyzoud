import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    double  width= MediaQuery.of(context).size.width;
    double  height= MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("عن من يزود",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
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
              height: height*.3,
              child: Center(
                child: Image(image: AssetImage('images/iconApp.png'),fit: BoxFit.contain,),
              ),
            ),

            Text("الحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابانكية الخابنكية الخا الخاصة بالتطصة بالتطبيقالحسابات البنكية الخاصة بالتطبيقالحسابات البنكية الخاصة بالتطبيق",textDirection: TextDirection.rtl,textAlign: TextAlign.center,),
            SizedBox(
              height: height*.1,
            )

          ],
        ),
      ),

      endDrawer: ListDrawer(),

    );
  }
}
