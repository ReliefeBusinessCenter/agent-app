import 'package:app/Widget/agent/order_item.dart';
import 'package:app/Widget/work/workItem.dart';
import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

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
                    itemBuilder: (context, index) => OrderItem(
                          work: state.delivery_history[index],
                        ));
              }
              return Container();
              
            },
           
          ),
        )));
  }
}
