import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  "assets/images/16.jpg",
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Crm Admistratora',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  size: 40.0,
                  color: Colors.black,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.list,
                size: 35.0,
                color: Colors.white,
              ),
              title: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.list_alt,
                size: 35.0,
                color: Colors.white,
              ),
              title: Row(
                children: [
                  Text(
                    'Products',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                size: 35.0,
                color: Colors.white,
              ),
              title: Text(
                'Product Catalog',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            ExpansionTile(
              expandedAlignment: Alignment.center,
              iconColor: Colors.white,
              // collapsedBackgroundColor: Colors.white,
              collapsedIconColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              leading: Icon(
                Icons.shop,
                size: 35.0,
                color: Colors.white,
              ),
              title: Row(
                children: [
                  Text(
                    'Orders',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ExpansionTile(
              expandedAlignment: Alignment.center,
              iconColor: Colors.white,
              // collapsedBackgroundColor: Colors.white,
              collapsedIconColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              leading: Icon(
                Icons.circle_notifications,
                size: 35.0,
                color: Colors.white,
              ),
              title: Row(
                children: [
                  Text(
                    'Client Managment',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ExpansionTile(
              expandedAlignment: Alignment.center,
              iconColor: Colors.white,
              // collapsedBackgroundColor: Colors.white,
              collapsedIconColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              leading: Icon(
                Icons.supervised_user_circle,
                size: 35.0,
                color: Colors.white,
              ),
              title: Row(
                children: [
                  Text(
                    'User Manegment',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ExpansionTile(
              expandedAlignment: Alignment.center,
              iconColor: Colors.white,
              // collapsedBackgroundColor: Colors.white,
              collapsedIconColor: Colors.white,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              leading: Icon(
                Icons.shop,
                size: 35.0,
                color: Colors.white,
              ),
              title: Row(
                children: [
                  Text(
                    'Master',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Text(
                      '4',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // DrawerHeader(child: )
          ],
        ),
      ),
    );
  }
}
