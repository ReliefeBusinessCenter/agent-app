// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
// import 'package:app/bloc/work-delivery/bloc/work_bloc.dart';
import 'package:app/model/deals.dart';
import 'package:app/screens/customer/customer_deals_detail.dart';
import 'package:app/translations/locale_keys.g.dart';
// import 'package:app/model/work.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
// ignore: must_be_immutable
class CustomerDealsItem extends StatelessWidget {
  late DealsListBloc dealsBloc;
  final Deals deals;
  CustomerDealsItem({required this.deals});
  @override
  Widget build(BuildContext context) {
    dealsBloc = BlocProvider.of<DealsListBloc>(context);

    return BlocBuilder<DealsListBloc, DealsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            print("deals detail option have been clicked");
            Navigator.pushNamed(context, CustomerDealsDetail.routeName,
                arguments: deals);
          },
          child: Card(
            // ignore: deprecated_member_use
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
              trailing: PopupMenuButton(
                  child: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).primaryColor,
                  ),
                  onSelected: (value) async {
                    if (value == 1) {
                      // make it done
                      //  update delivery

                      dealsBloc.add(MarkAsAccepted(deals: deals));
                    } else {
                      // delete the work history.

                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.WARNING,
                        animType: AnimType.BOTTOMSLIDE,
                        title: LocaleKeys.confirm_us_label_text.tr(),
                        desc: LocaleKeys.are_you_sure_reject_label_text.tr(),
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          dealsBloc.add(MarkAsRejected(work: deals));
                        },
                      )..show();
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(LocaleKeys.accept_btn_label_text.tr(),
                              style: TextStyle(color: Colors.green)),
                          value: 1,
                        ),
                        PopupMenuItem(
                          child: Text(LocaleKeys.reject_btn_label_text.tr(),
                              style: TextStyle(color: Colors.red)),
                          value: 2,
                        ),
                      ]),
            ),
          ),
        );
      },
    );
  }
}
