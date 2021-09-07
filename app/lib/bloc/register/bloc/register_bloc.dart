import 'dart:async';

import 'package:app/model/broker/broker.dart';
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
  RegisterBloc(
      {required this.customerRepositoy, required this.brokersRepository})
      : super(RegisterInitial(user: null));
  // RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is Initialization) {
// Initialization

      user.sex = 'Male';
      user.role = "Customer";
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddName) {
      // add name
      user = state.user as User;
      user.fullName = event.name;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddEmail) {
      // add email
      user = state.user as User;
      user.email = event.email;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddCity) {
      // add city
      user = state.user as User;
      user.city = event.city;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddSubCity) {
      // add sub city
      user = state.user as User;
      user.city = event.subCity;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddKebele) {
      // add kebele
      user = state.user as User;
      user.kebele = event.kebele;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddGender) {
      // add gender
      user = state.user as User;
      user.sex = event.gender;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddTypeUser) {
      // add type user
      user = state.user as User;
      user.role = event.userType;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is RegisterUser) {
      print("Entered to the register bloc");
      yield RegisterCreateLoading();
      // register user event
      print("user object:${state.user!.toJson()}");
      if (state.user!.role == 'Customer') {
        print("Entered to the customer page");
        // customer registeration
        Customer customer = new Customer();
        customer.user = user;
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
      }
    }
  }
}
