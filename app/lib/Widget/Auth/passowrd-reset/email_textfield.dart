import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import '../Common/custom_textfield.dart';
import 'package:easy_localization/easy_localization.dart';
class RecoveryEmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _myemailController = TextEditingController();
    return CustomTextField(
      isObsecure: false,
      textFieldName: LocaleKeys.email_label_text.tr(),
      controller: _myemailController,
      icon: Icon(Icons.email, color: Colors.black),
    );
  }
}
