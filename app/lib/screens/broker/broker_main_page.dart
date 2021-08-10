import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/Widget/Dashboard/customCategory.dart';
import 'package:app/Widget/Dashboard/customSearchBar.dart';
import 'package:app/screens/broker/broker_home_fragment.dart';
import 'package:app/screens/broker/order_history_fragment.dart';
import 'package:app/screens/drawer.dart';
import 'package:app/screens/favorite_screen.dart';
import 'package:app/screens/history_screen.dart';
import 'package:app/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../home_fragment_screen.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Trust Brokers'),
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
      ),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.request_page,
            ),
            label: 'Orders',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: 'Deals',
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
        return new BrokerHome();
      case 1:
        return new BrokerOrderHistory();

      default:
        return new BrokerHome();
    }
  }
}
