import 'package:app/screens/becomeAnAgent.dart';
import 'package:app/screens/broker/broker_account_screen.dart';
import 'package:app/screens/broker/broker_main_page.dart';
import 'package:app/screens/broker/saving_and_loans.dart';
import 'package:app/screens/brokers_detail_screen.dart';
import 'package:app/screens/customerPage.dart';
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
    } else if (settings.name == CustomerPage.routeName) {
      return MaterialPageRoute(builder: (context) => CustomerPage());
    } else if (settings.name == BrokerAccountScreen.routeName) {
      return MaterialPageRoute(builder: (context) => BrokerAccountScreen());
    } else if (settings.name == SavingAndLoan.routeName) {
      return MaterialPageRoute(builder: (context) => SavingAndLoan());
    } else if (settings.name == BrokerMain.routeName) {
      return MaterialPageRoute(builder: (context) => BrokerMain());
      // } else if (settings.name == BrokersProfilePage.routeName) {
      //   return MaterialPageRoute(builder: (context) => BrokersProfilePage());
      // }
    } else if (settings.name == NewCredentialsScreen.routeName) {
      return MaterialPageRoute(builder: (context) => NewCredentialsScreen());
    } else if (settings.name == BecomeAnAgent.routeName) {
      return MaterialPageRoute(builder: (context) => BecomeAnAgent());
    } else if (settings.name == PasswordReset.routeName)
      return MaterialPageRoute(builder: (context) => PasswordReset());

    return MaterialPageRoute(builder: (context) => Login());
  }
}
