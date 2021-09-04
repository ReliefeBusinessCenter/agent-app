import 'package:app/Widget/Auth/signup/signp-customeDropDown.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleDropDown extends StatefulWidget {
  // final TextEditingController payingTimeController;
  // PaymentTimeDropDown({required this.payingTimeController});
  @override
  _RoleDropDownState createState() => _RoleDropDownState();
}

class _RoleDropDownState extends State<RoleDropDown> {
  String value = 'Pay Later';
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
                "Customer",
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
                "Broker",
                textAlign: TextAlign.start,
              ),
            ),
          ),
          value: "Broker",
        ),
      ],
      onChanged: (value) {
        registerBloc.add(AddTypeUser(userType: value));
      },
      value: "Customer",
      // onChanged: this.onChanged,

      // value:state.request.paymentWhen as String,
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
