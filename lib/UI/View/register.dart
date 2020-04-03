
import 'file:///E:/Flutter/IntelliJIDEAProjects/menyzoud/lib/UI/View/login.dart';
import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/buildButton.dart';
import 'package:app/UI/Widget/buildTextField.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController controllerInput=TextEditingController();

  String city='';

  Widget dropDown(String title){
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(top: 20,bottom: 10,right: 2),
          child: Text(title,style: TextStyle(fontSize: 15),),
        ),
        Container(
          padding: const EdgeInsets.only(top: 0,right: 5),
          height: 70,

          decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid,color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              (city==null)?Text("المدينة",style: TextStyle(color: Colors.grey),):Text(city),

              new PopupMenuButton(
                child:Icon(Icons.arrow_drop_down),

                itemBuilder: (_) =>   <String> ['القاهرة', 'الاسكندرية', 'المنصورة', 'اسوان'].map((String value){
                  return PopupMenuItem<String>(
                      value: value,

                      child:Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                            width: MediaQuery.of(context).size.width-80,
                            child: Text(value)),
                      ));

                }).toList(),
                onSelected: (String value){
                  setState(() {
                   city=value;
                  });
                  return city;
                },

              ),

            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        padding:  EdgeInsets.only(right:width*.04,left: width*.04,top: 30),
    children: <Widget>[
      Container(
        alignment: Alignment.centerRight,
        child: Text("تسجيل جديد",style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
      ),

      BuildTextField('اسم المستخدم','اسم المستخدم',controllerInput,false,TextInputType.text),
      BuildTextField('رقم الجوال','رقم الجوال',controllerInput,false,TextInputType.phone),
      BuildTextField('تاريخ الميلاد','تاريخ الميلاد',controllerInput,false,TextInputType.text),
      BuildTextField('رقم الهوية','رقم الهوية',controllerInput,false,TextInputType.text),
      dropDown('الدولة'),
      dropDown("المدينة"),
      BuildTextField('كلمة المرور','كلمة المرور',controllerInput,true,TextInputType.text),
      BuildTextField('تأكيد كلمة المرور','تأكيد كلمة المرور',controllerInput,true,TextInputType.text),

      BuildButton("تسجيل الدخول",RoutePaths.Home),


      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(" لديك حساب ؟"),
            InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(RoutePaths.Login);
                },
                child: Text("تسجيل دخول",style:TextStyle(color: Theme.of(context).primaryColor,decoration:TextDecoration.underline))),

          ],
        ),
      )





    ]),
    );
  }
}
