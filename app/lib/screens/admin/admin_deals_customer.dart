import 'package:app/Widget/customer/deals_broker_profile.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/model/deals.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

// ignore: must_be_immutable
class AdminCustomerDealsDetail extends StatelessWidget {
  final Deals deals;
  AdminCustomerDealsDetail({required this.deals});
  static const routeName = "/admin-customer-deals-details";
  // late WorkBloc workBloc;
  late DealsListBloc dealsBloc;
  @override
  Widget build(BuildContext context) {
    // deliveryBloc=BlocProvider()
    print("++++++++++++++++++++++++++++++++++++ deals null causing is ${deals.brokerId}");
    dealsBloc = BlocProvider.of<DealsListBloc>(context);
    // workBloc = BlocProvider.of<WorkBloc>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            'Deals Detail',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (index){
                if(index == 1){
                  AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Confirm Us',
                        desc: 'Are you sure you want to delete this work?',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          dealsBloc.add(DeleteDeals(deals: deals));
                          // Navigator.pop(context);
                        },
                      )..show();
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Delete"),
                  value: 1,
                ),
              ],
            ),
           
          ],
        ),
        body: Container(
            child: ProgressHUD(
          child: BlocConsumer<DealsListBloc, DealsState>(
            listener: (context, state) {
              if (state is DealsLoading) {
                // delivery createing
                print("+++++++++++++++++++++++++++++++++++++++work is loading");
                final progress = ProgressHUD.of(context);
                // if (!isShowing) {
                //   if (progress != null) {
                //     setState(() {
                //       isShowing = true;
                //     });
                // }
                // progress!.showWithText("Updating");
                print("delivery creating  method called");
              } else if (state is DeleteDealsSuccessState) {
                // deleting success
                Navigator.pop(context);
                // workBloc.add(FetchWork());
              } else if (state is DeleteDealsFailedState) {
                // delete failed
              } else if (state is UpdateDealsSuccessState) {
                // update success state
                // workBloc.add(FetchWork());
              } else if (state is UpdateDealsFailedState) {
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
                              "Deal status",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                            deals.dealsStatus == "Accepted"
                                ? Text(
                                    "Accepted",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink[600],
                                    ),
                                  )
                                : deals.dealsStatus == "Pending"
                                    ? Text(
                                        "Pending",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : Text(
                                        "Done",
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
                   
                   
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              );
            },
          ),
        ))
        // decoration: BoxDecoration(color: Colors.white),
        //     child: ProgressHUD(
        //   child: BlocBuilder<WorkBloc, WorkState>(
        //     builder: (context, state) {

        );
    // bodey with out tates
  }
}
