import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = new TextEditingController();
    TextEditingController emailController = new TextEditingController();

    EmailTextField emailTextField = new EmailTextField(
      myemailController: emailController,
    );
    PasswordTextField passwordTextField =
        new PasswordTextField(mypasswordController: passwordController);
    Size screenSize = MediaQuery.of(context).size;
    double height = screenSize.height;
    double width = screenSize.width;
    double fontSize1 = height * 0.04;

    return Scaffold(
      backgroundColor: Color(0xFFf2f6f9),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Welcome(),
              SizedBox(
                height: height * 0.04,
              ),
              LoginText(),
              SizedBox(
                height: height * 0.06,
              ),
              emailTextField,
              SizedBox(height: height * 0.01),
              passwordTextField,
              SizedBox(
                height: height * 0.06,
              ),
              LoginButton(
                email: emailController.text,
                password: passwordController.text,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ResetPasswordOption()
            ],
          ),
        ),
      ),
    );
  }
}
