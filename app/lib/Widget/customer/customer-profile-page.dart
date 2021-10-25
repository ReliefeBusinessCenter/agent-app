import 'package:app/Widget/Broker-profile/Broker-background-image.dart';
import 'package:app/Widget/Broker-profile/about-section.dart';
import 'package:app/Widget/Broker-profile/custome_button.dart';
import 'package:app/Widget/Broker-profile/hire_button.dart';
import 'package:app/Widget/Broker-profile/select_option.dart';
import 'package:app/Widget/Broker-profile/work_section.dart';
import 'package:app/bloc/delivery/bloc/delivery_bloc.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/customer/customer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'customer-background-image.dart';

class CustomerProfilePage extends StatelessWidget {
  static const routeName = '/user/category/services/technicians/detail';
  final Customer customer;
  late DeliveryBloc deliveryBloc;
  CustomerProfilePage({required this.customer});
  @override
  Widget build(BuildContext context) {
    // Broker brokedr = ModalRoute.of(context)!.settings.arguments as Broker;
    deliveryBloc = BlocProvider.of<DeliveryBloc>(context);
    deliveryBloc.add(DeliveryInitializationEvent());
    print("Broker name ${customer.user!.fullName}");
    return Scaffold(
        backgroundColor: Color(0xFFf2f6f9),
        appBar: AppBar(),
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
                progress!.showWithText("Hiring");
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
                  title: 'Warning',
                  desc: 'Failed to Create Delivers',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomerBackgroundImage(
          customer: this.customer,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        SelectOption(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.045),
        // AboutSection(broker: customer),
        divider,
        // WorkSection(broker: customer),
        divider,
        _buildPortifolioSection(context),
        Expanded(
          child: Container(),
        ),
        // HireButton(
        //   broker: broker,
        // ),
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
