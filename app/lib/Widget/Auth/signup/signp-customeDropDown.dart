
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomeDropDownButton extends StatelessWidget {
  final List<DropdownMenuItem<String>> dropDownItems;
  final String value;
  final Function onChanged;
  CustomeDropDownButton(
      {required this.dropDownItems,
      required this.value,
      required this.onChanged});

  // late OrdersBloc ordersBloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 6,
        // left: 12,
      ),
      child: Material(
        color: Colors.white,
        elevation: 1,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        textStyle: TextStyle(color: Colors.black),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.9,
          child: DropdownButtonFormField(

              // focusColor: Theme.of(context).primaryColor,
              dropdownColor: Colors.white,
              // icon: Icon(Icons.category_outlined),
              value: this.value,
              items: this.dropDownItems,
              onChanged: (String? value) => this.onChanged(value),
              hint: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(
                 LocaleKeys.select_an_item_label_text.tr(),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
      ),
    );
  }
}
