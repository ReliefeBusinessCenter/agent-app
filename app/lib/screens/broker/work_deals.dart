import 'package:app/Widget/agent/deals_item.dart';
import 'package:app/Widget/common/error_indicator.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BrokerDealsHistoryScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  BrokerDealsHistoryScreen({required this.scaffoldKey});
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
                print("the state ===============================$state");
                if (state is DeleteDealsSuccessState) {
                  Navigator.of(context).pop();
                  // deleting success
                  dealsBloc.add(FetchDeals());
                } else if (state is DeleteDealsFailedState) {
                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context) =>
                          ErrorIndicator(name: "Delete failed"));
                  // delete failed
                } else if (state is UpdateDealsSuccessState) {
                  Navigator.of(context).pop();
                 
                  // update success state
                  dealsBloc.add(FetchDeals());
                } else if (state is UpdateDealsFailedState) {
                   Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context) =>
                          ErrorIndicator(name: "Update failed"));
                  // update failed state
                } else if (state is DealsLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is FetchDealsSuccess) {
                  if (state.deals_history.isEmpty) {
                    return Center(
                      child: Text("No deals yet!"),
                    );
                  }
                  return ListView.builder(
                      itemCount: state.deals_history.length,
                      itemBuilder: (context, index) => DealsItem(
                            deals: state.deals_history[index],
                          ));
                }
                return Container();
              },
            )));
  }
}
