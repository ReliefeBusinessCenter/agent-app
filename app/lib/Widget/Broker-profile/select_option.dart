import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'custome_button.dart';
import 'package:easy_localization/easy_localization.dart';
class SelectOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomButton(
                brokerName: '',
                label: LocaleKeys.profile_label_text.tr(),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                onTap: () {},
              ),
            ),
            Expanded(
              child: CustomButton(
                brokerName: '',
                label: LocaleKeys.views_label_text.tr(),
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColor,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
