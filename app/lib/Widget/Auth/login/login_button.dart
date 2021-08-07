import 'package:app/constants/login/size.dart';
import 'package:app/screens/customerPage.dart';
import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String email;
  final String password;
  LoginButton({required this.email, required this.password});
  @override
  Widget build(BuildContext context) {
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: loginSize.getLoginButtonHeight,
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            print("On tap button is clicked");
            print("Email: $email");
            print("Password: $password");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomerPage()),
            );
          },

          // onTap: () => _pushPage(context, Register()),
          child: Material(
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            elevation: 1.0,
            child: Container(
              // padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),

              child: Center(
                  child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              )),
            ),
          ),
        ));
  }
}
