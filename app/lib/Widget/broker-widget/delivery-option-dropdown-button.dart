import 'package:app/Widget/Auth/signup/signp-customeDropDown.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryOptionDropDown extends StatefulWidget {
  final TextEditingController deliveryOptionController;
  DeliveryOptionDropDown({required this.deliveryOptionController});
  @override
  _DeliveryOptionDropDownState createState() => _DeliveryOptionDropDownState();
}

class _DeliveryOptionDropDownState extends State<DeliveryOptionDropDown> {
  String value = 'No';
  late RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Delivery Option'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.001),
        CustomeDropDownButton(
          dropDownItems: [
            DropdownMenuItem(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    "Yes",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              value: "Yes",
            ),
            DropdownMenuItem(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    "No",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              value: "No",
            ),
          ],
          onChanged: (value) {
            print("Value: ${value}");
            // registerBloc.add(AddTypeUser(userType: value));
            setState(() {
              this.value = value;
              widget.deliveryOptionController.text = value;
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
