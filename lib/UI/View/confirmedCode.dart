import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/Widget/buildButton.dart';
import 'package:app/UI/Widget/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';



class ConfirmedCode extends StatefulWidget {
  @override
  _ConfirmedCodeState createState() => _ConfirmedCodeState();
}

class _ConfirmedCodeState extends State<ConfirmedCode> {


  TextEditingController controller = TextEditingController(text: "");
  String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  String errorMessage;


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return Scaffold(

      body: ListView(
        padding:  EdgeInsets.only(right:width*.04,left: width*.04),
        children: <Widget>[
          CustomAppBar("رمز التأكيد"),

          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 100,right: 10),
            child: Text("ادخل رمز التأكيد المرسل الى الرقم 1234344",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 50,
          ),

          PinCodeTextField(
            autofocus: true,
            controller: controller,
            hideCharacter: true,
            highlight: true,
            highlightColor:Theme.of(context).primaryColor,
            defaultBorderColor: Colors.black,
            hasTextBorderColor: Theme.of(context).primaryColor,
            maxLength: pinLength,

            hasError: hasError,
            onTextChanged: (text) {
              setState(() {
                hasError = false;
              });
            },
            onDone: (text) {
              print("DONE $text");
              print("DONE CONTROLLER ${controller.text}");
            },
            wrapAlignment: WrapAlignment.spaceAround,
            pinBoxDecoration:
            ProvidedPinBoxDecoration.defaultPinBoxDecoration,
            pinTextStyle: TextStyle(fontSize: 30.0),
            pinTextAnimatedSwitcherTransition:
            ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
            pinTextAnimatedSwitcherDuration:
            Duration(milliseconds: 300),
//                    highlightAnimation: true,
            highlightAnimationBeginColor: Colors.black,
            highlightAnimationEndColor: Colors.white12,
            keyboardType: TextInputType.number,
          ),

          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,

            children: <Widget>[
              Text(" لم يصلك كود التفعيل؟"),
              Text(" اعادة ارسال",style: TextStyle(color: Theme.of(context).primaryColor,decoration:TextDecoration.underline))
            ],
          ),
          SizedBox(
            height: height*.1,
          ),

          BuildButton("متابعة",RoutePaths.NewPassword),

          SizedBox(
            height: height*.1,
          ),

        ],
      ),
    );
  }
}
