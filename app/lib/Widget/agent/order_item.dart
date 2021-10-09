import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:app/model/work.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).accentColor,
      elevation: 1.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(
                      width: 1.0, color: Theme.of(context).primaryColor))),
          child:
              Icon(Icons.request_page, color: Theme.of(context).primaryColor),
        ),
        title: Text(
          "House Brooking Request",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.pending,
                color: Theme.of(context).primaryColor.withOpacity(0.4)),
            Text("Pending",
                style: TextStyle(color: Theme.of(context).primaryColor))
          ],
        ),
        trailing: PopupMenuButton(
            child: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryColor,
            ),
            onSelected: (value) async {
              if (value == 1) {
                // make it done
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.SUCCES,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Successfully Accepted',
                  btnOkOnPress: () {},
                )..show();
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
                    // workBloc.add(DeleteWork(work: work));
                    // Navigator.pop(context);
                  },
                )..show();
              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child:
                        Text("Accept", style: TextStyle(color: Colors.green)),
                    value: 1,
                    
                  ),
                  PopupMenuItem(
                    child: Text("Reject", style: TextStyle(color: Colors.red)),
                    value: 2,
                  ),
                ]),
      ),
    );
  }
}
