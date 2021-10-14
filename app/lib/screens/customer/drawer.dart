import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/login_info.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/screens/Auth/login.dart';

import 'package:flutter/material.dart';

import 'account_screen.dart';
import 'becomeAnAgent.dart';
import 'customerPage.dart';

class CustomerDrawer extends StatelessWidget {
  User user = new User();
  void Initializeuser() async {
    UserPreferences userPreference = new UserPreferences();
    LoggedUserInfo? loggedUserInfo = await userPreference.getUserInformation();
    print("User Object from the Drawer: ${loggedUserInfo!.user!.fullName}");
    this.user = loggedUserInfo.user as User;
  }

  @override
  Widget build(BuildContext context) {
    Initializeuser();
    return Container(
      color: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          
          UserAccountsDrawerHeader(
            accountName: Text("${this.user.fullName as String}"),
            accountEmail: Text("${this.user.email as String}"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "http://192.168.211.201:5000/api/users/getimage?name=wwwroot/images/${this.user.picture}"),
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
