import 'package:app/Widget/Auth/signup/signp-customeDropDown.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SexDropDown extends StatefulWidget {
  // final TextEditingController payingTimeController;
  // PaymentTimeDropDown({required this.payingTimeController});
  @override
  _SexDropDownState createState() => _SexDropDownState();
}

class _SexDropDownState extends State<SexDropDown> {
  String value = 'Pay Later';
  // late OrdersBloc ordersBloc;
  @override
  Widget build(BuildContext context) {
    // ordersBloc = BlocProvider.of<OrdersBloc>(context);
    return CustomeDropDownButton(
      dropDownItems: [
        DropdownMenuItem(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0),
              child: Text(
                "Male",
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
                "Female",
                textAlign: TextAlign.start,
              ),
            ),
          ),
          value: "Female",
        ),
      ],
      onChanged: () {},
      value: "Male",
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
