import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/buildButton.dart';
import 'package:app/UI/Widget/buildTextField.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  TextEditingController controllerInput=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        padding:  EdgeInsets.only(right:width*.04,left: width*.04),
        children: <Widget>[
          Stack(

            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                width: width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back_ios),color:Theme.of(context).primaryColor, onPressed: (){
                      Navigator.of(context).pop(); }),
                    Text("كلمة المرور",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),


                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 100,right: 10),
            child: Text("ادخل كلمة المرور الجديدة",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
          ),
          BuildTextField('كلمة المرور القديمة','كلمة المرور القديمة',controllerInput,true,TextInputType.text),
          BuildTextField('كلمة المرور الجديدة','كلمة المرور الجديدة',controllerInput,true,TextInputType.text),
          BuildTextField('تأكيد كلمة المرور الجديدة',' تأكيد كلمة المرور الجديدة',controllerInput,true,TextInputType.text),
          BuildButton("حفظ ومتابعة",RoutePaths.Home)
        ],
      ),
    );
  }
}
