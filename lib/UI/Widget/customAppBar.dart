import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
 final String title;

 CustomAppBar(this.title);

 @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return  Stack(

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
              Text(title,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),


            ],
          ),
        )
      ],
    );
  }
}
