import 'package:app/Widget/customer/deals_item.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class CustomerDealsPage extends StatelessWidget {
  late DealsListBloc dealsBloc;
  bool isShowing = false;
  @override
  Widget build(BuildContext context) {
    dealsBloc = BlocProvider.of<DealsListBloc>(context);
    dealsBloc.add(FetchDeals());
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
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
                    itemBuilder: (context, index) => CustomerDealsItem(
                          deals: state.deals_history[index],
                        ));
              }
              return Container();
            },
          ),
        )));
  }
}
