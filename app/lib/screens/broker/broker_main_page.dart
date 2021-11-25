import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/screens/broker/broker_chat.dart';
import 'package:app/screens/broker/broker_customer_list.dart';
import 'package:app/screens/broker/work_order.dart';
import 'package:app/screens/broker/work_deals.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'broker_drawer.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class BrokerMain extends StatefulWidget {
  static const routeName = 'broker';
  @override
  _BrokerMainState createState() => _BrokerMainState();
}

class _BrokerMainState extends State<BrokerMain> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _getBrokerInfo();
    super.initState();
  }

  _getBrokerInfo() async {
    UserPreferences _userPreferences = UserPreferences();
    _userPreferences.getBrokerInformation().then(
          (broker) => {
            BlocProvider.of<BrokerBloc>(context)
                .add(FetchBrokerByEmail(broker!.user!.phone!))
          },
        );
  }

  String _initialValue = "en";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.trust_broker_label_text.tr()),
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: Container(
            height: 5.0,
            width: 5.0,
            child: ImageIcon(
              AssetImage('assets/images/left-align.png'),
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                child: DropdownButtonFormField<String>(
                    value: _initialValue,
                    dropdownColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) async {
                      setState(() {
                        _initialValue = value!;
                      });
                      await context.setLocale(Locale(value.toString()));
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'EN',
                          style: TextStyle(color: lightColor),
                        ),
                        value: 'en',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'አማ',
                          style: TextStyle(color: lightColor),
                        ),
                        value: 'am',
                      )
                    ]),
              )
            ],
          )
        ],
      ),
      key: _scaffoldKey,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context)
              .primaryColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: BrokerDrawer(),
      ),
      drawerEnableOpenDragGesture: true,
      body: _getDrawerItemWidget(this._selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.request_page,
            ),
            label: LocaleKeys.delivery_label_text.tr(),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: LocaleKeys.deals_label_text.tr(),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: LocaleKeys.customers_label_text.tr(),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: LocaleKeys.chat_label_text.tr(),
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _getDrawerItemWidget(int index) {
    switch (index) {
      case 0:
        return new BrokerDeliveryHistoryScreen(scaffoldKey: _scaffoldKey);
      case 1:
        return new BrokerDealsHistoryScreen(scaffoldKey: _scaffoldKey);
      case 2:
        return new BrokerCustomerList(scaffoldKey: _scaffoldKey);
      case 3:
        return new BrokerChat(scaffoldKey: _scaffoldKey);
      default:
        return new BrokerDeliveryHistoryScreen(scaffoldKey: _scaffoldKey);
    }
  }
}
