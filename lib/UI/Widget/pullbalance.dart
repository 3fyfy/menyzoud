import 'package:app/UI/Widget/buildTextField.dart';
import 'package:flutter/material.dart';

class Pull extends StatefulWidget {
  @override
  _PullState createState() => _PullState();
}

class _PullState extends State<Pull> {

  TextEditingController controllerInput=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Container(
      child: Stack(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BuildTextField("المبلغ المراد سحبه","ادخل المبلغ",controllerInput,false,TextInputType.number),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: 50,
              color: Theme.of(context).primaryColor,
              child: Center(child: Text("طلب سحب الرصيد",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      ),
    );
  }
}
