import 'package:flutter/material.dart';

import '../Common/custom_textfield.dart';

class EmailTextField extends StatelessWidget {
  TextEditingController myemailController;
  EmailTextField({required this.myemailController});
  @override
  Widget build(BuildContext context) {
    // final _myemailController = TextEditingController();
    return CustomTextField(
        textFieldName: "Enter Email",
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
