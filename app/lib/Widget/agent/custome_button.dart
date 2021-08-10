import 'package:app/constants/login/size.dart';
import 'package:app/screens/customer/customerPage.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
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
            AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Done',
              desc: 'Your have successfully registered for an agent',
              btnOkOnPress: () {
                Navigator.popAndPushNamed(context, CustomerPage.routeName);
              },
            )..show();
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
                'Submit',
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
