import 'package:flutter/material.dart';

import '../Common/custom_textfield.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController mypasswordController;
  PasswordTextField({required this.mypasswordController});
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      isObsecure: true,
      textFieldName: "Enter Passowrd",
      controller: mypasswordController,
      icon: Icon(Icons.lock, color: Colors.black),
    );
  }

  String getPassword() {
    return this.mypasswordController.text;
  }
}
