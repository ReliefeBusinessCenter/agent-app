import 'package:app/Widget/Auth/signup/customeDropDown.dart';
import 'package:app/bloc/city/bloc/city_bloc.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/model/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesDropDown extends StatefulWidget {
  final TextEditingController cityController;
  final ValueChanged<City> changeCity;
  CitiesDropDown(
      {Key? key, required this.changeCity, required this.cityController})
      : super(key: key);

  @override
  _CitiesDropDownState createState() => _CitiesDropDownState();
}

class _CitiesDropDownState extends State<CitiesDropDown> {
  late RegisterBloc registerBloc;
  City? selectedCity;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state is CityLoadSuccess) {
          widget.cityController.text = state.cities.first.cityName!;
          return state.cities.isNotEmpty
              ? CustomeDropDownButton(
                  dropDownItems: state.cities
                      .map(
                        (city) => DropdownMenuItem<String>(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 11.0),
                            child: Text(city.cityName!),
                          ),
                          value: city.cityName,
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                      widget.changeCity(value);
                    });
                  },
                  value: state.cities.first.cityName!,
                )
              : CustomeDropDownButton(
                  dropDownItems: [],
                  value: "Addis Ababa",
                  onChanged: (value) {});
        }
        return CustomeDropDownButton(
          dropDownItems: [],
          value: "Addis Ababa",
          onChanged: () {},
        );
      },
    );
  }
}
