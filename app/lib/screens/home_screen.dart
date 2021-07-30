import 'package:flutter/material.dart';
import 'profile_screen.dart';
import '../constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV'),
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.align_horizontal_left)),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              primaryColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: Profile(),
      ),
      drawerEnableOpenDragGesture: true,
    );
  }
}
