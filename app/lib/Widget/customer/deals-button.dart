import 'package:app/Widget/Broker-profile/custome_button.dart';
import 'package:app/bloc/delivery/bloc/delivery_bloc.dart';
import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:app/model/customer/customer.dart';

// import 'package:app/model/category.dart';
// import 'package:app/model/work.dart';
import 'package:app/screens/broker/broker_deals_form_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'custome_button.dart';

// ignore: must_be_immutable
class DealsButton extends StatelessWidget {
  late WorkBloc workBloc;
  late DeliveryBloc deliveryBloc;

  late final Customer customer;
  DealsButton({required this.customer});

  @override
  Widget build(BuildContext context) {
    workBloc = BlocProvider.of<WorkBloc>(context);
    deliveryBloc = BlocProvider.of<DeliveryBloc>(context);
    // Category category = []
    //     .firstWhere((element) => element.id == broker.category!.categoryId);

    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        child: CustomButton(
          brokerName: customer.user!.fullName as String,
          label: 'Send Deals Request to ${customer.user!.fullName as String}',
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          onTap: () {
            // Navigator.pushNamed(DealsPageScreen.routeName);
            Navigator.pushNamed(context, DealsPageScreen.routeName,
                arguments: customer);
            //  deliveryBloc.add(SelectcustomerEvent(customer: this.customer));
            // deliveryBloc.add(DeliveryCreateEvent());
            // workBloc.add(FetchWork());
            // AwesomeDialog(
            //   context: context,
            //   dialogType: DialogType.INFO,
            //   animType: AnimType.BOTTOMSLIDE,
            //   title: 'Confirm Us',
            //   desc:
            //       'You are Hiring ${customer.user!.fullName as String}. Do you want to continue?',
            //   btnCancelOnPress: () {},
            //   btnOkOnPress: () {
            //     AwesomeDialog(
            //       context: context,
            //       dialogType: DialogType.SUCCES,
            //       animType: AnimType.BOTTOMSLIDE,
            //       title: 'Success',
            //       desc: 'Your process have been successfully processed.',
            //       btnOkOnPress: () {
            //         // workBloc.add(AddWork(work: work));
            //         deliveryBloc.add(SelectcustomerEvent(broker: this.broker));
            //         deliveryBloc.add(DeliveryCreateEvent());
            //         Navigator.pop(context);
            //       },
            //     )..show();
            //   },
            // )..show();
          },
        ),
      ),
    );
  }
}
