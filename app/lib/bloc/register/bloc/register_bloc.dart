import 'dart:async';

import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/category.dart';
import 'package:app/model/broker/skills.dart';
import 'package:app/model/broker/user.dart';
// import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/user.dart';

import 'package:app/repository/brokersRepository.dart';
import 'package:app/repository/customer_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    } else if (event is AddName) {
      // add name
      // user = state.user as User;
      user.fullName = event.name;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddEmail) {
      // add email
      // user = state.user as User;
      user.email = event.email;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddCity) {
      // add city
      // user = state.user as User;
      user.city = event.city;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddSubCity) {
      // add sub city
      // user = state.user as User;
      user.city = event.subCity;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddImage) {
      // user = state.user as User;
      user.picture = event.image;

      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddKebele) {
      // add kebele
      // user = state.user as User;
      user.kebele = event.kebele;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddGender) {
      // add gender
      // user = state.user as User;
      user.sex = event.gender;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddTypeUser) {
      // add type user
      print("Role: ${event.userType}");
      // user = state.user as User;
      user.role = event.userType;
      print("+++++++++++++++Users Object on Type: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddPassword) {
      // add password
      // user = state.user as User;
      user.password = event.password;
      print("Users: ${user.toJson()}");
      yield RegisterUpdateSuccess(user: user);
      // broker skill registeration
    } else if (event is AddCommunicationSkills) {
      // broker = state.broker as Broker;
      broker.skills!.communicationSkill = event.skill;
      print("Broker: ${broker.toJson()}");
      yield RegisterUpdateSuccess(user: user, broker: broker);
      // add communication skills
    } else if (event is AddBrokerType) {
      print(
          "++++++++________Arrived on the bloc with the follwoing value: ${event.category}");
      // adding the broker category here
      // Category category = event.category;
      broker.category = event.category;
      print("Broker: ${broker.toJson()}");
      yield RegisterUpdateSuccess(user: user, broker: broker);
    } else if (event is AddBrookingSkills) {
      // add brooking skills
      // broker = state.broker as Broker;

      // skills.brokingSkill = event.skill;
      broker.skills!.brokingSkill = event.skill;
      // broker.skills = skills;
      print("Broker: ${broker.toJson()}");
      yield RegisterUpdateSuccess(user: user, broker: broker);
    } else if (event is AddWorkDone) {
      // add workdone
      // broker = state.broker as Broker;
      broker.skills!.workDone = event.skill;
      print("Broker: ${broker.toJson()}");
      yield RegisterUpdateSuccess(user: user, broker: broker);
    } else if (event is AddWorkInProgress) {
      // add work in progress
      // broker = state.broker as Broker;
      broker.skills!.workInProgress = event.skill;
      print("Broker: ${broker.toJson()}");
      yield RegisterUpdateSuccess(user: user, broker: broker);
      // Registeration
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
        customer.user = user as User?;
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
        bool isCreated = await this.brokersRepository.createBroker(broker);
        if (isCreated == true) {
          // created success
          yield RegisterCreateSuccess();
        } else {
          // created failed
          yield RegisterCreateFailed();
        }
      }
    }
  }
}
