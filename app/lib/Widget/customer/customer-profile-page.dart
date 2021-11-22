import 'package:app/bloc/delivery/bloc/delivery_bloc.dart';
import 'package:app/model/customer/customer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';


import 'customer-background-image.dart';
import 'deals-button.dart';

// ignore: must_be_immutable
class CustomerProfilePage extends StatelessWidget {
  static const routeName = '/customer/detail';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Customer Information"),
        ),
        body: ProgressHUD(
          child: BlocConsumer<DeliveryBloc, DeliveryState>(
            listener: (context, state) {
              if (state is DeliveryCreating) {
                // delivery createing
                final progress = ProgressHUD.of(context);

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomerBackgroundImage(
          customer: this.customer,
        ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Email: ${customer.user!.email as String}",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Phone: ${customer.user!.phone as String}",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Sex: ${customer.user!.sex as String}",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("City: Addis Ababa",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Sub City:  4 kilo",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Kebele: 10",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                fontWeight: FontWeight.bold,
              )),
        ),
        DealsButton(
          customer: customer,
        ),
      ],
    );
  }
}
