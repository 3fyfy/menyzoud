import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {

  final String title;
  final String hint;
  final TextEditingController controller;
  final bool secure;
  final TextInputType type;

  BuildTextField(this.title, this.hint, this.controller, this.secure,
      this.type);

  @override
  Widget build(BuildContext context) {
    return   Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: 20,bottom: 10,right: 2),
            child: Text(title,style: TextStyle(fontSize: 15),),
          ),

          Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              validator: (value) => value.isEmpty ? " لا يجب ان يكون فارغا " : null,
              keyboardType:type,
              obscureText: secure,
              textDirection: TextDirection.rtl,
              controller: controller,
              decoration:InputDecoration(
                hintText:hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gapPadding: 3
                ),
                hintStyle: TextStyle(fontSize: 16,),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );


  }
}

