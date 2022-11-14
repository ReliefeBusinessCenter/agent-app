import 'package:app/Widget/common/user_profile_edit_page.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/delivery.dart';
import 'package:app/repository/user_repository.dart';
import 'package:app/screens/Registeration/registeration_exports.dart';
import 'package:app/screens/Registeration/BrokerAdditionalDetail/brokers_details_screen.dart';
import 'package:app/screens/Registeration/DetailInfo/detail_info.dart.dart';
// import 'package:app/screens/Registeration/password-register-screen.dart';
import 'package:app/screens/Registeration/BasicInfo/basic_info_screen.dart';
import 'package:app/screens/Splash/welcome_page.dart';
import 'package:app/screens/PhoneVerification/phone_verification_screen.dart';
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
import 'package:app/screens/PhoneVerification/otp_code_entring_screen.dart';
import 'package:app/screens/customer/becomeAnAgent.dart';
import 'package:app/screens/customer/customerPage.dart';
import 'package:app/screens/customer/customer_deals_detail.dart';
import 'package:app/screens/customer/customer_delivery_detail.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

bool isAuthenticated = false;

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return MaterialPageRoute(builder: (context) => Login());
    } else if (settings.name == SplashScreen.routeName) {
      return MaterialPageRoute(
        builder: (context) => SplashScreen(title: "Trust Broker"),
      );
    } else if (settings.name == PhoneVerificationPage.routeName) {
      final PhoneArgument phoneNumber = settings.arguments as PhoneArgument;
      return MaterialPageRoute(
          builder: (context) => PhoneVerificationPage(phoneNumber));
    } else if (settings.name == CustomerPage.routeName) {
      return MaterialPageRoute(builder: (context) => CustomerPage());
    } else if (settings.name == BrokerAccountScreen.routeName) {
      return MaterialPageRoute(builder: (context) => BrokerAccountScreen());
    } else if (settings.name == SavingAndLoan.routeName) {
      Broker _broker = settings.arguments as Broker;
      return MaterialPageRoute(
          builder: (context) => SavingAndLoan(
                broker: _broker,
              ));
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
      // final String phoneNumber = settings.arguments as String;
      final PhoneArgument phoneArgument = settings.arguments as PhoneArgument;
      return MaterialPageRoute(
          builder: (context) => SignUpPageScreen(
                phoneNumber: phoneArgument.phone,
              ));
    // } else if (settings.name == PasswordRegisterScreen.routeName) {
    //   return MaterialPageRoute(builder: (context) => PasswordRegisterScreen());
    } else if (settings.name == BrokerDetailScreen.routeName) {
      final String phoneNumber =  settings.arguments.toString();
      return MaterialPageRoute(
        builder: (context) => BrokerDetailScreen(
          phoneNumber: phoneNumber.toString(),
        ),
      );
    } else if (settings.name == DetailScreen.routeName) {
       String? phoneNumber = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => DetailScreen(
                phoneNumber: phoneNumber,
              ));
    } else if (settings.name == DetailScreen.routeName) {
      final String phoneNumber = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => DetailScreen(
                phoneNumber: phoneNumber,
              ));
    } else if (settings.name == GoIn.routeName) {
      return MaterialPageRoute(
        builder: (context) => GoIn(),
      );
    }
    // user profile
    // else if (settings.name == UserProfilePage.routeName) {
    //   User user = settings.arguments as User;

    //   return MaterialPageRoute(
    //     builder: (context) => UserProfilePage(user: user,),
    //   );
    // }
    else if (settings.name == UserProfileEditPage.routeName) {
      Customer _customer = settings.arguments as Customer;
      return MaterialPageRoute(
        builder: (context) => UserProfileEditPage(customer: _customer),
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
        builder: (context) => AdminCustomerDeliveryDetails(
          delivery: delivery,
        ),
      );
    } else if (settings.name == AdminCategory.routeName)
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
    } else if (settings.name == AdminCustomersPage.routeName)
      return MaterialPageRoute(builder: (context) => AdminCustomersPage());

    // welcomepage
    else if (settings.name == "/") {
      return MaterialPageRoute(builder: (context) => WelcomePage());
    }

    return MaterialPageRoute(builder: (context) => WelcomePage());
  }
}
