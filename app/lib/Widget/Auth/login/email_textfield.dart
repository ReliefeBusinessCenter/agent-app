import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../Common/custom_textfield.dart';
import 'package:easy_localization/easy_localization.dart';

class EmailTextField extends StatelessWidget {
  TextEditingController myemailController;
  final TextInputType? textInputType;
  final Function(String value) onChanged;
  EmailTextField({
    required this.myemailController,
    required this.onChanged,
    this.textInputType
  });
  @override
  Widget build(BuildContext context) {
    // final _myemailController = TextEditingController();
    return CustomTextField(
        onChanged: (value) {},
        textFieldName: "Enter Phone",
        controller: myemailController,
        isObsecure: false,
        textInputType: textInputType,
        icon: Icon(
          Icons.email,
          color: Colors.black,
        ));
  }

  String getEmail() {
    return this.myemailController.text.toString();
  }
}
