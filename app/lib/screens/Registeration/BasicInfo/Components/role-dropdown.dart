import 'package:app/Widget/Auth/signup/customeDropDown.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:easy_localization/easy_localization.dart";

class RoleDropDown extends StatefulWidget {
  final ValueChanged<String> changeRole;
  RoleDropDown({required this.changeRole});
  @override
  _RoleDropDownState createState() => _RoleDropDownState();
}

class _RoleDropDownState extends State<RoleDropDown> {
  String selectedRole = 'Customer';
  late RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return CustomeDropDownButton(
      dropDownItems: [
        DropdownMenuItem(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Text(
                LocaleKeys.customer_label_text.tr(),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          value: "Customer",
        ),
        DropdownMenuItem(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Text(
                LocaleKeys.broker_label_text.tr(),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          value: "Broker",
        ),
      ],
      onChanged: (value) {
        setState(() {
          selectedRole = value;
          widget.changeRole(value);
        });
      },
      value: "Customer",
    );
  }
}
