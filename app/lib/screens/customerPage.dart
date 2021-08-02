import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/Widget/Dashboard/customCategory.dart';
import 'package:app/Widget/Dashboard/customSearchBar.dart';
import 'package:app/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'profile_screen.dart';
import '../constants/constants.dart';
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
      body: Container(
        color: Color(0xFFf2f6f9),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchTextField(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                    CustomCategory(),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
              Icons.business,
            ),
            label: 'Business',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
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
}
