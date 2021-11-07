import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/delivery.dart';
import 'package:app/screens/Auth/auth_exports.dart';
import 'package:app/screens/Auth/broker-detail-registeration-screen.dart';
import 'package:app/screens/Auth/customer-detail-registeration-screen.dart';
import 'package:app/screens/Auth/password-register-screen.dart';
import 'package:app/screens/Auth/signUp_screen.dart';
import 'package:app/screens/broker/broker_account_screen.dart';
import 'package:app/screens/broker/broker_deals_form_page.dart';
import 'package:app/screens/broker/broker_delivery_detail.dart';
import 'package:app/screens/broker/broker_main_page.dart';
import 'package:app/screens/broker/saving_and_loans.dart';
import 'package:app/screens/customer/becomeAnAgent.dart';
import 'package:app/screens/customer/customerPage.dart';
import 'package:app/screens/customer/customer_deals_detail.dart';
import 'package:app/screens/customer/customer_delivery_detail.dart';
import 'package:flutter/material.dart';

bool isAuthenticated = false;

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => Login());
    } else if (settings.name == CustomerPage.routeName) {
      return MaterialPageRoute(builder: (context) => CustomerPage());
    } else if (settings.name == BrokerAccountScreen.routeName) {
      return MaterialPageRoute(builder: (context) => BrokerAccountScreen());
    } else if (settings.name == SavingAndLoan.routeName) {
      return MaterialPageRoute(builder: (context) => SavingAndLoan());
    } else if (settings.name == BrokerMain.routeName) {
      return MaterialPageRoute(builder: (context) => BrokerMain());
      // } else if (settings.name == BrokersProfilePage.routeName) {
      //   return MaterialPageRoute(builder: (context) => BrokersProfilePage());
      // }
    } else if (settings.name == NewCredentialsScreen.routeName) {
      return MaterialPageRoute(builder: (context) => NewCredentialsScreen());
    } else if (settings.name == BecomeAnAgent.routeName) {
      return MaterialPageRoute(builder: (context) => BecomeAnAgent());
    } else if (settings.name == SignUpPageScreen.routeName) {
      return MaterialPageRoute(builder: (context) => SignUpPageScreen());
    } else if (settings.name == PasswordRegisterScreen.routeName) {
      return MaterialPageRoute(builder: (context) => PasswordRegisterScreen());
    } else if (settings.name == BrokerDetailScreen.routeName) {
      return MaterialPageRoute(builder: (context) => BrokerDetailScreen());
    } else if (settings.name == CustomerDetailScreen.routeName) {
      return MaterialPageRoute(builder: (context) => CustomerDetailScreen());
    } else if (settings.name == CustomerDetailScreen.routeName) {
      return MaterialPageRoute(builder: (context) => CustomerDetailScreen());
    } else if (settings.name == CustomerDeliveryDetails.routeName) {
      Delivery delivery = settings.arguments as Delivery;
      // Customer customer = settings.arguments as Customer;
      return MaterialPageRoute(
          builder: (context) => CustomerDeliveryDetails(
                delivery: delivery,
              ));
    } else if (settings.name == CustomerDealsDetail.routeName) {
      Deals deals = settings.arguments as Deals;
      // Customer customer = settings.arguments as Customer;
      return MaterialPageRoute(
          builder: (context) => CustomerDealsDetail(
                deals: deals,
              ));
    } else if (settings.name == BrokerDeliveryDetails.routeName) {
      Delivery delivery = settings.arguments as Delivery;
      // Customer customer = settings.arguments as Customer;
      return MaterialPageRoute(
          builder: (context) => BrokerDeliveryDetails(
                delivery: delivery,
              ));
    } 
    else if (settings.name == DealsPageScreen.routeName) {
      Customer customer = settings.arguments as Customer;
      // Customer customer = settings.arguments as Customer;
      return MaterialPageRoute(
          builder: (context) => DealsPageScreen(
                customer: customer,
              ));
    } else if (settings.name == PasswordReset.routeName)
      return MaterialPageRoute(builder: (context) => PasswordReset());

    return MaterialPageRoute(builder: (context) => Login());
  }
}
