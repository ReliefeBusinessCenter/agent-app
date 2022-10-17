import 'package:app/Widget/common/constants.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final ValueChanged<String> changePassword;
  PasswordTextField({Key? key, required this.changePassword}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _passwordObscured,
      decoration: inputDecoration.copyWith(
        labelText: LocaleKeys.password_label_text.tr(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordObscured = !_passwordObscured;
            });
          },
          icon: Icon(
            _passwordObscured ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      onChanged: (value) => widget.changePassword(value),
      validator: (value) {
        if (value!.isEmpty) {
          return LocaleKeys.field_required_label_text.tr();
        }
      },
    );
  }
}
