import 'package:app/model/broker/broker.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_localization/easy_localization.dart';

class AboutSection extends StatelessWidget {
  final Broker broker;
  AboutSection({required this.broker});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(LocaleKeys.contact_phone_label_text.tr()),
            subtitle: Text(broker.user!.phone!),
            trailing: Padding(
              padding: EdgeInsets.all(8),
              child: IconButton(
                icon: Icon(
                  Icons.call,
                  color: Colors.blue,
                  size: 30.0,
                ),
                onPressed: () async {
                  if (await canLaunch('tel:${broker.user!.phone}')) {
                    await launch('tel:${broker.user!.phone}');
                  } else {
                    throw "Could not launch ";
                  }
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      LocaleKeys.about_label_text.tr(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      broker.about!,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
