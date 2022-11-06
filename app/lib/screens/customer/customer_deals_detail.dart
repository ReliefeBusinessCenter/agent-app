import 'package:app/Widget/broker-widget/accept_button.dart';
import 'package:app/Widget/broker-widget/reject_button.dart';
import 'package:app/Widget/customer/deals_broker_profile.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/model/deals.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class CustomerDealsDetail extends StatelessWidget {
  final Deals deals;
  CustomerDealsDetail({required this.deals});
  static const routeName = "/customer-deals-details";
  // late WorkBloc workBloc;
  late DealsListBloc dealsBloc;
  @override
  Widget build(BuildContext context) {
    // deliveryBloc=BlocProvider()
    print(
        "++++++++++++++++++++++++++++++++++++ deals null causing is ${deals.brokerId}");
    dealsBloc = BlocProvider.of<DealsListBloc>(context);
    // workBloc = BlocProvider.of<WorkBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            LocaleKeys.deals_detail_label_text.tr(),
            style: TextStyle(fontSize: 18),
          ),
          // actions: <Widget>[
          //   PopupMenuButton(
          //     onSelected: (index){
          //       if(index == 1){
          //         AwesomeDialog(
          //               context: context,
          //               dialogType: DialogType.WARNING,
          //               animType: AnimType.BOTTOMSLIDE,
          //               title: 'Confirm Us',
          //               desc: 'Are you sure you want to delete this work?',
          //               btnCancelOnPress: () {},
          //               btnOkOnPress: () {
          //                 dealsBloc.add((work: delivery));
          //                 // Navigator.pop(context);
          //               },
          //             )..show();
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
            child: BlocConsumer<DealsListBloc, DealsState>(
          listener: (context, state) {
            if (state is DealsLoading) {
              // delivery createing
              print("+++++++++++++++++++++++++++++++++++++++work is loading");

              // if (!isShowing) {
              //   if (progress != null) {
              //     setState(() {
              //       isShowing = true;
              //     });
              // }
              // showDialog(
              //     context: context,
              //     builder: (context) => LoadingIndicator(name: "Update"));

              print("delivery creating  method called");
            } else if (state is DeleteDealsSuccessState) {
              // deleting success
              // Navigator.pop(context);
              // workBloc.add(FetchWork());
            } else if (state is DeleteDealsFailedState) {
              // Navigator.of(context).pop();
              // showDialog(
              //     context: context,
              //     builder: (context) => ErrorIndicator(name: "Delete failed"));
              // delete failed
            } else if (state is UpdateDealsSuccessState) {
              // update success state
              // workBloc.add(FetchWork());
            } else if (state is UpdateDealsFailedState) {
              // Navigator.of(context).pop();
              // showDialog(
              //     context: context,
              //     builder: (context) => ErrorIndicator(name: "Update failed"));
              // update failed state
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
                  DealsBrokerProfile(deals: deals),
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
                           LocaleKeys.deal_status_label_text.tr(),
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          deals.dealsStatus == "Accepted"
                              ? Text(
                                  LocaleKeys.accepted_status_text.tr(),
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[600],
                                  ),
                                )
                              : deals.dealsStatus == "Pending"
                                  ? Text(
                                      LocaleKeys.pending_status_text.tr(),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    )
                                  : deals.dealsStatus == "Rejected"
                                      ? Text(
                                         LocaleKeys.reject_btn_label_text.tr(),
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green[600],
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
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  AcceptButton(
                    title: LocaleKeys.accept_deal_offer_btn_label_text.tr(),
                    onPressed: () {
                      dealsBloc.add(MarkAsAccepted(deals: deals));
                      // Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RejectButton(
                      title: LocaleKeys.reject_deal_offer_btn_label_text.tr(),
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.WARNING,
                          animType: AnimType.BOTTOMSLIDE,
                          title: LocaleKeys.confirm_us_label_text.tr(),
                          desc: LocaleKeys.are_you_sure_reject_label_text.tr(),
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            dealsBloc.add(MarkAsRejected(work: deals));
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
        ))
        // decoration: BoxDecoration(color: Colors.white),
        //     child: ProgressHUD(
        //   child: BlocBuilder<WorkBloc, WorkState>(
        //     builder: (context, state) {

        );
    // bodey with out tates
  }
}
