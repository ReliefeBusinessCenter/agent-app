import 'package:app/screens/new-credentials-screen.dart';
import 'package:app/screens/password_reset_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login.dart';

bool isAuthenticated = false;

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => Login());
    } else if (settings.name == Home.routeName) {
      return MaterialPageRoute(builder: (context) => Home());
    } else if (settings.name == NewCredentialsScreen.routeName) {
      return MaterialPageRoute(builder: (context) => NewCredentialsScreen());
    } else if (settings.name == PasswordReset.routeName)
      return MaterialPageRoute(builder: (context) => PasswordReset());
    return MaterialPageRoute(builder: (context) => Login());
  }
}
