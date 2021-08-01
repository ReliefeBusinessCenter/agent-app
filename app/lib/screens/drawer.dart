import 'package:flutter/material.dart';

class CustomerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Yared Solomon"),
            accountEmail: Text("yaredyaya16@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/16.jpg"),
            ),
            arrowColor: Theme.of(context).accentColor,
//              decoration: BoxDecoration(
//                gradient: LinearGradient(begin: Alignment.bottomLeft,end: Alignment.topRight,
//                    colors:[Colors.blue,Colors.green]
//                ),
//                // color: Colors.purpleAccent
//              ),
          ),
          ListTile(
            leading: Icon(
              Icons.contact_page,
              color: Theme.of(context).textTheme.bodyText2!.color,
            ),
            title: Text(
              'Account',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            onTap: () {},
          ),
          // ListTile(
          //   leading: Icon(Icons.favorite),
          //   title: Text('favorite'),
          // ),
          Divider(
            height: 20,
          ),
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
//                Navigator.of(context).pop();
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
