import 'package:app/Widget/work/workItem.dart';
import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class HistoryScreen extends StatelessWidget {
  late WorkBloc workBloc;
  bool isShowing = false;
  @override
  Widget build(BuildContext context) {
    workBloc = BlocProvider.of<WorkBloc>(context);
    workBloc.add(FetchWork());
    return Scaffold(
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
        )));
  }
}
