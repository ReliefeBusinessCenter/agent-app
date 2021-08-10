import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/screens/Auth/login.dart';

import 'package:flutter/material.dart';

import 'account_screen.dart';
import 'becomeAnAgent.dart';
import 'customerPage.dart';

class CustomerDrawer extends StatelessWidget {
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
          CustomeList(
            title: "Dashboard",
            subTitle: "See List of brokers",
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, CustomerPage.routeName);
            },
          ),
          CustomeList(
            title: "Account",
            subTitle: "Update Profile",
            icon: Icon(
              Icons.contact_page,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountScreen()),
              );
            },
          ),
          CustomeList(
            title: "Agent",
            subTitle: "Become an agent",
            icon: Icon(
              Icons.support_agent,
              color: Colors.white,
            ),
            onPressed: () {
              print("Setting apge");
              Navigator.pushNamed(context, BecomeAnAgent.routeName);
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
          Divider(
            height: 20,
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

  void goToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountScreen()),
    );
  }
}
