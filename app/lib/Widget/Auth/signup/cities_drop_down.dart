import 'package:app/Widget/Auth/signup/signp-customeDropDown.dart';
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
    return CustomeDropDownButton(
      dropDownItems: cities
          .map((city) => DropdownMenuItem<String>(
              child: Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: Text(city),
              ),
              value: city))
          .toList(),
      onChanged: (value) {
        // setState(() {
        //   _selectedName = value;
        // });
        registerBloc.add(AddCity(city: value));
      },
      value: "Dire Dawa",
    );
  }
}
