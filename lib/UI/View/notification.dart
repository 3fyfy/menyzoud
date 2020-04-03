import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  Widget BuildItem(String text,String image){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom: 15),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              title: Text(text),
              leading: Image(image: AssetImage(image)),
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
      appBar: AppBar(
        title: Text("الاشعارات",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor), onPressed: (){
          Navigator.of(context).pop();
        }),

      ),

      body: ListView(
        children: <Widget>[

          BuildItem('تم اضافة الرصيد في حسابك','images/iconApp.png'),
          BuildItem('تم الغاء المزاد','images/iconApp.png'),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/iconApp.png'),
          BuildItem('لقد كسبت المزاد رقم 2345','images/iconApp.png'),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/iconApp.png'),
          BuildItem('تم اضافة الرصيد في حسابك','images/iconApp.png'),
          BuildItem('لقد كسبت المزاد رقم 2345','images/iconApp.png'),
          BuildItem('تم الغاء المزاد','images/iconApp.png'),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/iconApp.png'),
          BuildItem('لقد كسبت المزاد رقم 2345','images/iconApp.png'),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/iconApp.png'),



        ],
      ),

    );
  }
}
