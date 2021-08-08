import 'package:app/Widget/work/workItem.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: Container(
            // decoration: BoxDecoration(color: Colors.white),
            child: ListView(
          children: [
            WorkItem(),
            WorkItem(),
            WorkItem(),
            WorkItem(),
            WorkItem(),
          ],
        )));
  }
}
