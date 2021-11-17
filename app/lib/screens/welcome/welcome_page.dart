import 'package:app/Widget/Auth/login/login_button_outline.dart';
import 'package:app/constants.dart';
import 'package:app/screens/Auth/auth_exports.dart';
import 'package:app/screens/customer/home_fragment_screen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = 'welcomePage';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      // ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: HomeFragment(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: CustomOutlineButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Login.routeName);
            },
            title: "Go In"),
      ),
    );
  }
}
