import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class BrokerChat extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  BrokerChat({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: Text("${LocaleKeys.broker_chat_room_label_text.tr()} ...."),
      ),
    );
  }
}
