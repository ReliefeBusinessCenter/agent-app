import 'package:app/Widget/common/user_profile.dart';
import 'package:app/Widget/common/user_profile_edit_page.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/delivery.dart';
import 'package:app/screens/Auth/auth_exports.dart';
import 'package:app/screens/Auth/broker-detail-registeration-screen.dart';
import 'package:app/screens/Auth/customer-detail-registeration-screen.dart';
import 'package:app/screens/Auth/password-register-screen.dart';
import 'package:app/screens/Auth/password_reset_screen.dart';
import 'package:app/screens/Auth/signUp_screen.dart';
import 'package:app/screens/admin/admin_category.dart';
import 'package:app/screens/admin/admin_customers_page.dart';
import 'package:app/screens/admin/admin_deals_customer.dart';
import 'package:app/screens/admin/admin_deals_page.dart';
import 'package:app/screens/admin/admin_delivery_customer.dart';
import 'package:app/screens/admin/admin_delivery_page.dart';
import 'package:app/screens/admin/admin_main_page.dart';
import 'package:app/screens/broker/broker_account_screen.dart';
import 'package:app/screens/broker/broker_deals_detail.dart';
import 'package:app/screens/broker/broker_deals_form_page.dart';
import 'package:app/screens/broker/broker_delivery_detail.dart';
import 'package:app/screens/broker/broker_main_page.dart';
import 'package:app/screens/broker/saving_and_loans.dart';
import 'package:app/screens/customer/becomeAnAgent.dart';
import 'package:app/screens/customer/customerPage.dart';
import 'package:app/screens/customer/customer_deals_detail.dart';
import 'package:app/screens/customer/customer_delivery_detail.dart';
import 'package:app/screens/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

bool isAuthenticated = false;

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/login') {
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
    }
    // user profile
    // else if (settings.name == UserProfilePage.routeName) {
    //   User user = settings.arguments as User;
      
    //   return MaterialPageRoute(
    //     builder: (context) => UserProfilePage(user: user,),
    //   );
    // } 
    else if (settings.name == UserProfileEditPage.routeName) {
      User user = settings.arguments as User;
      return MaterialPageRoute(
        builder: (context) => UserProfileEditPage(user: user),
      );
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
    } else if (settings.name == BrokerBrokerDealsDetail.routeName) {
      Deals deals = settings.arguments as Deals;
      return MaterialPageRoute(
          builder: (context) => BrokerBrokerDealsDetail(deals: deals));
    } else if (settings.name == BrokerDeliveryDetails.routeName) {
      Delivery delivery = settings.arguments as Delivery;
      // Customer customer = settings.arguments as Customer;
      return MaterialPageRoute(
          builder: (context) => BrokerDeliveryDetails(
                delivery: delivery,
              ));
    } else if (settings.name == DealsPageScreen.routeName) {
      Customer customer = settings.arguments as Customer;
      // Customer customer = settings.arguments as Customer;
      return MaterialPageRoute(
          builder: (context) => DealsPageScreen(
                customer: customer,
              ));
    } else if (settings.name == AdminCustomerDealsDetail.routeName) {
      Deals deals = settings.arguments as Deals;
      return MaterialPageRoute(
        builder: (context) => AdminCustomerDealsDetail(deals: deals),
      );
    } else if (settings.name == AdminCustomerDeliveryDetails.routeName) {
      Delivery delivery = settings.arguments as Delivery;
      return MaterialPageRoute(
        builder: (context) => AdminCustomerDeliveryDetails(delivery: delivery,),
      );
    }else if (settings.name == AdminCategory.routeName)
      return MaterialPageRoute(builder: (context) => AdminCategory());

     else if (settings.name == PasswordReset.routeName)
      return MaterialPageRoute(builder: (context) => PasswordReset());
    // admin
    else if (settings.name == AdminMainPage.routeName) {
      return MaterialPageRoute(builder: (context) => AdminMainPage());
    } else if (settings.name == AdminDealPage.routeName) {
      return MaterialPageRoute(builder: (context) => AdminDealPage());
    } else if (settings.name == AdminDeliveryPage.routeName) {
      return MaterialPageRoute(builder: (context) => AdminDeliveryPage());
    }
    else if (settings.name == AdminCustomersPage.routeName)
      return MaterialPageRoute(builder: (context) => AdminCustomersPage());

    // welcomepage
    else if (settings.name == "/") {
      return MaterialPageRoute(builder: (context) => WelcomePage());
    }

    return MaterialPageRoute(builder: (context) => WelcomePage());
  }
}
