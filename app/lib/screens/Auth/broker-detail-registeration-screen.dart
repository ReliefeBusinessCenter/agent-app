import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/Widget/Auth/signup/register-button.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/screens/Auth/customer-detail-registeration-screen.dart';
import 'package:app/screens/broker/broker_location_page.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'login.dart';

// ignore: must_be_immutable
class BrokerDetailScreen extends StatefulWidget {
  static const routeName = '/broker-detail';

  @override
  State<BrokerDetailScreen> createState() => _BrokerDetailScreenState();
}

class _BrokerDetailScreenState extends State<BrokerDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController communicationController =
      new TextEditingController();

  final TextEditingController brookingSkillsController =
      new TextEditingController();

  final TextEditingController workDoneController = new TextEditingController();

  final TextEditingController workInProgressController =
      new TextEditingController();

  late RegisterBloc registerBloc;

  final TextEditingController _aboutController = new TextEditingController();
  double _latitude = 0.0;
  double _longitude = 0.0;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.broker_detail_label_text.tr()),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ProgressHUD(
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterCreateLoading) {
              final progress = ProgressHUD.of(context);
              // if (!isShowing) {
              //   if (progress != null) {
              //     setState(() {
              //       isShowing = true;
              //     });

              // }
              progress!.showWithText("Creating");
            } else if (state is RegisterCreateSuccess) {
              // this.isShowing = false;

              Navigator.popAndPushNamed(context, Login.routeName);
              // return Container(child: Text("Created Successfully"));
            } else if (state is RegisterCreateFailed) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.ERROR,
                animType: AnimType.BOTTOMSLIDE,
                title: LocaleKeys.order_creating_failed_label_text.tr(),
                desc: LocaleKeys.fill_all_the_information_carefully_label_text
                    .tr(),
                btnCancelOnPress: () {
                  Navigator.popAndPushNamed(context, Login.routeName);
                },
                btnOkOnPress: () {
                  Navigator.popAndPushNamed(context, Login.routeName);
                },
              )..show();
            }
          },
          builder: (context, state) {
            return Padding(
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
                      child: Column(
                        children: [
                          Container(
                            // alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.05,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular((30)),
                                  topRight: Radius.circular((30))),
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Text(
                                LocaleKeys.broker_skills_registration_label_text
                                    .tr(),
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
                                    enabled: true,
                                    textFieldName: LocaleKeys
                                        .communication_label_text
                                        .tr(),
                                    controller: communicationController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      registerBloc.add(AddCommunicationSkills(
                                          skill: double.parse(value)));
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                      minLength: 0,
                                      keyboardType: TextInputType.number,
                                      enabled: true,
                                      textFieldName:
                                          LocaleKeys.broker_label_text.tr(),
                                      controller: brookingSkillsController,
                                      initialValue: '',
                                      validator: null,
                                      obsecureText: false,
                                      isRequired: false,
                                      onChanged: (String value) {
                                        print("Write: $value");
                                        registerBloc.add(AddBrookingSkills(
                                            skill: double.parse(value)));
                                      }),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                      minLength: 0,
                                      textFieldName:
                                          LocaleKeys.work_done_label_text.tr(),
                                      keyboardType: TextInputType.text,
                                      controller: workDoneController,
                                      initialValue: '',
                                      enabled: true,
                                      validator: null,
                                      obsecureText: false,
                                      isRequired: false,
                                      onChanged: (String value) {
                                        print("Write: $value");
                                        registerBloc.add(AddWorkDone(
                                            skill: double.parse(value)));
                                      }),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomTextField(
                                    minLength: 0,
                                    enabled: true,
                                    textFieldName: LocaleKeys
                                        .Work_in_progress_label_text.tr(),
                                    keyboardType: TextInputType.text,
                                    controller: workInProgressController,
                                    initialValue: '',
                                    validator: null,
                                    obsecureText: false,
                                    isRequired: false,
                                    onChanged: (String value) {
                                      print("Write: $value");
                                      registerBloc.add(AddWorkInProgress(
                                          skill: double.parse(value)));
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: TextFormField(
                                      maxLines: 6,
                                      onChanged: (value) {
                                        registerBloc.add(AddAbout(value));
                                      },
                                      decoration: InputDecoration(
                                        labelText: LocaleKeys
                                            .tell_us_about_your_self_label_text
                                            .tr(),
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(7.0),
                                          borderSide: new BorderSide(),
                                        ),
                                        //fillColor: Colors.green
                                        contentPadding: EdgeInsets.only(
                                          top: 6,
                                          bottom: 6,
                                          left: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // ProfileFileInput(
                                  //   controller: fileController,
                                  //   isRequired: true,
                                  //   onPressed: () {},
                                  //   textFieldName: '',
                                  // ),
                                  Text("Lat: $_latitude"),
                                  Text("Long: $_longitude"),

                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  ElevatedButton(
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

                                      debugPrint(
                                          "=============================================================The result is ${result.latitude}");
                                      debugPrint(
                                          "=============================================================The result is ${result.longitude}");
                                      debugPrint(
                                          "=============================================================The result is ${result.address}");
                                    },
                                  ),
                                  RegisterButton(
                                    name: LocaleKeys.next_btn_label_text.tr(),
                                    onTapped: () {
                                      if (_formKey.currentState!.validate()) {
                                        print(
                                            "Register method called from the broker page");
                                        Navigator.pushNamed(context,
                                            CustomerDetailScreen.routeName);
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
