import 'package:app/Widget/Auth/signup/customeDropDown.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class PaymentOptionDropDown extends StatefulWidget {
  final TextEditingController paymentOptionController;
  PaymentOptionDropDown({required this.paymentOptionController});
  @override
  _PaymentOptionDropDownState createState() => _PaymentOptionDropDownState();
}

class _PaymentOptionDropDownState extends State<PaymentOptionDropDown> {
  String value = 'On Hand';
  late RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.payment_option_label_text.tr()),
        SizedBox(height: MediaQuery.of(context).size.height * 0.001),
        CustomeDropDownButton(
          dropDownItems: [
            DropdownMenuItem(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    LocaleKeys.via_cash_label_text.tr(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              value: "On Hand",
            ),
            DropdownMenuItem(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    LocaleKeys.via_bank_label_text.tr(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              value: "Via Bank",
            ),
          ],
          onChanged: (value) {
            print("Value: ${value}");
            // registerBloc.add(AddTypeUser(userType: value));
            setState(() {
              this.value = value;
              widget.paymentOptionController.text = value;
            });
          },
          value: this.value,
          // onChanged: this.onChanged,

          // value:state.request.paymentWhen as String,
        ),
      ],
    );
  }

  void onChanged(String? value) {
    print("payment time on changed method");
    setState(() {
      value = value;
      // print(widget.dropDownItems[_value].chil);
    });

    // ordersBloc.add(AddPaymentWhenEvent(when: value as String));
    // BlocListener<OrdersBloc, OrdersState>(
    //   listener: (context, state) {
    //     // TODO: implement listener
    //     print("Updated state ${state.request}");
    //   },
    //   child: Container(),
    // );
  }
}
