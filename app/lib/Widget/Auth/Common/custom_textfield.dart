import 'package:app/constants/login/size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool isObsecure;
  final String textFieldName;
  final Icon icon;
  final TextEditingController controller;
  String? initialValue;
  final Function(String value) onChanged;
  final TextInputType? textInputType;

  CustomTextField(
      {
        this.textInputType,
        this.initialValue,
      required this.textFieldName,
      required this.controller,
      required this.isObsecure,
      required this.icon,
      required this.onChanged});
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

          onChanged: onChanged,
          obscureText: this.isObsecure,
          controller: controller,
          // obscureText: !ispassshow,
          keyboardType: textInputType == null?TextInputType.text: textInputType ,
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
