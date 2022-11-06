import 'package:app/constants/login/size.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class SavingCustomFormField extends StatelessWidget {
  final bool isObsecure;
  final String textFieldName;
  final Icon icon;
  final Function(String value) onChanged;
  String initialValue;

  SavingCustomFormField(
      {required this.initialValue,
      required this.textFieldName,
      required this.onChanged,
      required this.isObsecure,
      required this.icon});
  @override
  Widget build(BuildContext context) {
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return Material(
      color: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Container(
        width: loginSize.getTextFieldWidth,
        child: TextFormField(
          
          initialValue: initialValue,

          onChanged: (value) {
            onChanged(value);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return LocaleKeys.field_required_label_text.tr();
            }
          },
          obscureText: this.isObsecure,
          // controller: this.controller,
          // obscureText: !ispassshow,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onEditingComplete: () => FocusScope.of(context).unfocus(),
          style: TextStyle(fontSize: 18, color: Colors.grey),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: this.icon,
            border: InputBorder.none,
            hintText: this.textFieldName,
          ),
        ),
      ),
    );
  }
}
