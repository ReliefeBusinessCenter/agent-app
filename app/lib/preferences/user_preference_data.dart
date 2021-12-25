import 'dart:convert';

import 'package:app/model/broker/broker.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/login_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // User Information
  Future<void> storeUserInformation(LoggedUserInfo info) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_info', jsonEncode(info));
  }

  Future<LoggedUserInfo?> getUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uInfo = prefs.getString('user_info');
    if (uInfo != null) {
      Map<String, dynamic> json = jsonDecode(uInfo) as Map<String, dynamic>;
      var user = LoggedUserInfo.fromJson(json);
      return user;
    } else {
      return null;
    }
  }

  Future<void> removeUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Customer Information
  Future<void> storeCustomerInformation(Customer customer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('customer_info', jsonEncode(customer));
  }

  Future<Customer?> getCustomerInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uInfo = prefs.getString('customer_info');
    Map<String, dynamic> json = jsonDecode(uInfo!) as Map<String, dynamic>;
    var customer = Customer.fromJson(json);
    return customer;
  }

// Broker Information
  Future<void> storeBrokerInformation(Broker broker) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('broker_info', jsonEncode(broker));
  }

  Future<Broker?> getBrokerInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uInfo = prefs.getString('broker_info');
    Map<String, dynamic> json = jsonDecode(uInfo!) as Map<String, dynamic>;
    print("Json Information for hte broker data: $json");
    var broker = Broker.fromJson(json);
    print("Broker Data retrived form the shar preference ; ${broker.toJson()}");
    return broker;
  }

  Future<void> storeTokenAndExpiration(String token, String expiry) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('storing token 1');
    print(token);
    await prefs.setString('token', token);
    await prefs.setString('expiry', expiry);
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('storing token 2');
    print(token);
    await prefs.setString('token', token);
  }

  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> storePassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password);
  }

  Future<String?> getUserPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  Future<void> storeEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<String?> getExpiryTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  DateTime getDateTimeFromString(String dateString) {
    return DateTime.parse(dateString);
  }

  bool isExpired(String expiry) {
    var date = DateTime.parse(expiry);
    if (date.isAfter(DateTime.now())) return false;
    return true;
  }
}
