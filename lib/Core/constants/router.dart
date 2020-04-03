import 'package:app/Core/constants/app_contstant.dart';
import 'package:app/UI/View/Home.dart';
import 'package:app/UI/View/about.dart';
import 'package:app/UI/View/accountsBank.dart';
import 'package:app/UI/View/callUs.dart';
import 'package:app/UI/View/changePassword.dart';
import 'package:app/UI/View/conditionsAndRules.dart';
import 'package:app/UI/View/confirmedCode.dart';
import 'package:app/UI/View/forgetPassword.dart';
import 'package:app/UI/View/history.dart';
import 'package:app/UI/View/login.dart';
import 'package:app/UI/View/mazadaty.dart';
import 'package:app/UI/View/mozydeen.dart';
import 'package:app/UI/View/myPocket.dart';
import 'package:app/UI/View/newPassword.dart';
import 'package:app/UI/View/notification.dart';
import 'package:app/UI/View/profile.dart';
import 'package:app/UI/View/register.dart';
import 'package:app/UI/View/spalsh.dart';
import 'package:app/UI/Widget/productsuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => Login());
      case RoutePaths.Register:
        return MaterialPageRoute(builder: (_) => Register());
      case RoutePaths.confirmCode:
        return MaterialPageRoute(builder: (_) => ConfirmedCode());
      case RoutePaths.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());

      case RoutePaths.NewPassword:
        return MaterialPageRoute(builder: (_) => NewPassword());
      case RoutePaths.ChangePassword:
        return MaterialPageRoute(builder: (_) => ChangePassword());

      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => Home());
      case RoutePaths.Profile:
        return MaterialPageRoute(builder: (_) => Profile());

      case RoutePaths.Notification:
        return MaterialPageRoute(builder: (_) => NotificationPage());
      case RoutePaths.AccountsBank:
        return MaterialPageRoute(builder: (_) => AccountsBank());
      case RoutePaths.history:
        return MaterialPageRoute(builder: (_) => History());
      case RoutePaths.Mozaydeen:
        return MaterialPageRoute(builder: (_) => Mozaydeen());
        case RoutePaths.CallUs:
        return MaterialPageRoute(builder: (_) => CallUs());
        case RoutePaths.About:
        return MaterialPageRoute(builder: (_) => About());
        case RoutePaths.ConditionsAndRules:
        return MaterialPageRoute(builder: (_) => ConditionsAndRules());
        case RoutePaths.MyPocket:
        return MaterialPageRoute(builder: (_) => MyPocket());
        case RoutePaths.Mazadaty:
        return MaterialPageRoute(builder: (_) => Mazadaty());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}