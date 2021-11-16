import 'package:app/Widget/customer/customer_broker_profile_.dart';
import 'package:app/Widget/customer/delivery/mark_as_done_button.dart';
import 'package:app/bloc/delivery/bloc/delivery_bloc.dart';
import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/delivery.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class CustomerDeliveryDetails extends StatelessWidget {
  final Delivery delivery;
  CustomerDeliveryDetails({required this.delivery});
  static const routeName = "/customer-delivery-details";
  late WorkBloc workBloc;
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
            'Delivery Detail',
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
                          workBloc.add(DeleteWork(work: delivery));
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
            // IconButton(
            //   icon: Icon(
            //     Icons.delete,
            //     color: Colors.red,
            //   ),
            //   onPressed: () {
            //     // do something
            //     workBloc.add(DeleteWork(work: delivery));
            //   },
            // )
          ],
        ),
        body: Container(
            child: ProgressHUD(
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
                progress!.showWithText("Updating");
                print("delivery creating  method called");
              } else if (state is DeleteSuccessState) {
                // deleting success
                Navigator.pop(context);
                // workBloc.add(FetchWork());
              } else if (state is DeleteFailedState) {
                // delete failed
              } else if (state is UpdateSuccessState) {
                // update success state
                workBloc.add(FetchWork());
              } else if (state is UpdateFailedState) {
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
                    BrokerProfile(broker: this.delivery.broker as Broker),
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
                                "Delivery status",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              delivery.deliveryStatus == "Accepted"
                                  ? Text(
                                      "Accepted",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pink[600],
                                      ),
                                    )
                                  : delivery.deliveryStatus == "Pending"
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
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    MarkAsDone(
                      onPressed: () {
                        if (delivery.deliveryStatus == "Pending") {
                          // make it done
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.INFO,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Action Not Allowed',
                            desc:
                                'To change the done status of this work, the broker should respond first',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          )..show();
                        } else if (delivery.deliveryStatus == "Done") {
                          // make it done
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.INFO,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Action Not Allowed',
                            desc:
                                'This Delivery have been already set to Done!',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          )..show();
                        } else {
                          print("mark as done button have been clicked");
                          workBloc.add(MarkAsDoneWork(work: this.delivery));
                        }
                      },
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
