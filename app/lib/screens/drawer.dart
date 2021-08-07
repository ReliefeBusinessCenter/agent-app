import 'package:app/screens/account_screen.dart';
import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';

class CustomerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      width: MediaQuery.of(context).size.width * 0.8,
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
          ListTile(
            leading: Icon(
              Icons.contact_page,
              color: Colors.white,
            ),
            title: Text(
              'Account',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountScreen()),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.favorite),
          //   title: Text('favorite'),
          // ),
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
            trailing: Icon(Icons.close),
            title: Text(
              'Close',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
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
