import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/buildButton.dart';
import 'package:app/UI/Widget/buildTextField.dart';
import 'package:app/UI/Widget/customAppBar.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  TextEditingController controllerInput=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(


      body: ListView(
        padding:  EdgeInsets.only(right:width*.04,left: width*.04),
        children: <Widget>[
          CustomAppBar("كلمة المرور"),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 100,right: 10),
            child: Text("ادخل كلمة المرور الجديدة",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
          ),

          BuildTextField('كلمة المرور الجديدة','كلمة المرور الجديدة',controllerInput,true,TextInputType.text),
          BuildTextField('تأكيد كلمة المرور الجديدة',' تأكيد كلمة المرور الجديدة',controllerInput,true,TextInputType.text),
          BuildButton("حفظ ومتابعة",RoutePaths.Home)
        ],
      ),

    );
  }
}
