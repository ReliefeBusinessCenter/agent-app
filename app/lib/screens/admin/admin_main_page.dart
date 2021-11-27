import 'package:app/constants/constants.dart';
import 'package:app/screens/admin/Admin_brokers_page.dart';
import 'package:app/screens/admin/admin_customers_page.dart';
import 'package:app/screens/admin/drawer.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AdminMainPage extends StatefulWidget {
  static const routeName = "adminHomePage";
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  _AdminMainPageState createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  String _initialValue = "en";

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _bodyWidgets = [
    AdminCustomersPage(),
    AdminBrokersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    _initialValue = context.locale.languageCode;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: lightColor,
      appBar: AppBar(
        title: Text(LocaleKeys.trust_broker_label_text.tr()),
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
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                child: DropdownButtonFormField<String>(
                    value: _initialValue,
                    dropdownColor: primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    onChanged: (value) async {
                      setState(() {
                        _initialValue = value!;
                      });
                      await context.setLocale(
                        Locale(
                          value.toString(),
                        ),
                      );
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
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              primaryColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: AdminDrawer(),
      ),
      body: _bodyWidgets[_selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {},
      ),
      drawerEnableOpenDragGesture: true,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: LocaleKeys.customers_label_text.tr(),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: LocaleKeys.brokers_label_text.tr(),
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: primaryColor,
        selectedItemColor: lightColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
