import 'package:app/Widget/Auth/auth-export.dart';
import 'package:app/logic/login/login.dart';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  void loginHandler(BuildContext context) {
    print("Login Handler state");
    print("Email:${emailController.text}");
    print("Password:${passwordController.text}");
    LoginLogic(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .build(context);
  }

  @override
  Widget build(BuildContext context) {
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
              CustomTextField(
                  textFieldName: "Enter Email",
                  controller: emailController,
                  isObsecure: false,
                  icon: Icon(
                    Icons.email,
                    color: Colors.black,
                  )),
              SizedBox(height: height * 0.01),
              passwordTextField,
              SizedBox(
                height: height * 0.06,
              ),
              LoginButton(onPressed: () => loginHandler(context)),
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
