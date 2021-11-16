import 'package:app/Widget/work/workItem.dart';
import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/screens/admin/admin_delivery_charts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class AdminDeliveryPage extends StatelessWidget {
  static const routeName = 'adminDeliveryPage';
  late WorkBloc workBloc;
  bool isShowing = false;
  @override
  Widget build(BuildContext context) {
    workBloc = BlocProvider.of<WorkBloc>(context);
    workBloc.add(FetchWork());
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
                  color: Theme.of(context).primaryColor,
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
                    child: Text("All", style: TextStyle(color: Colors.green)),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Pending", style: TextStyle(color: Colors.green)),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child:
                        Text("Accepted", style: TextStyle(color: Colors.purple)),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Rejected", style: TextStyle(color: Colors.red)),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Done", style: TextStyle(color: Colors.green)),
                    value: 2,
                  ),
                ],
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.lime,
              indicatorWeight: 5.0,
              labelColor: Colors.white,
              labelPadding: EdgeInsets.only(top: 10.0),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Statistics",
                ),
                Tab(
                  text: "Deliveries",
                ),
              ],
            ),
    
          ),
          backgroundColor: Theme.of(context).accentColor,
          body: TabBarView(
            children: [
              AdminDeliveryCharts(),
                 Container(
                // decoration: BoxDecoration(color: Colors.white),
                child: ProgressHUD(
              child: BlocBuilder<WorkBloc, WorkState>(
                builder: (context, state) {
                  if (state is DeleteSuccessState) {
                    // deleting success
                    workBloc.add(FetchWork());
                  } else if (state is DeleteFailedState) {
                    // delete failed
                  } else if (state is UpdateSuccessState) {
                    // update success state
                    workBloc.add(FetchWork());
                  } else if (state is UpdateFailedState) {
                    // update failed state
                  } else if (state is WorkLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is AdddWorkSuccess) {
                    return ListView.builder(
                        itemCount: state.delivery_history.length,
                        itemBuilder: (context, index) => WorkItem(
                              work: state.delivery_history[index],
                            ));
                  }
                  return Container();
                },
              ),
            )),
            ],
           
          )),
    );
  }
}
