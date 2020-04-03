import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  Widget BuildItem(String text,String image,String Date){
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:15.0,bottom: 0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        width: width*.2,
                        padding: EdgeInsets.only(bottom: 10),

                        child: Image(image: AssetImage(image))),
                    Container(
                        width: width*.6,
                        padding: EdgeInsets.only(right: 20,bottom: 10),
                        alignment: Alignment.topRight,
                        child: Text(text)),
                  ],
                ),

                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Text(Date))

              ],
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
        title: Text("سجل الحسابات",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.white70,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Theme.of(context).primaryColor), onPressed: (){
          Navigator.of(context).pop();
        }),

      ),

      body: ListView(
        children: <Widget>[

          BuildItem('تم اضافة الرصيد في حسابك','images/visa.png',"30/10/2020-3:15"),
          BuildItem('تم الغاء المزاد','images/visa.png',"30/10/2020-3:15"),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/visa.png',"30/10/2020-3:15"),
          BuildItem('لقد كسبت المزاد رقم 2345','images/visa.png',"30/10/2020-3:15"),
          BuildItem('تم اضافة الرصيد في حسابك','images/visa.png',"30/10/2020-3:15"),
          BuildItem('تم الغاء المزاد','images/visa.png',"30/10/2020-3:15"),
          BuildItem('تم رفض طلب تحوبل الرصيد ','images/visa.png',"30/10/2020-3:15"),
          BuildItem('لقد كسبت المزاد رقم 2345','images/visa.png',"30/10/2020-3:15"),

        ],
      ),

    );
  }
}
