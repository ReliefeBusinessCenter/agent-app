import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../Common/custom_textfield.dart';
import 'package:easy_localization/easy_localization.dart';

class EmailTextField extends StatelessWidget {
  TextEditingController myemailController;
  EmailTextField({required this.myemailController});
  @override
  Widget build(BuildContext context) {
    // final _myemailController = TextEditingController();
    return CustomTextField(
        textFieldName: LocaleKeys.email_label_text.tr(),
        controller: myemailController,
        isObsecure: false,
        icon: Icon(
          Icons.email,
          color: Colors.black,
        ));
  }

  String getEmail() {
    return this.myemailController.text.toString();
  }
}
