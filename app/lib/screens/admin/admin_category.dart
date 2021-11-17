import 'package:app/Widget/common/admin_category_addUpdate.dart';
import 'package:app/bloc/category/bloc/category_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategory extends StatefulWidget {
  static const routeName = '/admin-category';
  AdminCategory({Key? key}) : super(key: key);

  @override
  State<AdminCategory> createState() => _AdminCategoryState();
}

class _AdminCategoryState extends State<AdminCategory> {
  // late CategoryBloc categoryBloc;
  @override
  void initState() {
    super.initState();
     BlocProvider.of<CategoryBloc>(context).add(FetchCategories());
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(backgroundColor: primaryColor, title: Text("Categories")),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$state");
          if (state is CategoryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryLoadFailed) {
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: primaryColor,
                ),
                Text(
                  "Something went wrong",
                  style: TextStyle(fontSize: 20.0, color: primaryColor),
                )
              ],
            ));
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: ListView(
              children: state.category
                  .map((category) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.category),
                            title: Text(category.catigoryName!),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.edit,
                              ),
                              onPressed: () {
                                debugPrint("Editing");
                                showDialog(
                                  context: context,
                                  builder: (context) => AdminCategoryAddUpdate(
                                    isEdit: true,
                                    category: category,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AdminCategoryAddUpdate(
                    isEdit: false,
                  ));
        },
        child: Icon(
          Icons.add,
          color: lightColor,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
