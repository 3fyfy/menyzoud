import 'dart:async';

import 'file:///E:/Flutter/IntelliJIDEAProjects/menyzoud/lib/UI/View/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.of(context).push((MaterialPageRoute(builder: (context)=>Login()))));
  }

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;


    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Center(
        child: Image(image: AssetImage('images/iconApp.png'),width: 130,),
      ),
    );
  }
}
