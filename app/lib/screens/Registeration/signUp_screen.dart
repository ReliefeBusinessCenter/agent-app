import 'package:app/Widget/Auth/signup/broker/categories-dropdown-button.dart';
import 'package:app/Widget/Auth/signup/cities_drop_down.dart';
import 'package:app/Widget/Auth/signup/next-button.dart';
import 'package:app/Widget/Auth/signup/role-dropdown.dart';
import 'package:app/Widget/Auth/signup/sex-dropdown.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/bloc/user/bloc/user_bloc.dart';
import 'package:app/screens/broker/broker_location_page.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:easy_localization/easy_localization.dart';

import 'broker-detail-registeration-screen.dart';
import 'customer-detail-registeration-screen.dart';

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

  final _formKey = GlobalKey<FormState>();

  late RegisterBloc registerBloc;

  String type = 'Customer';
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
                                  onChanged: (String value) {
                                    print("Write: ${value}");
                                    registerBloc.add(AddName(name: value));
                                  },
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
                                CitiesDropDown(),
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
                                    onChanged: (String value) {
                                      print("Write: ${value}");
                                      registerBloc
                                          .add(AddSubCity(subCity: value));
                                    }),
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
                                    onChanged: (String value) {
                                      registerBloc
                                          .add(AddKebele(kebele: value));
                                    }),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                SexDropDown(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                RoleDropDown(),
                                BlocConsumer<RegisterBloc, RegisterState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    if (state is RegisterUpdateSuccess) {
                                      if (state.user!.role == "Broker") {
                                        type = 'Broker';
                                      } else if (state.user!.role ==
                                          "Customer") {
                                        type = 'Customer';
                                      }
                                      return Visibility(
                                          visible: state.user!.role == "Broker"
                                              ? true
                                              : false,
                                          child: CategoryDropDownButton());
                                    }

                                    return Visibility(
                                        visible: state.user!.role == "Broker"
                                            ? true
                                            : false,
                                        child: CategoryDropDownButton());
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

                                      registerBloc.add(AddLatitudeLongitude(
                                          latitude: result.latitude,
                                          longitude: result.longitude));
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
                                print("User Type: $type");
                                if (type == 'Customer') {
                                  Navigator.pushNamed(
                                    context,
                                    CustomerDetailScreen.routeName,
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

  void validate() {
    final _formKey = GlobalKey<FormState>();
  }
}
