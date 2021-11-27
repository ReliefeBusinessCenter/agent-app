import 'package:app/Widget/customer/deals_item.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
import 'package:app/translations/locale_keys.g.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class CustomerDealsPage extends StatelessWidget {
  late DealsListBloc dealsBloc;
  bool isShowing = false;
  @override
  Widget build(BuildContext context) {
    dealsBloc = BlocProvider.of<DealsListBloc>(context);
    dealsBloc.add(FetchDeals());
    return Scaffold(
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).accentColor,
        body: Container(
            // decoration: BoxDecoration(color: Colors.white),
            child: BlocBuilder<DealsListBloc, DealsState>(
              builder: (context, state) {
                if (state is DeleteDealsSuccessState) {
                  Navigator.of(context).pop();
                  // deleting success
                  dealsBloc.add(FetchDeals());
                } else if (state is DeleteDealsFailedState) {
                  // Navigator.of(context).pop();
                  // showDialog(
                  //     context: context,
                  //     builder: (context) =>
                  //         ErrorIndicator(name: "Delete failed"));
                  // delete failed
                } else if (state is UpdateDealsSuccessState) {
                  // Navigator.of(context).pop();
                  // update success state
                  dealsBloc.add(FetchDeals());
                } else if (state is UpdateDealsFailedState) {
                  //  Navigator.of(context).pop();
                  // showDialog(
                  //     context: context,
                  //     builder: (context) =>
                  //         ErrorIndicator(name: "Update failed"));
                  // update failed state
                } else if (state is DealsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FetchDealsSuccess) {
                  print("Deals history: ${state.deals_history}");
                  return state.deals_history.length == 0
                      ? Center(child: Text(LocaleKeys.no_deals_yet_label_text.tr()))
                      : ListView.builder(
                          itemCount: state.deals_history.length,
                          itemBuilder: (context, index) => CustomerDealsItem(
                                deals: state.deals_history[index],
                              ));
                }
                return Container();
              },
            )));
  }
}
