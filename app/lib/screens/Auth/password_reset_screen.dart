import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/bloc/bloc/phoneverification_bloc.dart';
import 'package:app/bloc/user/bloc/user_bloc.dart';
import 'package:app/data_provider/firebase_phone_verifcation_data_provider.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/screens/Auth/auth_exports.dart';
import 'package:app/screens/common/verify_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordReset extends StatefulWidget {
  static String routeName = "/passowrd-reset";

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _phone = '';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    double fontSize1 = height * 0.04;
    final PhoneverificationBloc phoneverificationBloc =
        BlocProvider.of<PhoneverificationBloc>(context);
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserLoading) {
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is UserSuccess) {
              if (state.data is User) {
                User user = state.data;
                // Navigator.of(context).pop();
                print("usersuccess");
                final phoneState = phoneverificationBloc.state;
                phoneverificationBloc.add(VerifyPhone(
                    phoneNumber: "+251${user.phone!.substring(1)}",
                    context: context,
                    routeName: NewCredentialsScreen.routeName,
                    verificationType: VerificationType.reset
                    ));
              }
              // if (phoneState is PhoneVerificationSuccess) {

              //   PhoneArgument _phoneArgument = PhoneArgument(
              //       phone: user.phone!,
              //       routeName: PasswordReset.routeName,
              //       verificationID: phoneState.verificationId);
              //   Navigator.of(context).pushNamed(PhoneVerification.routeName,
              //       arguments: _phoneArgument);
              // }
            } else if (state is UserError) {
              print("Somthing happend");
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Welcome(),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  ForgotPassowrdText(),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  DescriptionText(),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Form(
                    key: _formKey,
                    child: Material(
                      color: Colors.white,
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Container(
                        width: width,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _phone = value;
                            });
                          },
                          // controller: emailController,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 14),
                            prefixIcon: Icon(Icons.phone),
                            border: InputBorder.none,
                            hintText: "Enter Phone",
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (state is UserError)
                    Text(
                      state.error,
                      style: TextStyle(color: Colors.red),
                    ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  NextButton(
                    onPressed: () {
                      _userBloc.add(GetUserByPhone(phone: _phone));
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
