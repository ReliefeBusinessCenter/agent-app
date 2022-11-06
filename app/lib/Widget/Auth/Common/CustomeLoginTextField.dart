import 'package:app/constants/login/size.dart';
import 'package:flutter/material.dart';

class CustomLoginTextField extends StatelessWidget {
  final String textFieldName;
  final TextEditingController controller;
  final IconData icon;
  final Function validator;
  final bool obsecureText;
  final TextInputType keyboardType;
  final bool? isPassword;
  final Function(bool isObscured)? isObscured;

  CustomLoginTextField({
    this.isObscured,
    this.isPassword,
    required this.keyboardType,
    required this.textFieldName,
    required this.controller,
    required this.icon,
    required this.validator,
    required this.obsecureText,
  });

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
          controller: this.controller,
          obscureText: this.obsecureText,
          keyboardType: keyboardType,
          textInputAction: TextInputAction.done,
          onEditingComplete: () => FocusScope.of(context).unfocus(),
          style: TextStyle(fontSize: 18, color: Colors.grey),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(this.icon),
            border: InputBorder.none,
            suffixIcon: isPassword != null
                ? IconButton(
                    onPressed: () {
                      isObscured!(obsecureText);
                    },
                    icon: Icon(
                        obsecureText ? Icons.visibility : Icons.visibility_off))
                : null,
            hintText: '${this.textFieldName}',
            errorStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
            ),
            errorMaxLines: 1,
          ),
          validator: (value) => validator(value),
        ),
      ),
    );
  }
}
