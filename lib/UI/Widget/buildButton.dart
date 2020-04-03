import 'package:app/Core/constants/app_contstant.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String text;
  final String root;

  BuildButton(this.text,this.root);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return    InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(root);
      },
      child: Container(
        height: 80,
        width: width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 50,bottom: 20),
        decoration:BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child:Text(text,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
