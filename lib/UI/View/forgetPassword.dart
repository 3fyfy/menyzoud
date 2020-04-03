import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/buildButton.dart';
import 'package:app/UI/Widget/buildTextField.dart';
import 'package:app/UI/Widget/customAppBar.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  TextEditingController controllerInput=TextEditingController();

  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(

      body: ListView(
        padding:  EdgeInsets.only(right:width*.04,left: width*.04),

        children: <Widget>[
          CustomAppBar("نسيت كلمة المرور"),

          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 100),
            child: Text("ادخل رقم الجوال لارسال رمز التأكيد",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
          ),
          BuildTextField("رقم الجوال","01234567",controllerInput,false,TextInputType.phone),

          SizedBox(
            height: height*.2,
          ),

          BuildButton("متابعة",RoutePaths.confirmCode),

          SizedBox(
            height: height*.1,
          ),

        ],
      ),
    );
  }
}
