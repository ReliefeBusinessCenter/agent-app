import 'package:app/Widget/agent/deals_item.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
// import 'package:app/bloc/deals/bloc/deals_bloc.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

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
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text('Trust Brokers'),
          backgroundColor: Theme.of(context).primaryColor,
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
            child: Container(
              height: 5.0,
              width: 5.0,
              child: ImageIcon(
                AssetImage('assets/images/left-align.png'),
              ),
            ),
          ),
        ),
        body: Container(
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
                    itemBuilder: (context, index) => DealsItem(
                          deals: state.deals_history[index],
                        ));
              }
              return Container();
            },
          ),
        )));
  }
}
