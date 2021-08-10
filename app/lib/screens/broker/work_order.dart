import 'package:app/Widget/agent/order_item.dart';
import 'package:flutter/material.dart';

class WorkOrder extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  WorkOrder({required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          PopupMenuButton(
              child: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
              onSelected: (value) async {
                if (value == 1) {
                  // make it done

                } else {
                  // delete the work history.

                }
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Accepted",
                          style: TextStyle(color: Colors.green)),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child:
                          Text("Rejected", style: TextStyle(color: Colors.red)),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child:
                          Text("Pending", style: TextStyle(color: Colors.red)),
                      value: 2,
                    ),
                  ]),
        ],
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        children: [OrderItem()],
      ),
    );
  }
}
