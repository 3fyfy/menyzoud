import 'file:///E:/Flutter/IntelliJIDEAProjects/menyzoud/lib/UI/View/register.dart';
import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/View/forgetPassword.dart';
import 'package:app/UI/Widget/buildButton.dart';
import 'package:app/UI/Widget/buildTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController controllerInput=TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      body: ListView(
        padding:  EdgeInsets.only(right:width*.04,left: width*.04),
        children: <Widget>[
          Container(
            height: height*.3,
            child: Center(
              child: Image(image: AssetImage('images/iconApp.png'),fit: BoxFit.contain,),

            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            child: Text("تسجيل الدخول",style: TextStyle(color:Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
          ),
          BuildTextField("رقم الجوال","",controllerInput,false,TextInputType.phone),


          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(top: 20,bottom: 10),
                child: Text("الرقم السرى",style: TextStyle(fontSize: 15),),
              ),

              Stack(
                children: <Widget>[
                  TextFormField(
                    validator: (value) => value.isEmpty ? " لا يجب ان يكون فارغا " : null,
                    keyboardType:TextInputType.text,
                    obscureText: true,
                    textDirection: TextDirection.rtl,
                    decoration:InputDecoration(
                      hintText:"",

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
                            Navigator.of(context).pushNamed(RoutePaths.forgetPassword);

                          }, child: Text("نسيت كلمة المرور",style: TextStyle(color: Theme.of(context).primaryColor,decoration:TextDecoration.underline),),
                          )

                      ) ),
                ],
              ),
            ],
          ),

          BuildButton("تسجيل الدخول",RoutePaths.Home),


        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("ليس لديك حساب ؟"),
                InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RoutePaths.Register);
                    },
                    child: Text("تسجيل جديد",style:TextStyle(color: Theme.of(context).primaryColor,decoration:TextDecoration.underline))),

              ],
            ),
          )


        ],
      ),
    );

  }
}
