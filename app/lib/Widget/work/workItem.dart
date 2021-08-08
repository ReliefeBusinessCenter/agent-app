import 'package:flutter/material.dart';

class WorkItem extends StatelessWidget {
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
          child: Icon(Icons.work, color: Theme.of(context).primaryColor),
        ),
        title: Text(
          "Business Broking",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.pending,
                color: Theme.of(context).primaryColor.withOpacity(0.4)),
            Text(" Pending",
                style: TextStyle(color: Theme.of(context).primaryColor))
          ],
        ),
        trailing: PopupMenuButton(
            child: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryColor,
            ),
            onSelected: (value) async {},
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
  }
}
