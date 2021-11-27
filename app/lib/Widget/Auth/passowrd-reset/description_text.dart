import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class DescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Text(
        LocaleKeys.provide_your_account_email_label_text.tr(),
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w300,
            color: Colors.grey.withOpacity(0.7)),
      ),
    );
  }
}
