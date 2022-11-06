import 'package:app/Widget/Auth/login/login_button_outline.dart';
import 'package:app/Widget/welcome/home_fragment.dart';
import 'package:app/constants.dart';
import 'package:app/screens/PhoneVerification/phone_verification_screen.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
          child: WelcomeHomeFragment(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: CustomOutlineButton(
            onPressed: () {
              Navigator.of(context).pushNamed(GoIn.routeName);
            },
            title: LocaleKeys.go_in_button_text.tr()),
      ),
    );
  }
}
