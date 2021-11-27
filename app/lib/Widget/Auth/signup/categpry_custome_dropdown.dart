import 'package:app/model/broker/category.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore: must_be_immutable
class CategoryCustomeDropDownButton extends StatelessWidget {
  final List<DropdownMenuItem<Category>> dropDownItems;
  final Category value;
  final Function onChanged;
  late RegisterBloc registerBloc;

  CategoryCustomeDropDownButton(
      {required this.dropDownItems,
      required this.value,
      required this.onChanged});

  // late OrdersBloc ordersBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
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
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                return DropdownButtonFormField(

                    // focusColor: Theme.of(context).primaryColor,
                    dropdownColor: Colors.white,
                    // icon: Icon(Icons.category_outlined),
                    value: this.value,
                    items: this.dropDownItems,
                    onChanged: (value) {
                      Category category = value as Category;
                      print(
                          "+++++++++++++++++++++++++++++++++++++_______Broker Category Seelction with value ${category.toJson()}");
                      // this.onChanged(value);
                      registerBloc
                          .add(AddBrokerType(category: value));
                    },
                    hint: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                       LocaleKeys.select_an_item_label_text.tr(),
                        textAlign: TextAlign.center,
                      ),
                    ));
              },
            )),
      ),
    );
  }
}
