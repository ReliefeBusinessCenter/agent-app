import 'package:app/Widget/Auth/signup/customeDropDown.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SexDropDown extends StatefulWidget {
  SexDropDown({required this.changeSex});
  final ValueChanged<String> changeSex;
  @override
  _SexDropDownState createState() => _SexDropDownState();
}

class _SexDropDownState extends State<SexDropDown> {
  String selectedSex = 'Male';
  late RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    return CustomeDropDownButton(
      dropDownItems: [
        DropdownMenuItem(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Text(
                LocaleKeys.male_label_text.tr(),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          value: "Male",
        ),
        DropdownMenuItem(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Text(
                LocaleKeys.female_label_text.tr(),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          value: "Female",
        ),
      ],
      onChanged: (value) {
        setState(() {
          selectedSex = value;
          widget.changeSex(value);
        });
      },
      value: "Male",
    );
  }
}
