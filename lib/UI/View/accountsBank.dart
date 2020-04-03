import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountsBank extends StatefulWidget {
  @override
  _AccountsBankState createState() => _AccountsBankState();
}

class _AccountsBankState extends State<AccountsBank> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();


  Widget BuildItem(String bankName,String accountOperate ,String accountNum,String image){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child:  Container(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width*.3,
                      padding: EdgeInsets.only(right: 8),
                      child: Image(image: AssetImage(image))),
                  Container(
                    width: MediaQuery.of(context).size.width*.2,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 30,
                            child: Text("اسم البنك",maxLines: 1,overflow: TextOverflow.ellipsis,)),
    Container(
    height: 30,
    child:Text("رقم البيان",maxLines: 1,overflow: TextOverflow.ellipsis,)),
    Container(
    height: 30,
    child:Text("رقم الحساب",maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*.45,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
        Container(
    height: 30,
    child: Text(bankName,maxLines: 1,overflow: TextOverflow.ellipsis,)),
    Container(
    height: 30,
    child:Text(accountOperate,maxLines: 1,overflow: TextOverflow.ellipsis,)),
    Container(
    height: 30,
    child:Text(accountNum,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        Divider(color: Theme.of(context).primaryColor,)
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("الحسابات البنكية الخاصة بالتطبيق",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Theme.of(context).primaryColor), onPressed: (){
            _scaffoldkey.currentState.openEndDrawer();
          }),
        ],

      ),

      body: ListView(
        children: <Widget>[

          BuildItem('الاهلي','362479464477774','362479464477774','images/iconApp.png'),
          BuildItem('الاهلي','362479464477774','362479464477774','images/iconApp.png'),
          BuildItem('الاهلي','362479464477774','362479464477774','images/iconApp.png'),
          BuildItem('الاهلي','362479464477774','362479464477774','images/iconApp.png'),
          BuildItem('الاهلي','362479464477774','362479464477774','images/iconApp.png'),
          BuildItem('الاهلي','362479464477774','362479464477774','images/iconApp.png'),



        ],
      ),

      endDrawer: ListDrawer(),

    );
  }
}
