// ignore_for_file: must_be_immutable

import 'package:app/Widget/Broker-profile/Broker-background-image.dart';
import 'package:app/Widget/Broker-profile/about-section.dart';
import 'package:app/Widget/Broker-profile/select_option.dart';
import 'package:app/Widget/Broker-profile/work_section.dart';
import 'package:app/bloc/delivery/bloc/delivery_bloc.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class WelcomeBrokersProfilePage extends StatelessWidget {
  static const routeName = '/user/category/services/technicians/detail';
  final Broker broker;
  late DeliveryBloc deliveryBloc;
  WelcomeBrokersProfilePage({required this.broker});
  @override
  Widget build(BuildContext context) {
    // Broker brokedr = ModalRoute.of(context)!.settings.arguments as Broker;
    deliveryBloc = BlocProvider.of<DeliveryBloc>(context);
    deliveryBloc.add(DeliveryInitializationEvent());
    print("Broker name ${broker.user!.fullName}");
    return Scaffold(
        backgroundColor: Color(0xFFf2f6f9),
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ProgressHUD(
          child: BlocConsumer<DeliveryBloc, DeliveryState>(
            listener: (context, state) {
              if (state is DeliveryCreating) {
                // delivery createing
                final progress = ProgressHUD.of(context);
                // if (!isShowing) {
                //   if (progress != null) {
                //     setState(() {
                //       isShowing = true;
                //     });
                // }
                progress!.showWithText(LocaleKeys.hiring_label_text.tr());
                print("delivery creating  method called");
              } else if (state is DeliveryCreateSuccess) {
                // delivery success method
                deliveryBloc.add(DeliveryInitializationEvent());
                Navigator.of(context).pop();
                print("Delivery create sucess method");
              } else if (state is DeliveryCreateFailed) {
                // delivery failed method
                print("Delivery create method failed");
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.SUCCES,
                  animType: AnimType.BOTTOMSLIDE,
                  title: LocaleKeys.warning_label_text.tr(),
                  desc: LocaleKeys.failed_to_create_deliveries_label_text.tr(),
                  btnOkOnPress: () {
                    // workBloc.add(AddWork(work: work));
                  },
                )..show();
              }
            },
            builder: (context, state) {
              return _buildPortraitView(context);
            },
          ),
        ));
  }

  Widget _buildPortraitView(BuildContext context) {
    var divider = Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
    return ListView(children: [
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
    ]);
  }
}
