import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:app/model/delivery.dart';
import 'package:app/model/work.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkItem extends StatelessWidget {
  late WorkBloc workBloc;
  final Delivery work;
  WorkItem({required this.work});
  @override
  Widget build(BuildContext context) {
    workBloc = BlocProvider.of<WorkBloc>(context);

    return BlocBuilder<WorkBloc, WorkState>(
      builder: (context, state) {
        return Card(
          color: Theme.of(context).accentColor,
          elevation: 1.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(
                          width: 1.0, color: Theme.of(context).primaryColor))),
              child: Icon(Icons.work, color: Theme.of(context).primaryColor),
            ),
            title: Text(
              work.broker!.user!.fullName as String,
              // "broker test",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              children: <Widget>[
                Icon(Icons.pending,
                    color: Theme.of(context).primaryColor.withOpacity(0.4)),
                Text(work.deliveryStatus as String,
                    style: TextStyle(color: Theme.of(context).primaryColor))
              ],
            ),
            trailing: PopupMenuButton(
                child: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryColor,
                ),
                onSelected: (value) async {
                  if (value == 1 && work.deliveryStatus == "Pending") {
                    // make it done
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.INFO,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Action Not Allowed',
                      desc:
                          'To change the done status of this work, the broker should respond first',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } else if ((value == 1 &&
                      work.deliveryStatus == "Accepted")) {
                    workBloc.add(MarkAsDoneWork(work: work));
                  } else {
                    // delete the work history.
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Confirm Us',
                      desc: 'Are you sure you want to delete this work?',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        workBloc.add(DeleteWork(work: work));
                        // Navigator.pop(context);
                      },
                    )..show();
                  }
                },
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Icon(Icons.done, color: Colors.green),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Icon(Icons.delete, color: Colors.red),
                        value: 2,
                      ),
                    ]),
          ),
        );
      },
    );
  }
}
