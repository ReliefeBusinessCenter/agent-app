import 'package:app/Widget/agent/order_item.dart';
import 'package:app/Widget/common/error_widget.dart';
import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/translations/locale_keys.g.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class BrokerDeliveryHistoryScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  BrokerDeliveryHistoryScreen({required this.scaffoldKey});
  late WorkBloc workBloc;
  bool isShowing = false;
  @override
  Widget build(BuildContext context) {
    workBloc = BlocProvider.of<WorkBloc>(context);
    workBloc.add(FetchWork());
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
        // decoration: BoxDecoration(color: Colors.white),
        child: ProgressHUD(
          child: BlocBuilder<WorkBloc, WorkState>(
            builder: (context, state) {
              if (state is DeleteSuccessState) {
                // deleting success
                workBloc.add(FetchWork());
              } else if (state is DeleteFailedState) {
                return CustomeErrorWidget();
                // delete failed
              } else if (state is UpdateSuccessState) {
                // update success state
                workBloc.add(FetchWork());
              } else if (state is UpdateFailedState) {
                // update failed state
              } else if (state is WorkLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is AdddWorkSuccess) {
                if (state.delivery_history.length == 0) {
                  return Center(
                    child: Text(LocaleKeys.no_delivery_label_text.tr()),
                  );
                } else {
                  print(
                      "Delivery ist length: ${state.delivery_history.length}");
                  return ListView.builder(
                    itemCount: state.delivery_history.length,
                    itemBuilder: (context, index) => OrderItem(
                      work: state.delivery_history[index],
                    ),
                  );
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
