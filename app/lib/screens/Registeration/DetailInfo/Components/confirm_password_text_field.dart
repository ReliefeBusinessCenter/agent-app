import 'package:app/Widget/common/constants.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  final ValueChanged<String> onConfirmPasswordChanged;
  final Function validator;
  const ConfirmPasswordTextField(
      {Key? key, required this.onConfirmPasswordChanged, required this.validator})
      : super(key: key);

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool _confirmObscured = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _confirmObscured,
      onChanged: (value) => widget.onConfirmPasswordChanged(value),
      validator: (value) => widget.validator(value),
      decoration: inputDecoration.copyWith(
        labelText: LocaleKeys.confirm_password_label_text.tr(),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _confirmObscured = !_confirmObscured;
            });
          },
          icon: Icon(
            _confirmObscured ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
