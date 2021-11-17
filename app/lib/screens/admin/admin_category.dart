import 'package:app/Widget/common/admin_category_addUpdate.dart';
import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';

class AdminCategory extends StatelessWidget {
  static const routeName = '/admin-category';
  const AdminCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _categories = [
      "Cars",
      "Constructions",
      "House",
      "Tour",
      "Cars",
      "Constructions",
      "House",
      "Tour",
    ];
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: _categories
              .map((category) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.category),
                        title: Text(category),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit,
                          ),
                          onPressed: () {
                            debugPrint("Editing");
                            showDialog(
                                context: context,
                                builder: (context) => AdminCategoryAddUpdate(isEdit: true,));
                          },
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: lightColor,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
