import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/screens/Auth/auth_exports.dart';

import 'package:app/screens/broker/broker_account_screen.dart';
import 'package:app/screens/broker/broker_main_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'saving_and_loans.dart';

class BrokerDrawer extends StatefulWidget {
  @override
  _BrokerDrawerState createState() => _BrokerDrawerState();
}

class _BrokerDrawerState extends State<BrokerDrawer> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Yared Solomon"),
            accountEmail: Text("yaredyaya16@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/16.jpg"),
            ),
            arrowColor: Theme.of(context).accentColor,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              alignment: Alignment.topLeft,
              child: FlutterSwitch(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.03,
                valueFontSize: 11.0,
                toggleSize: 15.0,
                value: status,
                borderRadius: 30.0,
                padding: 8.0,
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          CustomeList(
            title: "Dashboard",
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, BrokerMain.routeName);
            },
            subTitle: '',
          ),
          CustomeList(
            title: "Account",
            subTitle: "Update Profile",
            icon: Icon(
              Icons.contact_page,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, BrokerAccountScreen.routeName);
            },
          ),
          CustomeList(
            title: "Saving and Loans",
            subTitle: "Wallet",
            icon: Icon(
              Icons.attach_money,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SavingAndLoan.routeName);
            },
          ),
          ListTile(
            title: Text("Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          CustomeList(
            title: "Share",
            subTitle: "Share this app",
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              print("share");
            },
          ),
          Divider(height: 20, color: Colors.white.withOpacity(0.6)),
          ListTile(
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).errorColor,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Navigator.pop(context);
                Navigator.popAndPushNamed(context, Login.routeName);
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          ),
          ListTile(
            trailing: Icon(Icons.close, color: Colors.white.withOpacity(0.7)),
            title: Text(
              'Close',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w300,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
