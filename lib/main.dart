import 'file:///E:/Flutter/IntelliJIDEAProjects/menyzoud/lib/UI/View/spalsh.dart';
import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/Core/constants/router.dart';
import 'package:app/Core/services/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(Directionality(
    textDirection: TextDirection.rtl,
    child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>.value(value: MainProvider(),),


      ],

      child: MaterialApp(

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:Colors.purple,
          accentColor: Colors.purple
        ),
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

