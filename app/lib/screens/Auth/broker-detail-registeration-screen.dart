import 'package:app/Widget/Auth/signup/add_profile_picture.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:app/Widget/Auth/signup/register-button.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/screens/Auth/customer-detail-registeration-screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'login.dart';

class BrokerDetailScreen extends StatelessWidget {
  static const routeName = '/broker-detail';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController communicationController =
      new TextEditingController();
  final TextEditingController brookingSkillsController =
      new TextEditingController();
  final TextEditingController workDoneController = new TextEditingController();
  final TextEditingController workInProgressController =
      new TextEditingController();

  late RegisterBloc registerBloc;
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Broker Detail Screen"),
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
                  title: 'Order Creating failed',
                  desc: 'Fill all the information carefully!',
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
                                  child: Column(children: [
                                    Container(
                                      // alignment: Alignment.topCenter,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,

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
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                        child: Text(
                                          "Broker Skills Registeration!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.7,
                                        padding: EdgeInsets.only(
                                            left: 0.5, right: 0.5, top: 25),
                                        child: SingleChildScrollView(
                                            child: Column(children: [
                                          CustomTextField(
                                            minLength: 0,
                                            enabled: true,
                                            textFieldName:
                                                'Communication Skills',
                                            controller: communicationController,
                                            initialValue: '',
                                            validator: null,
                                            obsecureText: false,
                                            isRequired: false,
                                            onChanged: (String value) {
                                              registerBloc.add(
                                                  AddCommunicationSkills(
                                                      skill:
                                                          double.parse(value)));
                                            },
                                            keyboardType: TextInputType.text,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          CustomTextField(
                                              minLength: 0,
                                              keyboardType: TextInputType.text,
                                              enabled: true,
                                              textFieldName: 'Brooking Skills',
                                              controller:
                                                  brookingSkillsController,
                                              initialValue: '',
                                              validator: null,
                                              obsecureText: false,
                                              isRequired: false,
                                              onChanged: (String value) {
                                                print("Write: $value");
                                                registerBloc.add(
                                                    AddBrookingSkills(
                                                        skill: double.parse(
                                                            value)));
                                              }),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          CustomTextField(
                                              minLength: 0,
                                              textFieldName: 'Work Done',
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
                                                    skill:
                                                        double.parse(value)));
                                              }),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          CustomTextField(
                                              minLength: 0,
                                              enabled: true,
                                              textFieldName: 'Work In Progress',
                                              keyboardType: TextInputType.text,
                                              controller:
                                                  workInProgressController,
                                              initialValue: '',
                                              validator: null,
                                              obsecureText: false,
                                              isRequired: false,
                                              onChanged: (String value) {
                                                print("Write: $value");
                                                registerBloc.add(
                                                    AddWorkInProgress(
                                                        skill: double.parse(
                                                            value)));
                                              }),
                                          // ProfileFileInput(
                                          //   controller: fileController,
                                          //   isRequired: true,
                                          //   onPressed: () {},
                                          //   textFieldName: '',
                                          // ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          RegisterButton(
                                            name: "Next",
                                            onTapped: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                print(
                                                    "Register method called from the broker page");
                                                Navigator.pushNamed(
                                                    context,
                                                    CustomerDetailScreen
                                                        .routeName);
                                              }
                                            },
                                          )
                                        ])))
                                  ]))))));
            },
          ),
        ));
  }
}
