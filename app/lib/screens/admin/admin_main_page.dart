import 'package:app/constants/constants.dart';
import 'package:app/screens/admin/drawer.dart';
import 'package:flutter/material.dart';

class AdminMainPage extends StatefulWidget {
  static const routeName = "adminHomePage";
  const AdminMainPage({Key? key}) : super(key: key);

  @override
  _AdminMainPageState createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        child: AdminDrawer(),
      ),
      body: Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.home),
        onPressed: () {},
      ),
      drawerEnableOpenDragGesture: true,
      bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: CircularNotchedRectangle(),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.dashboard_customize),
                  color: Colors.white,
                  onPressed: () {
                    print("search icon button have been clicked");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.details),
                  color: Colors.white,
                  onPressed: () {
                    print("the note icon button have been clicked");
                  },
                )
              ]),
        )
    );
  }
}
