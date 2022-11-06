import 'dart:async';

import 'package:app/constants/login/size.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/screens/admin/admin_main_page.dart';
import 'package:app/screens/broker/broker_main_page.dart';
import 'package:app/screens/customer/customerPage.dart';
import 'package:app/screens/login.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'Splash/welcome_page.dart';

class SplashScreen extends StatefulWidget {
  late final String title;
  static const routeName = "/trustbrokers/splashscreen";

  SplashScreen({required this.title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    UserPreferences _userPreferences = UserPreferences();
    _userPreferences.getUserInformation().then((loggedinUser) async {
      print("Done");
      Timer(Duration(milliseconds: 100), () {
        if (loggedinUser == null) {
          // print(loggedinUser!.user!.fullName);
          print("++++++++++++++++++++++++++++++++++++++++++++++++");
          print("User not logged in ");
          Navigator.of(context).pushNamedAndRemoveUntil(
              WelcomePage.routeName, (context) => false);
        } else {
          if (loggedinUser.user!.role == "Broker") {
            UserPreferences _userPreferences = UserPreferences();
            _userPreferences.getBrokerInformation().then((value) => {
                  if (value!.approved!)
                    {
                      Navigator.of(context)
                          .pushReplacementNamed(BrokerMain.routeName)
                    }
                  else
                    {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.BOTTOMSLIDE,
                        title: LocaleKeys.login_failed_label_text.tr(),
                        desc:
                            LocaleKeys.you_are_not_verified_yet_label_text.tr(),
                        // btnCancelOnPress: () {
                        //   Navigator.popAndPushNamed(context, Login.routeName);
                        // },
                        btnOkOnPress: () {
                          // Navigator.pop(context);
                          // Navigator.pop()
                          Navigator.popAndPushNamed(context, Login.routeName);
                        },
                      )..show()
                    }
                });
          } else if (loggedinUser.user!.role == "Admin") {
            Navigator.of(context).pushReplacementNamed(AdminMainPage.routeName);
          } else {
            Navigator.of(context).pushReplacementNamed(CustomerPage.routeName);
          }

          // callFetchEvents();

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Welcome To Trust Brokers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: loginSize.getFontSize1,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: loginSize.getHeight * 0.06,
              ),
              Center(
                child: Text(
                  "Trust Brokers",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: loginSize.getFontSize1,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: loginSize.getHeight * 0.1,
              ),
              // Container(
              //   alignment: Alignment.bottomCenter,
              //   child: Text(
              //     this.title,
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // )
            ],
          )),
    );
  }
}
