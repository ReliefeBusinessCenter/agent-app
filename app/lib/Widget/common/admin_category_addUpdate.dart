import 'package:flutter/material.dart';

class AdminCategoryAddUpdate extends StatefulWidget {
  String? name;
  bool isEdit;
  AdminCategoryAddUpdate({required this.isEdit, this.name, Key? key})
      : super(key: key);

  @override
  _AdminCategoryAddUpdateState createState() => _AdminCategoryAddUpdateState();
}

class _AdminCategoryAddUpdateState extends State<AdminCategoryAddUpdate> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      child: AlertDialog(
        content: Form(
          child: TextFormField(
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: widget.isEdit ? Text("Update") : Text("Add"),
          )
        ],
      ),
    );
  }
}
