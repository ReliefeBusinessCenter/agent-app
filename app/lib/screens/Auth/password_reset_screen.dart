import 'package:app/Widget/Auth/auth-export.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatelessWidget {
  static String routeName = "/passowrd-reset";

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    double fontSize1 = height * 0.04;

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Expanded(
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
              EmailTextField(
                myemailController: emailController,
              ),
              SizedBox(
                height: height * 0.06,
              ),
              NextButton(),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
