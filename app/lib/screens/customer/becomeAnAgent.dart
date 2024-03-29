// import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/Widget/Auth/signup/register-button.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/model/broker/category.dart';
import 'package:app/screens/Registeration/BrokerAdditionalDetail/Components/categories-dropdown-button.dart';
import 'package:app/screens/login.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:app/Widget/Auth/signup/signUpTextField.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../../constants.dart';
import 'drawer.dart';
import 'package:easy_localization/easy_localization.dart';

class BecomeAnAgent extends StatefulWidget {
  static const routeName = '/agent';

  @override
  _BecomeAnAgentState createState() => _BecomeAnAgentState();
}

class _BecomeAnAgentState extends State<BecomeAnAgent> {
  // TextEditingController fullNameController = new TextEditingController();
  // TextEditingController category = new TextEditingController();
  // TextEditingController phoneNumberController = new TextEditingController();
  // TextEditingController cityControler = new TextEditingController();
  // TextEditingController emailController = new TextEditingController();
  // TextEditingController profilePicController = new TextEditingController();

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
  Category? brokeringCategory;
  @override
  Widget build(BuildContext context) {
    String type = 'Broker';
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      drawer: AppDrawer(),
      body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                              LocaleKeys.broker_skills_registration_label_text
                                  .tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.02,
                        // ),

                        ProgressHUD(
                          child: BlocConsumer<RegisterBloc, RegisterState>(
                            listener: (context, state) {
                              // TODO: implement listener
                              // if(state is )
                              if (state is BeingAnAgentCreating) {
                                final progress = ProgressHUD.of(context);
                                // if (!isShowing) {
                                //   if (progress != null) {
                                //     setState(() {
                                //       isShowing = true;
                                //     });
                                // }
                                progress!.showWithText(
                                    LocaleKeys.createing_label_text.tr());
                              } else if (state is BeingAnAgentSucess) {
                                // this.isShowing = false;
                                // registerBloc.add(Initialization());
                                Navigator.popAndPushNamed(
                                    context, Login.routeName);
                                // return Container(child: Text("Created Successfully"));
                              } else if (state is BeingAnAgentFailed) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: LocaleKeys.failed_to_create_label_text
                                      .tr(),
                                  desc: LocaleKeys
                                      .something_went_wrong_label_text
                                      .tr(),
                                  // btnCancelOnPress: () {
                                  //   Navigator.popAndPushNamed(context, Login.routeName);
                                  // },
                                  btnOkOnPress: () {
                                    // Navigator.pop(context);
                                    // Navigator.pop()
                                    Navigator.popAndPushNamed(
                                        context, Login.routeName);
                                    registerBloc.add(Initialization());
                                  },
                                )..show();
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  padding: EdgeInsets.only(
                                      left: 0.5, right: 0.5, top: 25),
                                  child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                        CategoryDropDownButton(
                                          changeCategory: (Category value) {
                                            setState(() {
                                              brokeringCategory = value;
                                            });
                                          },
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
                                          keyboardType: TextInputType.text,
                                          textFieldName: LocaleKeys
                                              .communicative_skills_label_text
                                              .tr(),
                                          controller: communicationController,
                                          initialValue: '',
                                          validator: null,
                                          obsecureText: false,
                                          isRequired: false,
                                          onChanged: (String value) {},
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
                                            textFieldName: LocaleKeys
                                                .broking_skills_label_text
                                                .tr(),
                                            controller:
                                                brookingSkillsController,
                                            initialValue: '',
                                            validator: null,
                                            obsecureText: false,
                                            isRequired: false,
                                            onChanged: (String value) {
                                              print("Write: $value");
                                            }),
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
                                            textFieldName: LocaleKeys
                                                .work_done_label_text
                                                .tr(),
                                            controller: workDoneController,
                                            initialValue: '',
                                            validator: null,
                                            obsecureText: false,
                                            isRequired: false,
                                            onChanged: (String value) {}),
                                        // SizedBox(
                                        //   height: MediaQuery.of(context).size.height * 0.02,
                                        // ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        CustomTextField(
                                            minLength: 0,
                                            textFieldName: LocaleKeys
                                                    .Work_in_progress_label_text
                                                .tr(),
                                            keyboardType: TextInputType.text,
                                            controller:
                                                workInProgressController,
                                            initialValue: '',
                                            enabled: true,
                                            validator: null,
                                            obsecureText: false,
                                            isRequired: false,
                                            onChanged: (String value) {
                                              print("Write: $value");
                                              // workInProgressController.text=value;
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
                                              0.05,
                                        ),
                                        RegisterButton(
                                          name: LocaleKeys.submit_btn_label_text
                                              .tr(),
                                          onTapped: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print(
                                                  "Register method called from the broker page");
                                              registerBloc.add(BecomeAgent());
                                            }
                                          },
                                        )
                                      ])));
                            },
                          ),
                        )
                      ])))),
    );
  }
}
