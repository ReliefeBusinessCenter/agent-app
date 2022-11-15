import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/Widget/Auth/signup/register-button.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/screens/Registeration/DetailInfo/Components/upload_id_image.dart';
import 'package:app/screens/Registeration/DetailInfo/Components/upload_profile_image.dart';
import 'package:app/Widget/common/constants.dart';
import 'package:app/bloc/register/bloc/register_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/screens/login.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Components/confirm_password_text_field.dart';
import 'Components/password_text_field.dart';
import 'Components/top_label_text.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/customer-detail';
  final String phoneNumber;
  DetailScreen({required this.phoneNumber});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final _formKey = GlobalKey<FormState>();
    bool registerLoading = false;

  final TextEditingController passwordController = new TextEditingController();

  final TextEditingController confirmPasswordController =
      new TextEditingController();

  final TextEditingController photoController = new TextEditingController();
  final TextEditingController idController = new TextEditingController();

  late RegisterBloc registerBloc;

  bool _passwordObscured = true;
  bool _confirmObscured = true;

  bool _choose = false;
  @override
void dispose() {
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(LocaleKeys.password_registration_label_text.tr()),
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
                  child: Column(
                    children: [
                      TopLabelText(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        padding:
                            EdgeInsets.only(left: 0.5, right: 0.5, top: 25),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              PasswordTextField(
                                changePassword: (String value) {
                                  passwordController.text = value;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              ConfirmPasswordTextField(
                                onConfirmPasswordChanged: (String value) {
                                  passwordController.text = value;
                                },
                                validator: (value) {
                                  if (value != passwordController.text) {
                                    return LocaleKeys
                                        .password_dont_match_label_text
                                        .tr();
                                  }
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                LocaleKeys.profile_photo_label_text.tr(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child: UploadProfileImage(pickImage: (image) {
                                  setState(() {
                                    photoController.text = image.path;
                                  });
                                }),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                LocaleKeys.id_photo_label_text.tr(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: UploadIDImage(pickImage: (image) {
                                  setState(() {
                                    idController.text = image.path;
                                  });
                                }),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              if (photoController.text.isEmpty)
                                Text(
                                  LocaleKeys.please_choose_image_label_text
                                      .tr(),
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              SizedBox(
                                height: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: BlocConsumer<RegisterBloc, RegisterState>(
                          listener: (context, state) {
                            if (state is RegisterCreateLoading) {
                              // final progress = ProgressHUD.of(context);

                              // progress!.showWithText("Creating");
                              
                             
                              setState(() {
                                registerLoading = true;

                              });
                            } else if (state is RegisterCreateSuccess) {
                              print(
                                  "Successfull registerd===================================================================================");

                              registerBloc.add(Initialization());
                             
                              // Navigator.of(context).pushNamedAndRemoveUntil(Login.routeName, (route) => false);
                              Navigator.pushNamed(context, Login.routeName);
                              ;
                            } else if (state is RegisterCreateFailed) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.BOTTOMSLIDE,
                                title: 'Failed to create Broker',
                                desc: 'Fill all the information carefully!',
                                // btnCancelOnPress: () {
                                //   Navigator.popAndPushNamed(context, Login.routeName);
                                // },
                                btnOkOnPress: () {
                                  // Navigator.pop(context);
                                  // Navigator.pop()
                                  Navigator.popAndPushNamed(
                                      context, DetailScreen.routeName);
                                  registerBloc.add(Initialization());
                                },
                              )..show();
                            }
                          },
                          builder: (context, state) {
                            return registerLoading?CircularProgressIndicator(
                              color: Colors.black,
                            )  : RegisterButton(
                              name: LocaleKeys.register_btn_label_text.tr(),
                              onTapped: () async {
                                // setState(() {
                                //   _choose = true;
                                // });
                                if (_formKey.currentState!.validate() &&
                                    photoController.text.isNotEmpty) {
                                  print(
                                      "Register method called from the customer apage");
                                  User user = registerBloc.user;
                                  user.password = passwordController.text;
                                  user.picture = photoController.text;
                                  user.identificationCard = idController.text;
                                  registerBloc.add(AddDetailInfo(user: user));
                                  registerBloc.add(RegisterUser());
                                }
                              },
                            );

                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
