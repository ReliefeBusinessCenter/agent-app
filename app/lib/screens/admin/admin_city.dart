import 'package:app/Widget/common/admin_category_addUpdate.dart';
import 'package:app/Widget/common/admin_city_add_update.dart';
import 'package:app/bloc/city/bloc/city_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCity extends StatefulWidget {
  AdminCity({Key? key}) : super(key: key);

  @override
  State<AdminCity> createState() => _AdminCityState();
}

class _AdminCityState extends State<AdminCity> {
  // late CategoryBloc categoryBloc;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CityBloc>(context).add(FetchCities());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(backgroundColor: primaryColor, title: Text("Cities")),
      body: BlocBuilder<CityBloc, CityState>(
        builder: (context, state) {
          print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!$state");
          if (state is CityLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CityLoadFailed) {
            print(state.message);
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
          } else if (state is CityLoadSuccess) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: ListView(
                children: state.cities
                    .map((city) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Icon(Icons.category),
                              title: Text(city.cityName!),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {
                                  debugPrint("Editing");
                                  showDialog(
                                    context: context,
                                    builder: (context) => AdminCityAddUpdate(
                                      isEdit: true,
                                      city: city,
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
          } else {
            return Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AdminCityAddUpdate(
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
