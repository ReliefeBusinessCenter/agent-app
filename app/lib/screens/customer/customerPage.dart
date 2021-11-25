import 'package:app/bloc/customer/customer_bloc.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants.dart';
import 'drawer.dart';
import 'favorite_screen.dart';
import 'history_screen.dart';
import 'home_fragment_screen.dart';
import 'customer_deals_page.dart';
import 'package:easy_localization/easy_localization.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class CustomerPage extends StatefulWidget {
  static const routeName = 'home';

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  int _selectedIndex = 0;
  late String filter = "All";
  @override
  void initState() {
    _getCustomer();
    super.initState();
  }

  _getCustomer() async {
    UserPreferences _userPreferences = UserPreferences();
    _userPreferences.getCustomerInformation().then(
      (customer) {
        BlocProvider.of<CustomerBloc>(context).add(
          FetchCustomerByEmail(customer!.user!.phone!),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    filter = LocaleKeys.all_status_text.tr();
    return Scaffold(
      key: _scaffoldKey,
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
          // if (_selectedIndex == 0)
          PopupMenuButton(
            onSelected: (index) {
              print("Selected index is $index");
              // if (index == 1) {
              //   print("index is 1111111111111111111111111111111111");
              //   setState(() {
              //     filter = LocaleKeys.all_status_text.tr();
              //   });
              // } else if(index == 2) {
              //   print("Index is 2222222222222222222222222222222222");
              //   setState(() {
              //     filter = LocaleKeys.favorite_label_text.tr();
              //   });
              // }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(LocaleKeys.all_status_text.tr()),
                value: 1,
              ),
              PopupMenuItem(
                child: Text(LocaleKeys.favorite_label_text.tr()),
                value: 1,
              ),
            ],
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              primaryColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: AppDrawer(),
      ),
      drawerEnableOpenDragGesture: true,
      body: _getDrawerItemWidget(this._selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: LocaleKeys.home_label_text.tr(),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: LocaleKeys.delivery_label_text.tr(),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: LocaleKeys.deals_label_text.tr(),
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: LocaleKeys.chat_label_text.tr(),
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

  _getDrawerItemWidget(int index) {
    switch (index) {
      case 0:
        return new HomeFragment(filter);
      case 1:
        return new HistoryScreen();
      case 2:
        return new CustomerDealsPage();
      case 3:
        return new FavoritScreen();

      default:
        return new HomeFragment(filter);
    }
  }
}
