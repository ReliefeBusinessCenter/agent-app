import 'package:app/Widget/work/workItem.dart';
import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  // WorkBloc
  @override
  Widget build(BuildContext context) {
    // categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Container(
            // decoration: BoxDecoration(color: Colors.white),
            child: BlocBuilder<WorkBloc, WorkState>(
          builder: (context, state) {
            if (state is AdddWorkSuccess) {
              print(
                  "+++++++______+++++ Add Work Event have been called ++++++___++++++");
              print("State Calue:${state.delivery_history}");
              return ListView.builder(
                  itemCount: state.delivery_history.length,
                  itemBuilder: (context, index) => WorkItem(
                        work: state.delivery_history[index],
                      ));
            }

            if (state is WorkInitial) {
              return Container(
                child: Center(child: Text("There is no work history yet.")),
              );
            } else if (state is DeleteSuccessState) {
              return ListView.builder(
                  itemCount: state.delivery_history.length,
                  itemBuilder: (context, index) => WorkItem(
                        work: state.delivery_history[index],
                      ));
            }
            return Container();
          },
        )));
  }
}
