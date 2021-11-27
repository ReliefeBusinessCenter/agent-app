import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomeErrorWidget extends StatelessWidget {
  const CustomeErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(LocaleKeys.something_went_wrong_label_text.tr()),
      ),
    );
  }
}
