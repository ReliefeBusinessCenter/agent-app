import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/Widget/Dashboard/customCategory.dart';
import 'package:app/Widget/Dashboard/customSearchBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../constants.dart';
import 'drawer.dart';
import 'favorite_screen.dart';
import 'history_screen.dart';
import 'home_fragment_screen.dart';
import 'map_screen.dart';
import 'profile_screen.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class CustomerPage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Trust Brokers'),
        backgroundColor: primaryColor,
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
          canvasColor:
              primaryColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: CustomerDrawer(),
      ),
      drawerEnableOpenDragGesture: true,
      body: _getDrawerItemWidget(this._selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: 'History',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Map',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorit',
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
        return new HomeFragment();
      case 1:
        return new HistoryScreen();
      case 2:
        return new MapScreen();
      case 3:
        return new FavoritScreen();

      default:
        return new HomeFragment();
    }
  }
}
