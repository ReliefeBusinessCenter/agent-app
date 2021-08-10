import 'package:app/screens/broker/broker_main_page.dart';
import 'package:app/screens/customerPage.dart';
import 'package:app/screens/login.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class LoginLogic extends StatelessWidget {
  final String email;
  final String password;

  LoginLogic({required this.email, required this.password});

  String Authenticate() {
    String value = '';
    if (this.email == 'customer' && this.password == 'password') {
      value = 'customer';
    } else if (this.email == 'broker' && this.password == 'password') {
      value = 'broker';
    }

    return value;
  }

  // void goToPages() {
  //   final value = this.Authenticate();

  //   if (value == 'customer') {
  //     Navigator.pushNamed(context, CustomerPage.routeName);
  //   } else if (value == 'broker') {
  //     Navigator.pushNamed(context, BrokerMain.routeName);
  //   } else {}
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final value = this.Authenticate();

    if (value == 'customer') {
      Navigator.pushNamed(context, CustomerPage.routeName);
    } else if (value == 'broker') {
      Navigator.pushNamed(context, BrokerMain.routeName);
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Incorrect Email Or Passowrd',
        btnOkOnPress: () {
          Navigator.popAndPushNamed(context, Login.routeName);
        },
      )..show();
    }
    throw UnimplementedError();
  }
}
