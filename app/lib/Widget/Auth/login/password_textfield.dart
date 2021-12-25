import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../Common/custom_textfield.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController mypasswordController;
  PasswordTextField({required this.mypasswordController});
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: (value) {},
      isObsecure: true,
      textFieldName: LocaleKeys.password_label_text.tr(),
      controller: mypasswordController,
      icon: Icon(Icons.lock, color: Colors.black),
    );
  }

  String getPassword() {
    return this.mypasswordController.text;
  }
}
