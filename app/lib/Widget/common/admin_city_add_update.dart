import 'package:app/bloc/category/bloc/category_bloc.dart';
import 'package:app/bloc/city/bloc/city_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/model/city.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class AdminCityAddUpdate extends StatefulWidget {
  City? city;
  bool isEdit;
  AdminCityAddUpdate({required this.isEdit, this.city, Key? key})
      : super(key: key);

  @override
  _AdminCityAddUpdateState createState() => _AdminCityAddUpdateState();
}

class _AdminCityAddUpdateState extends State<AdminCityAddUpdate> {
  final _formKey = GlobalKey<FormState>();
  late CityBloc _cityBloc;
  String _name = '';

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) _name = widget.city!.cityName!;
  }

  @override
  Widget build(BuildContext context) {
    _cityBloc = BlocProvider.of<CityBloc>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: AlertDialog(
        content: Form(
          key: _formKey,
          child: TextFormField(
            initialValue: widget.city == null ? null : widget.city!.cityName,
            onSaved: (value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "City Name required!";
              }
            },
            decoration: InputDecoration(
              label: Text("City Name"),
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
                debugPrint('The nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeis $_name');

                if (widget.isEdit) {
                  debugPrint('The nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeis $_name');
                  City _city = City(
                    cityName: _name,
                    cityId: widget.city!.cityId,
                  );
                  _cityBloc.add(UpdateCity(_city));
                  debugPrint('Editing');
                  Navigator.of(context).pop();
                } else {
                  debugPrint('The nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeis $_name');
                  City _city = City(
                    cityName: _name,
                  );
                  _cityBloc.add(CreateCity(_city));
                  // debugPrint("Creating");
                  Navigator.of(context).pop();
                }
              }
            },
            child: widget.isEdit
                ? Text(LocaleKeys.update_button_label_text.tr())
                : Text(LocaleKeys.add_button_label_text.tr()),
          )
        ],
      ),
    );
  }
}
