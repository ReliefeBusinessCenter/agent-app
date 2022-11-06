import 'package:app/Widget/broker-widget/accept_button.dart';
import 'package:app/Widget/broker-widget/reject_button.dart';
import 'package:app/Widget/customer/broker_broker_profile.dart';
import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/delivery.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class BrokerDeliveryDetails extends StatelessWidget {
  final Delivery delivery;
  BrokerDeliveryDetails({required this.delivery});
  static const routeName = "/broker-delivery-details";
  late WorkBloc workBloc;
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    // deliveryBloc=BlocProvider()
    workBloc = BlocProvider.of<WorkBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            LocaleKeys.delivery_details_label_text.tr(),
            style: TextStyle(fontSize: 18),
          ),
          // actions: <Widget>[
          //   PopupMenuButton(
          //     onSelected: (index) {
          //       if (index == 1) {
          //         AwesomeDialog(
          //           context: context,
          //           dialogType: DialogType.WARNING,
          //           animType: AnimType.BOTTOMSLIDE,
          //           title: 'Confirm Us',
          //           desc: 'Are you sure you want to delete this work?',
          //           btnCancelOnPress: () {},
          //           btnOkOnPress: () {
          //             workBloc.add(DeleteWork(work: delivery));
          //             // Navigator.pop(context);
          //           },
          //         )..show();
          //       }
          //     },
          //     itemBuilder: (context) => [
          //       PopupMenuItem(
          //         child: Text("Delete"),
          //         value: 1,
          //       ),
          //     ],
          //   ),
          //   // IconButton(
          //   //   icon: Icon(
          //   //     Icons.delete,
          //   //     color: Colors.red,
          //   //   ),
          //   //   onPressed: () {
          //   //     // do something
          //   //     workBloc.add(DeleteWork(work: delivery));
          //   //   },
          //   // )
          // ],
        ),
        body: Container(
          child: BlocConsumer<WorkBloc, WorkState>(
            listener: (context, state) {
              if (state is WorkLoading) {
                // delivery createing
                print("+++++++++++++++++++++++++++++++++++++++work is loading");
                final progress = ProgressHUD.of(context);
                // if (!isShowing) {
                //   if (progress != null) {
                //     setState(() {
                //       isShowing = true;
                //     });
                // }
                progress!.showWithText(LocaleKeys.updating_label_text.tr());
                print("delivery creating  method called");
                // showDialog(
                //   context: context,
                //   builder: (context) => LoadingIndicator(
                //     name: "Updating",
                //   ),
                // ).then((value) => _isOpen = false);
              } else if (state is DeleteSuccessState) {
                // deleting success
                Navigator.pop(context);

                // workBloc.add(FetchWork());
              } else if (state is DeleteFailedState) {
                // Navigator.of(context).pop();
                // showDialog(
                //     context: context,
                //     builder: (context) =>
                //         ErrorIndicator(name: "Delete failed"));
                // delete failed
              } else if (state is UpdateSuccessState) {
                // Navigator.of(context).pop();
                // update success state
                workBloc.add(FetchWork());
              } else if (state is UpdateFailedState) {
                // update failed state
                // Navigator.of(context).pop();
                // showDialog(
                //     context: context,
                //     builder: (context) =>
                //         ErrorIndicator(name: "Update failed"));
              }
            },
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // BrokerImage(
                    //   broker: this.delivery.broker as Broker,
                    // ),
                    BrokerBrokerProfile(
                        broker: this.delivery.customer as Customer),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Container(
                        // color: Colors.red,

                        height: size.height * 0.1,
                        child: Card(
                          color: lightColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                LocaleKeys.delivery_status_label_text.tr(),
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              delivery.deliveryStatus == "Accepted"
                                  ? Text(
                                      LocaleKeys.accepted_status_text.tr(),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink[600],
                                      ),
                                    )
                                  : delivery.deliveryStatus == "Pending"
                                      ? Text(
                                          LocaleKeys.pending_status_text.tr(),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : delivery.deliveryStatus == "Rejected"
                                          ? Text(
                                              LocaleKeys.rejected_status_text
                                                  .tr(),
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red[600],
                                              ),
                                            )
                                          : Text(
                                              LocaleKeys.done_status_text.tr(),
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green[600],
                                              ),
                                            )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    AcceptButton(
                        title: LocaleKeys.accept_delivery_label_text.tr(),
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (context) => LoadingIndicator(
                          //     name: "Updating",
                          //   ),
                          // );
                          workBloc.add(MarkAsAccepted(work: delivery));
                        }),

                    SizedBox(
                      height: 10.0,
                    ),
                    RejectButton(
                        title: LocaleKeys.reject_delivery_label_text.tr(),
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.WARNING,
                            animType: AnimType.BOTTOMSLIDE,
                            title: LocaleKeys.confirm_us_label_text.tr(),
                            desc: LocaleKeys.are_you_sure_label_text.tr(),
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              // showDialog(
                              //   context: context,
                              //   builder: (context) => LoadingIndicator(
                              //     name: "Updating",
                              //   ),
                              // );
                              workBloc.add(MarkAsRejected(work: delivery));
                            },
                          )..show();
                        }),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              );
            },
          ),
        )
        // decoration: BoxDecoration(color: Colors.white),
        //     child: ProgressHUD(
        //   child: BlocBuilder<WorkBloc, WorkState>(
        //     builder: (context, state) {

        );
    // bodey with out tates
  }
}
