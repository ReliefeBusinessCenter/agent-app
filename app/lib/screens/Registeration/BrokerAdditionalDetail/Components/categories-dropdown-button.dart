import 'package:app/bloc/category/bloc/category_bloc.dart';
import 'package:app/model/broker/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'categpry_custome_dropdown.dart';

class CategoryDropDownButton extends StatefulWidget {
  final ValueChanged<Category> changeCategory;
  CategoryDropDownButton({required this.changeCategory});
  @override
  _CategoryDropDownButtonState createState() => _CategoryDropDownButtonState();
}

class _CategoryDropDownButtonState extends State<CategoryDropDownButton> {
  late CategoryBloc categoryBloc;
  Category? selectedBrokingCategory;
  @override
  Widget build(BuildContext context) {
    categoryBloc = BlocProvider.of<CategoryBloc>(context);

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadSuccess) {
          List<DropdownMenuItem<Category>> dropDownItems = [];
          if (state.category.isNotEmpty) {
            for (int i = 0; i < state.category.length; i++) {
              Category category = state.category[i];

              dropDownItems.add(
                DropdownMenuItem(
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
                ),
              );
              // onChanged: this.onChanged,
              // value:state.request.paymentWhen as String,
            }
          } else {
            dropDownItems.add(
              DropdownMenuItem(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(
                      'Select category',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                value: Category(categoryId: 1, catigoryName: 'select category'),
              ),
            );
          }

          return CategoryCustomeDropDownButton(
              dropDownItems: dropDownItems,
              onChanged: (Category value) {
                setState(() {
                  selectedBrokingCategory = value;
                });
              },
              value: state.category[0]);
        } else if (state is CategoryLoading) {
          return CircularProgressIndicator();
        }
        return Container();
      },
    );
  }
}
