// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
// import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/model/deals.dart';
import 'package:app/screens/admin/admin_deals_customer.dart';
import 'package:app/screens/customer/customer_deals_detail.dart';
// import 'package:app/model/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerAdminDealsItem extends StatelessWidget {
  late DealsListBloc dealsBloc;
  final Deals deals;
  CustomerAdminDealsItem({required this.deals});
  @override
  Widget build(BuildContext context) {
    dealsBloc = BlocProvider.of<DealsListBloc>(context);

    return BlocBuilder<DealsListBloc, DealsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AdminCustomerDealsDetail.routeName, arguments: deals);
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
                child: Icon(Icons.work, color: Theme.of(context).primaryColor),
              ),
              title: Text(
                deals.broker!.user!.fullName as String,
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
                  Text(deals.dealsStatus as String,
                      style: TextStyle(color: Theme.of(context).primaryColor))
                ],
              ),
              
            ),
          ),
        );
      },
    );
  }
}
