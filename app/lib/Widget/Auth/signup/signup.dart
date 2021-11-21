import 'package:app/constants/login/size.dart';
import 'package:app/screens/Auth/signUp_screen.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignUpPageScreen.routeName);
      },
      child: Center(
        child: Container(
          width: double.infinity,
          child: Center(
            child: AutoSizeText(
              LocaleKeys.dont_you_have_account_label_text.tr(),
              maxLines: 2,
              // textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: loginSize.getFontSize2,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
