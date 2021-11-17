import 'package:app/Widget/customer/admin_deals_item.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/screens/admin/admin_deals_charts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class AdminDealPage extends StatelessWidget {
  static const routeName = 'adminDealsPage';
  late DealsListBloc dealsBloc;
  bool isShowing = false;
  @override
  Widget build(BuildContext context) {
    dealsBloc = BlocProvider.of<DealsListBloc>(context);
    dealsBloc.add(FetchDeals());
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            actions: [
              PopupMenuButton(
                  child: Icon(
                    Icons.more_vert,
                    color: lightColor,
                  ),
                  onSelected: (value) async {
                    if (value == 1) {
                      // make it done
                      //  update delivery
                      // dealsBloc.add(MarkAsAccepted(deals: deals));
                    } else {
                      // delete the work history.
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Confirm Us',
                        desc: 'Are you sure you want to Reject  this work?',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          // dealsBloc.add(MarkAsRejected(work: deals));
                        },
                      )..show();
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("All",
                              style: TextStyle(color: Colors.green)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Pending",
                              style: TextStyle(color: Colors.green)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Accepted",
                              style: TextStyle(color: Colors.purple)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Rejected",
                              style: TextStyle(color: Colors.red)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text("Done",
                              style: TextStyle(color: Colors.green)),
                          value: 2,
                        ),
                      ]),
            ],
            bottom: TabBar(
              indicatorColor: Colors.purple,
              indicatorWeight: 2.0,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.only(top: 10.0),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Statistics",
                ),
                Tab(
                  text: "Deals",
                ),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).accentColor,
          body: TabBarView(
            children: [
              AdminDealsCharts(),
              Container(
                // decoration: BoxDecoration(color: Colors.white),
                child: ProgressHUD(
              child: BlocBuilder<DealsListBloc, DealsState>(
                builder: (context, state) {
                  if (state is DeleteDealsSuccessState) {
                    // deleting success
                    dealsBloc.add(FetchDeals());
                  } else if (state is DeleteDealsFailedState) {
                    // delete failed
                  } else if (state is UpdateDealsSuccessState) {
                    // update success state
                    dealsBloc.add(FetchDeals());
                  } else if (state is UpdateDealsFailedState) {
                    // update failed state
                  } else if (state is DealsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is FetchDealsSuccess) {
                    return ListView.builder(
                      itemCount: state.deals_history.length,
                      itemBuilder: (context, index) => CustomerAdminDealsItem(
                        deals: state.deals_history[index],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )),
            ]
          )),
    );
  }
}
