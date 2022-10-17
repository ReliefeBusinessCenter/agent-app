import 'package:app/constants/login/size.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class CustomTextField extends StatelessWidget {
  final String textFieldName;
  final TextEditingController controller;
  final Function? validator;
  final bool obsecureText;
  final bool isRequired;
  final String initialValue;
  final int minLength;
  final Function onChanged;
  final bool enabled;
  final TextInputType keyboardType;
  final Function? onTap;

  CustomTextField({
     this.onTap,
    required this.keyboardType,
    required this.textFieldName,
    required this.controller,
    this.validator,
    required this.obsecureText,
    required this.isRequired,
    required this.initialValue,
    required this.minLength,
    required this.onChanged,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return
        // Material(
        //   color: Colors.white,
        //   elevation: 1.0,
        //   clipBehavior: Clip.hardEdge,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(40),
        //   ),
        //   textStyle: TextStyle(color: Colors.black),
        //   child:
        Container(
            width: loginSize.getTextFieldWidth,
            child: TextFormField(
              
                onTap: () {},
                keyboardType: keyboardType,
                enabled: this.enabled,
                controller: this.controller,
                obscureText: this.obsecureText,
                // initialValue: this.initialValue,
                // keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (val) {
                  if (val!.length == 0) {
                    return LocaleKeys.field_required_label_text.tr();
                  } else if (textFieldName == 'Phone') {
                    if (val.length != 10) {
                      return LocaleKeys.phone_length_validation_label_text.tr();
                    }
                    return null;
                  } else {
                    return null;
                  }
                },
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                style: TextStyle(fontSize: 18, color: Colors.grey),
                onChanged: (value) => this.onChanged(value.toString()),
                decoration: InputDecoration(
                    labelText: this.textFieldName,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    //fillColor: Colors.green

                    contentPadding: EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                      left: 12,
                    ),
                    // border: InputBorder.none,
                    // prefixText: '${this.textFieldName}',
                    suffixIcon: Container(
                      width: 2,
                      child: Center(
                        child: this.isRequired
                            ? Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            : Text(''),
                      ),
                    ))));
  }
}
