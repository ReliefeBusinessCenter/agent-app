import 'package:app/constants/login/size.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return Center(
      child: Text(
        LocaleKeys.login_label_text.tr(),
        // textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: loginSize.getFontSize1,
            color: Colors.black),
      ),
    );
  }
}
