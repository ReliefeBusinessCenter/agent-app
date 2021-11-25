import 'package:app/Widget/Auth/signup/signp-customeDropDown.dart';
import 'package:app/bloc/city/bloc/city_bloc.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/constants/customer-page/cities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitiesDropDown extends StatefulWidget {
  const CitiesDropDown({Key? key}) : super(key: key);

  @override
  _CitiesDropDownState createState() => _CitiesDropDownState();
}

class _CitiesDropDownState extends State<CitiesDropDown> {
  late RegisterBloc registerBloc;
  // String _selectedName = "Dire Dawa";
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<CityBloc, CityState>(
      builder: (context, state) {
        if (state is CityLoadSuccess) {
          return CustomeDropDownButton(
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
              // setState(() {
              //   _selectedName = value;
              // });
              registerBloc.add(AddCity(city: value));
            },
            value: state.cities.first.cityName!,
          );
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
