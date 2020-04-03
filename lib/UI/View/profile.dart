import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/buildButton.dart';
import 'package:app/UI/Widget/buildTextField.dart';
import 'package:app/UI/Widget/listDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
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
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("الملف الشخصي",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 20),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.settings,color: Theme.of(context).primaryColor), onPressed: (){}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.format_list_bulleted,textDirection: TextDirection.rtl,color: Theme.of(context).primaryColor), onPressed: (){
            _scaffoldkey.currentState.openEndDrawer();
          }),
        ],

      ),
      body: ListView(
        padding:  EdgeInsets.only(right:width*.04,left: width*.04,top: 30),

        children: <Widget>[

          Container(
            height:height*.3 ,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage("images/bghome.jpg",),
                      radius: height*.3*.3,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: height*.06,
                            width:height*.06 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor
                            ),
                            child: Icon(Icons.camera_alt,color: Colors.white,)))
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Text("بياناتي",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold,fontSize: 15)),
                ),
              ],
            )
            ),

          BuildTextField('اسم المستخدم','اسم المستخدم',controllerInput,false,TextInputType.text),
          BuildTextField('رقم الجوال','رقم الجوال',controllerInput,false,TextInputType.phone),
          BuildTextField('تاريخ الميلاد','تاريخ الميلاد',controllerInput,false,TextInputType.text),
          BuildTextField('رقم الهوية','رقم الهوية',controllerInput,false,TextInputType.text),
          dropDown('الدولة'),
          dropDown("المدينة"),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(top: 20,bottom: 10),
                child: Text("كلمة المرور",style: TextStyle(fontSize: 15),),
              ),

              Stack(
                children: <Widget>[
                  TextFormField(
                    validator: (value) => value.isEmpty ? " لا يجب ان يكون فارغا " : null,
                    keyboardType:TextInputType.text,
                    obscureText: true,
                    textDirection: TextDirection.rtl,
                    decoration:InputDecoration(
                      hintText:"*********",

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gapPadding: 3
                      ),
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                          alignment: Alignment.center,
                          color:Colors.white,
                          //height: 70,
                          child:FlatButton(onPressed: (){
                            Navigator.of(context).pushNamed(RoutePaths.ChangePassword);

                          }, child: Text("تغيير كلمة المرور",style: TextStyle(color: Theme.of(context).primaryColor,decoration:TextDecoration.underline),),
                          )

                      ) ),
                ],
              ),
            ],
          ),

          BuildButton("حفظ", RoutePaths.Home)





        ],


      ),
      endDrawer: ListDrawer(),
    );
  }
}
