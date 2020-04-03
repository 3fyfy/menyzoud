import 'package:flutter/material.dart';

class Mozaydeen extends StatefulWidget {
  @override
  _MozaydeenState createState() => _MozaydeenState();
}

class _MozaydeenState extends State<Mozaydeen> {
  Widget BuildItem(String text,String image){
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom: 15.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
           child: ListTile(
             title: Text(text),
             leading: CircleAvatar(
               backgroundImage: AssetImage(image,),
               radius: width*.2*.3,
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

    return  Scaffold(
      appBar: AppBar(
        title: Text("جميع المزايدين",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor), onPressed: (){
          Navigator.of(context).pop();
        }),

      ),

      body: ListView(
        children: <Widget>[

          BuildItem('تم اضافة الرصيد في حسابك','images/bghome.jpg'),
          BuildItem('تم الغاء المزاد','images/bghome.jpg'),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/bghome.jpg'),
          BuildItem('لقد كسبت المزاد رقم 2345','images/bghome.jpg'),
          BuildItem('تم اضافة الرصيد في حسابك','images/bghome.jpg'),
          BuildItem('تم الغاء المزاد','images/visa.png'),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/visa.png'),
          BuildItem('لقد كسبت المزاد رقم 2345','images/visa.png'),

        ],
      ),

    );
  }
}
