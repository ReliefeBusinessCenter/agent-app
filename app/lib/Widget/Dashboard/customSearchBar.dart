import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants/login/size.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
  late BrokerBloc brokerBloc;
  @override
  Widget build(BuildContext context) {
    brokerBloc = BlocProvider.of<BrokerBloc>(context);
    // LoginSize loginSize = new LoginSize();
    // loginSize.build(context);
    return Center(
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40)),
          // width: loginSize.getTextFieldWidth,
          child: BlocBuilder<BrokerBloc, BrokerState>(
            builder: (context, state) {
              return TextField(
                onChanged: (text) {
                  brokerBloc.add(SearchEvent(name: text));
                },
                controller: null,
                // obscureText: !ispassshow,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => FocusScope.of(context).unfocus(),
                style: TextStyle(fontSize: 18, color: Colors.grey),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  suffixIcon: PopupMenuButton(
                      child: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).primaryColor,
                      ),
                      onSelected: (value) async {
                        if (value == 1) {
                          // Search by name
                          brokerBloc.add(ChangeSearchMode(isName: true));
                        } else {
                          // search by city
                          brokerBloc.add(ChangeSearchMode(isName: false));
                        }
                      },
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              // enabled: false,
                              child: Text(LocaleKeys.by_city_label_text.tr(),
                                  style: TextStyle(
                                      color: state.isName == true
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3))),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text(LocaleKeys.bY_name_label_text.tr(),
                                  style: TextStyle(
                                      color: state.isName == false
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3))),
                              value: 2,
                            ),
                          ]),
                  hintText: LocaleKeys.search_brokers_text.tr(),
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                ),
              );
            },
          )),
    );
  }
}
