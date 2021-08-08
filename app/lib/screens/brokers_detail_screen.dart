import 'package:app/Widget/Broker-profile/Broker-background-image.dart';
import 'package:app/Widget/Broker-profile/about-section.dart';
import 'package:app/Widget/Broker-profile/custome_button.dart';
import 'package:app/Widget/Broker-profile/hire_button.dart';
import 'package:app/Widget/Broker-profile/select_option.dart';
import 'package:app/Widget/Broker-profile/work_section.dart';
import 'package:app/model/broker.dart';
import 'package:flutter/material.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class BrokersProfilePage extends StatelessWidget {
  static const routeName = '/user/category/services/technicians/detail';
  final Broker broker;
  BrokersProfilePage({required this.broker});
  @override
  Widget build(BuildContext context) {
    // Broker broker = ModalRoute.of(context)!.settings.arguments as Broker;
    print("Broker name ${broker.name}");
    return Scaffold(
      backgroundColor: Color(0xFFf2f6f9),
      appBar: AppBar(),
      body: _buildPortraitView(context),
    );
  }

  Widget _buildPortraitView(BuildContext context) {
    var divider = Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        BrokerBackgroundImage(
          broker: this.broker,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        SelectOption(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.045),
        AboutSection(broker: broker),
        divider,
        WorkSection(broker: broker),
        divider,
        _buildPortifolioSection(context),
        Expanded(
          child: Container(),
        ),
        HireButton(
          broker: broker,
        ),
      ],
    );
  }
}

Widget _buildPortifolioSection(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Text(
          'Portifolio',
        ),
      ],
    ),
  );
}
