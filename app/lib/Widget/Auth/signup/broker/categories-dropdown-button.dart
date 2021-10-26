import 'package:app/Widget/Auth/signup/signp-customeDropDown.dart';
import 'package:app/bloc/category/bloc/category_bloc.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/model/broker/category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categpry_custome_dropdown.dart';

class CategoryDropDownButton extends StatefulWidget {
  // final TextEditingController payingTimeController;
  // PaymentTimeDropDown({required this.payingTimeController});
  @override
  _CategoryDropDownButtonState createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  late CategoryBloc categoryBloc;
  late RegisterBloc registerBloc;
  Category? value = null;
  // late OrdersBloc ordersBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    // ordersBloc = BlocProvider.of<OrdersBloc>(context);
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
   
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        // if()
        List<DropdownMenuItem<Category>> dropDownItems = [];
        print("Data at the screen: ${state.category}");
        for (int i = 0; i < state.category.length; i++) {
          Category category = state.category[i];
          print("Category: ${category.categoryId}");

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
            value: category,
          ));

          // onChanged: this.onChanged,

          // value:state.request.paymentWhen as String,

        }
        if (state is CategoryLoadSuccess) {
          return CategoryCustomeDropDownButton(
              dropDownItems: dropDownItems,
              onChanged: () {},
              value: state.category[0]
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

  void onChanged(Category value) {
    print(
        "+++++++++++++++++++++++++++++++++++++_______Broker Category Seelction");
    setState(() {
      value = value as Category;
      // print(widget.dropDownItems[_value].chil);
    });

    registerBloc.add(AddBrokerType(category: value));
  }
}
