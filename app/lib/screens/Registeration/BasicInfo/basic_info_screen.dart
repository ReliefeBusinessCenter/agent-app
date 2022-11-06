import 'package:app/screens/Registeration/BasicInfo/Components/cities_drop_down.dart';
import 'package:app/Widget/Auth/signup/next-button.dart';
import 'package:app/screens/Registeration/BasicInfo/Components/role-dropdown.dart';
import 'package:app/screens/Registeration/BasicInfo/Components/sex-dropdown.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/bloc/user/bloc/user_bloc.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/city.dart';
import 'package:app/screens/broker/broker_location_page.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:easy_localization/easy_localization.dart';

import '../BrokerAdditionalDetail/brokers_details_screen.dart';
import '../DetailInfo/detail_info.dart.dart';

class SignUpPageScreen extends StatefulWidget {
  static const routeName = '/signup';
  final String phoneNumber;
  SignUpPageScreen({required this.phoneNumber});
  @override
  _SignUpPageScreenState createState() => _SignUpPageScreenState();
}

class _SignUpPageScreenState extends State<SignUpPageScreen> {
  final TextEditingController nameController = new TextEditingController();

  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController phoneController = new TextEditingController();

  final TextEditingController addressController = new TextEditingController();

  final TextEditingController cityController = new TextEditingController();

  final TextEditingController subCityController = new TextEditingController();

  final TextEditingController kebeleController = new TextEditingController();

  String sex = 'Male';
  String role = 'Customer';

  final _formKey = GlobalKey<FormState>();

  late RegisterBloc registerBloc;

  double _latitude = 0.0;
  double _longitude = 0.0;
  late UserBloc userBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.phoneController.text = widget.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(LocaleKeys.be_a_potential_user_label_text.tr()),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  // padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          // alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.05,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular((30)),
                                topRight: Radius.circular((30))),
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: Text(
                              LocaleKeys.register_to_continue_label_text.tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          padding:
                              EdgeInsets.only(left: 0.5, right: 0.5, top: 25),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomTextField(
                                  minLength: 0,
                                  textFieldName:
                                      LocaleKeys.fullname_label_text.tr(),
                                  enabled: true,
                                  controller: nameController,
                                  initialValue: '',
                                  validator: null,
                                  obsecureText: false,
                                  isRequired: false,
                                  onChanged: (String value) {},
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CitiesDropDown(
                                  changeCity: (City value) {
                                    cityController.text =
                                        value.cityName.toString();
                                  },
                                  cityController: cityController,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    textFieldName:
                                        LocaleKeys.subcity_label_text.tr(),
                                    keyboardType: TextInputType.text,
                                    controller: subCityController,
                                    enabled: true,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {}),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                CustomTextField(
                                    minLength: 0,
                                    enabled: true,
                                    textFieldName:
                                        LocaleKeys.kebele_label_text.tr(),
                                    keyboardType: TextInputType.number,
                                    controller: kebeleController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {}),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                SexDropDown(
                                  changeSex: (String value) {
                                    setState(() {
                                      sex = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                RoleDropDown(
                                  changeRole: (String value) {
                                    setState(() {
                                      role = value;
                                    });
                                  },
                                ),
                                Text("Lat: $_latitude"),
                                Text("Long: $_longitude"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: ElevatedButton(
                                    child: const Text("choose location"),
                                    onPressed: () async {
                                      Position position =
                                          await Geolocator.getCurrentPosition(
                                              desiredAccuracy:
                                                  LocationAccuracy.high);
                                      Location locationObject = Location(
                                        latitude: position.latitude,
                                        longitude: position.longitude,
                                        timestamp: DateTime.now(),
                                      );

                                      LocationArgument result =
                                          await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MapScreen(
                                            location: locationObject,
                                          ),
                                        ),
                                      );

                                      setState(() {
                                        _latitude = result.latitude;
                                        _longitude = result.longitude;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Next(
                            child: Center(
                              child: Text(LocaleKeys.next_btn_label_text.tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            onTapped: () {
                              if (_formKey.currentState!.validate()) {
                                print("Validated successfully");
                                print("User Type: $role");
                                User user = User();
                                user.fullName = nameController.text;
                                user.city = cityController.text;
                                user.subCity = subCityController.text;
                                user.kebele = kebeleController.text;
                                user.phone = phoneController.text;
                                user.sex = sex;
                                user.role = role;
                                user.latitude = _latitude;
                                user.longitude = _longitude;
                                registerBloc.add(AddBasicInfo(user: user));
                                if (role == 'Customer') {
                                  Navigator.pushNamed(
                                    context,
                                    DetailScreen.routeName,
                                  );
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    BrokerDetailScreen.routeName,
                                  );
                                }
                              }
                            }),
                      ]),
                    ),
                  )),
            )));
  }
}
