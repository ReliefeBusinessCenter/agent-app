import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TopLabelText extends StatelessWidget {
  const TopLabelText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular((30)), topRight: Radius.circular((30))),
        color: Theme.of(context).primaryColor.withOpacity(0.1),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            left: MediaQuery.of(context).size.width * 0.05),
        child: Text(
          LocaleKeys.password_and_profile_label_text.tr(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
