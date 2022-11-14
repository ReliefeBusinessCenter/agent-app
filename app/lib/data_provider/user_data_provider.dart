import 'dart:convert';
import 'dart:io';

import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/login_info.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/repository/brokersRepository.dart';
import 'package:app/repository/customer_repository.dart';

import 'package:http/http.dart' as http;

class UserDataProvider {
  final http.Client httpClient;
  final UserPreferences userPreferences;
  final CustomerRepository customerRepository;
  final BrokersRepository brokerRepository;

  UserDataProvider(
      {required this.httpClient,
      required this.userPreferences,
      required this.customerRepository,
      required this.brokerRepository});

  final String baseUrl = '${Ip.ip}/api/users';

  Future<LoggedUserInfo> login(LoginInfo loginInfo) async {
    print(
        "login clicked: email:${loginInfo.phoneNumber} and password:${loginInfo.password}");
    LoggedUserInfo loggedUserInfo;
    final urlLogin = Uri.parse('$baseUrl/authenticate');
    try {
      final response = await http.post(urlLogin,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
           
            "phone": loginInfo.phoneNumber.toString(),
            "password": loginInfo.password.toString()
          }));

      print("Response: ${response.body}");
      if (response.statusCode != 200) {
        print("Faileddddd");
        throw HttpException('Incorrect email or password');
      } else {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        print("success, $extractedData");
        loggedUserInfo = LoggedUserInfo.fromJson(extractedData);
        print("----55");
        await this.userPreferences.storeUserInformation(loggedUserInfo);
        print("----56");
        String expiry = response.headers['Expires'].toString();
        print("----57");
        await this
            .userPreferences
            .storeTokenAndExpiration(loggedUserInfo.token!, expiry);
        print("----58");
        await this.userPreferences.storeEmail(loginInfo.phoneNumber);
        print("----59");
        await this.userPreferences.storePassword(loginInfo.password);
        print('----60');
        // Store Role Information
        if (loggedUserInfo.user!.role == "Customer") {
          print("the Role is Customer");
          Customer customer = await this
                  .customerRepository
                  .getCustomerByEmail(loggedUserInfo.user!.phone as String)
              as Customer;
          print("----61");
          print("Customer data: ${customer.toJson()}");
          await this.userPreferences.storeCustomerInformation(customer);
        } else if ((loggedUserInfo.user!.role == "Broker")) {
          print("even it reaches at this stage ${loggedUserInfo.user!.role}");
          Broker broker = await this
              .brokerRepository
              .getBrokerByEmail(loggedUserInfo.user!.phone as String) as Broker;
          print("Broker To Be stored ${broker.toJson()}");
          await this.userPreferences.storeBrokerInformation(broker);
        }
        // print('--------------login');
        // print(loggedUserInfo.token);
        // print('--------------login');
      }
    } catch (e) {
      print("login--failed");
      print(e);
      throw e;
    }
    return loggedUserInfo;
  }

  Future<void> updatePassword(String password, confirmedPassword) async {
    final urlUpdatePassword = Uri.parse('$baseUrl/change-password');

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = password;
    data['password_confirmation'] = confirmedPassword;
    try {
      String? token = await this.userPreferences.getUserToken();
      final response = await http.post(
        urlUpdatePassword,
        body: data,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      if (response.statusCode != 201) {
        throw HttpException('Error Occured');
      } else {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        await this.userPreferences.storeToken(extractedData['token'].token!);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> sendOtp(String email) async {
    final urlLogin = Uri.parse('$baseUrl/forgot-password');
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;

    try {
      final response = await http.post(
        urlLogin,
        body: data,
      );
      if (response.statusCode != 200) {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        throw HttpException(extractedData['message']);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> changePassword(
      String email, otp, password, confirmed_password) async {
    final urlLogin = Uri.parse('$baseUrl/change-password-otp');
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['otp'] = otp;
    data['password'] = password;
    data['password_confirmation'] = confirmed_password;

    try {
      final response = await http.post(
        urlLogin,
        body: data,
      );
      if (response.statusCode != 200) {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        throw HttpException(extractedData['message']);
      }
    } catch (e) {
      throw (e);
    }
  }

   Future<User?> getUserByPhone(String phone) async {
    print(
        "============================================================================");
        
        String phoneNumber = "0${phone.toString().substring(4)}";
    print("Fetching of user $phoneNumber");
    final response = await httpClient.get(
      Uri.parse('$baseUrl/$phoneNumber'),
    );
    print("Fetch user response is ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 204) {
      print("the user data iss : ${User.fromJson(jsonDecode(response.body))}");
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> updateUser(User user) async {
    final response = await httpClient.put(
      Uri.parse('$baseUrl/${user.userId}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
        user.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception(response.body);
    }
  }
}
