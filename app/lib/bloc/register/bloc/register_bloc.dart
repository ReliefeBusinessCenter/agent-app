import 'dart:async';

import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is Initialization) {
// Initialization
      yield RegisterInitial();
    } else if (event is AddName) {
      // add name
      User user = state.user as User;
      user.fullName = event.name;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddEmail) {
      // add email
      User user = state.user as User;
      user.email = event.email;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddCity) {
      // add city
      User user = state.user as User;
      user.city = event.city;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddSubCity) {
      // add sub city
      User user = state.user as User;
      user.city = event.subCity;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddKebele) {
      // add kebele
      User user = state.user as User;
      user.kebele = event.kebele;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddGender) {
      // add gender
      User user = state.user as User;
      user.sex = event.gender;
      yield RegisterUpdateSuccess(user: user);
    } else if (event is AddTypeUser) {
      // add type user
      User user = state.user as User;
      user.role = event.userType;
      yield RegisterUpdateSuccess(user: user);
    }
  }
}
