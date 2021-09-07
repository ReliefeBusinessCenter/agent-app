import 'package:app/Widget/Auth/signup/signp-customeDropDown.dart';
import 'package:app/bloc/category/bloc/category_bloc.dart';
import 'package:app/model/category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDropDownButton extends StatefulWidget {
  // final TextEditingController payingTimeController;
  // PaymentTimeDropDown({required this.payingTimeController});
  @override
  _CategoryDropDownButtonState createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  late CategoryBloc categoryBloc;
  String value = 'Pay Later';
  // late OrdersBloc ordersBloc;
  @override
  Widget build(BuildContext context) {
    // ordersBloc = BlocProvider.of<OrdersBloc>(context);
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
    categoryBloc.add(FetchCategories());
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        List<DropdownMenuItem<String>> dropDownItems = [];
        print("Data at the screen: ${state.category}");
        for (int i = 0; i < state.category.length; i++) {
          Category category = state.category[i] as Category;
          print("Category: ${category.catigoryName}");

          dropDownItems.add(DropdownMenuItem(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: Text(
                  category.catigoryName.toString(),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            value: category.catigoryName.toString(),
          ));

          // onChanged: this.onChanged,

          // value:state.request.paymentWhen as String,

        }
        if (state is CategoryLoadSuccess) {
          return CustomeDropDownButton(
            dropDownItems: dropDownItems,
            onChanged: () {},
            value: state.category[0].catigoryName.toString(),
            // onChanged: this.onChanged,

            // value:state.request.paymentWhen as String,
          );
        } else if (state is CategoryLoading) {
          return CircularProgressIndicator();
        }
        return Container();
      },
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
