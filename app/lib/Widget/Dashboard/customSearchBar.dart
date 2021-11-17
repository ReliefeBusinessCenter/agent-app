import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants/login/size.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  late BrokerBloc brokerBloc;
  @override
  Widget build(BuildContext context) {
    brokerBloc = BlocProvider.of<BrokerBloc>(context);
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return Center(
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40)),
          width: loginSize.getTextFieldWidth,
          child: BlocBuilder<BrokerBloc, BrokerState>(
            builder: (context, state) {
              return TextField(
                onChanged: (text) {
                  print("This is the text that have been written $text");
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
                              child: Text("By City",
                                  style: TextStyle(
                                      color: state.isName == true
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3))),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text("By Name",
                                  style: TextStyle(
                                      color: state.isName == false
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.3))),
                              value: 2,
                            ),
                          ]),
                  hintText: " Search Brokers",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.3)),
                ),
              );
            },
          )),
    );
  }
}
