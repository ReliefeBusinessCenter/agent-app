import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
// import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/model/deals.dart';
import 'package:app/screens/broker/broker_deals_detail.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
// import 'package:app/model/work.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DealsItem extends StatelessWidget {
  late DealsListBloc dealsBloc;
  final Deals deals;
  DealsItem({required this.deals});
  @override
  Widget build(BuildContext context) {
    dealsBloc = BlocProvider.of<DealsListBloc>(context);
    return BlocBuilder<DealsListBloc, DealsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(BrokerBrokerDealsDetail.routeName, arguments: deals);
          },
          child: Card(
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
                            width: 1.0,
                            color: Theme.of(context).primaryColor))),
                child: Icon(Icons.request_page,
                    color: Theme.of(context).primaryColor),
              ),
              title: Text(
                deals.customer!.user!.fullName as String,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Icon(Icons.pending,
                      color: Theme.of(context).primaryColor.withOpacity(0.4)),
                  Text(deals.dealsStatus as String,
                      style: TextStyle(color: Theme.of(context).primaryColor))
                ],
              ),
              trailing: PopupMenuButton(
                child: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).primaryColor,
                ),
                onSelected: (value) async {
                  if (value == 1 && deals.dealsStatus == "Accepted") {
                    // make it done
                    //  update delivery
                    dealsBloc.add(MarkAsDoneDeals(deals: deals));
                  } else if (value == 1 && deals.dealsStatus != "Accepted") {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.WARNING,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Action not Allowed',
                      desc:
                          'This deals have to be accepted by the customers first!',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {
                        // dealsBloc.add(DeleteDeals(deals: deals));
                        // Navigator.pop(context);
                      },
                    )..show();
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
                        dealsBloc.add(DeleteDeals(deals: deals));
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
