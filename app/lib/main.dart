import 'package:flutter/material.dart';

import 'Screen/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(146, 40, 105, 1),
          accentColor: Color.fromRGBO(82, 51, 105, 1),
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          errorColor: Colors.redAccent,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(255, 231, 255, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 31, 51, 1),
              ),
              headline6:
                  TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'))),
      home: Login(),
      // initialRoute:Login.routeName,
      // onGenerateRoute: ServiceAppRoute.generateRoute,

      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoryMainScreen());
      // },
    );
  }
}
