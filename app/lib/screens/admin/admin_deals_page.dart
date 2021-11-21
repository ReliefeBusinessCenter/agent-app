import 'package:app/Widget/customer/admin_deals_item.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/screens/admin/admin_deals_charts.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
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
                          child: Text(LocaleKeys.all_status_text.tr(),
                              style: TextStyle(color: Colors.green)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text(LocaleKeys.pending_status_text.tr(),
                              style: TextStyle(color: Colors.green)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text(
                            LocaleKeys.accepted_status_text.tr(),
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text(LocaleKeys.rejected_status_text.tr(),
                              style: TextStyle(color: Colors.red)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text(
                            LocaleKeys.done_status_text.tr(),
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
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
                  text: LocaleKeys.statistics_label_text.tr(),
                ),
                Tab(text: LocaleKeys.deals_label_text.tr()),
              ],
            ),
          ),
          backgroundColor: Theme.of(context).accentColor,
          body: TabBarView(children: [
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
          ])),
    );
  }
}
