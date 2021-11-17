import 'package:app/bloc/category/bloc/category_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/model/broker/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryAddUpdate extends StatefulWidget {
  Category? category;
  bool isEdit;
  AdminCategoryAddUpdate({required this.isEdit, this.category, Key? key})
      : super(key: key);

  @override
  _AdminCategoryAddUpdateState createState() => _AdminCategoryAddUpdateState();
}

class _AdminCategoryAddUpdateState extends State<AdminCategoryAddUpdate> {
  final _formKey = GlobalKey<FormState>();
  late CategoryBloc _categoryBloc;
  String _name = '';
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) _name = widget.category!.catigoryName!;
  }

  @override
  Widget build(BuildContext context) {
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: AlertDialog(
        content: Form(
          key: _formKey,
          child: TextFormField(
            initialValue:
                widget.category == null ? null : widget.category!.catigoryName,
            onSaved: (value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Category name required!";
              } else if (value.length <= 3) {
                return "Category name too short!";
              }
            },
            decoration: InputDecoration(
              label: Text("Category Name"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
               
                if (widget.isEdit) {
                  debugPrint('The nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeis $_name');
                   Category _category = Category(
                  catigoryName: _name,
                  categoryId: widget.category!.categoryId,
                );
                  _categoryBloc.add(UpdateCategory(_category));
                  debugPrint('Editing');
                  Navigator.of(context).pop();
                } else {
                   Category _category = Category(
                  catigoryName: _name,
                );
                  _categoryBloc.add(AddCategory(_category));
                  debugPrint("Creating");
                  Navigator.of(context).pop();
                }
              }
            },
            child: widget.isEdit ? Text("Update") : Text("Add"),
          )
        ],
      ),
    );
  }
}
