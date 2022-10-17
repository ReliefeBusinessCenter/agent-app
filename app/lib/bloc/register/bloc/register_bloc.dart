import 'dart:async';
import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/category.dart';
import 'package:app/model/broker/skills.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/preferences/user_preference_data.dart';

import 'package:app/repository/brokersRepository.dart';
import 'package:app/repository/customer_repository.dart';
import 'package:bloc/bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CustomerRepository customerRepositoy;
  final BrokersRepository brokersRepository;
  User user = User();
  Broker broker = Broker();
  RegisterBloc(
      {required this.customerRepositoy, required this.brokersRepository})
      : super(RegisterInitial(user: User()));
  // RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is Initialization) {
// Initialization

      user.sex = 'Male';
      user.role = "Customer";
      //Initialize broker
      Skills skills = new Skills();
      broker.skills = skills;
      Category category = new Category();
      broker.category = category;

      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddBasicInfo) {
      // add name
      // user = state.user as User;
      user = event.user;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddDetailInfo) {
      // add city
      // user = state.user as User;
      user = event.user;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddBrokerDetail) {
      // broker = state.broker as Broker;
      broker = event.broker;
      print("Broker: ${broker.toJson()}");
      yield RegisterUpdateSuccess(user: user, broker: broker);
      // add communication skills
    } else if (event is AddLocation) {
      user.latitude = event.latitude;
      user.longitude = event.longtiude;
    } else if (event is RegisterUser) {
      print("Entered to the register bloc");
      print(
          "+++++++++++++++++++++++++++++++++++++++++User Role on register method :${user.role}+++++++++");

      yield RegisterCreateLoading();
      // register user event

      print("user object:${user.toJson()}");

      print(
          "+++++++++++++++++++++++++++++++++++++++++User Role on register method :${user.role}+++++++++");
      if (user.role == 'Customer') {
        print("Entered to the customer page");
        // customer registeration
        Customer customer = new Customer();
        customer.user = user;
        print("Customer Data At the Bloc: ${customer.user!.toJson()}");
        bool isCreated = await this.customerRepositoy.createCustomers(customer);
        if (isCreated == true) {
          // created success
          yield RegisterCreateSuccess();
        } else {
          // created failed
          yield RegisterCreateFailed();
        }
      } else {
        //  broker registeration
        print("Entered to the broker page");
        // broker registeration

        broker.user = user;
        print("Broker to be registered: ${broker.toJson()}");
        bool isCreated = await this.brokersRepository.createBroker(broker);
        if (isCreated == true) {
          // created success
          yield RegisterCreateSuccess();
        } else {
          // created failed
          yield RegisterCreateFailed();
        }
      }
    } else if (event is BecomeAgent) {
      print("Arrived here on change role event");
      yield BeingAnAgentCreating();

      // Broker broker = state.broker;
      // retrive user information from the logged in customer.
      UserPreferences userPreference = new UserPreferences();
// define logged in user
      Customer? customer = await userPreference.getCustomerInformation();
      broker.user = customer!.user;
      // delete customer first.
      bool isDeleted = await this
          .customerRepositoy
          .deleteCustomer(customer.customerId as int);

      if (isDeleted != false) {
        // register new broker here
        bool isCreated = await this.brokersRepository.createBroker(broker);
        if (isCreated == true) {
          // created success
          yield BeingAnAgentSucess();
        } else {
          // created failed
          yield BeingAnAgentFailed();
        }
      } else {
        yield BeingAnAgentFailed();
      }
    }
  }
}
