import 'package:app/constants/login/size.dart';
import 'package:app/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class SavingButton extends StatelessWidget {
  final Function onPressed;
  SavingButton({required this.onPressed});
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
            onPressed();
           
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
               LocaleKeys.submit_btn_label_text.tr(),
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
