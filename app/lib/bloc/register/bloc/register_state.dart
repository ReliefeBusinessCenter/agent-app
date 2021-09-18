part of 'register_bloc.dart';

class RegisterState {
  final User? user;
  final Broker? broker;
  RegisterState({this.user, this.broker});
}

class RegisterInitial extends RegisterState {
  final User user;
  // RegisterInitial({required this.user});
  RegisterInitial({required this.user}) : super(user: User(), broker: Broker());
}

class RegisterUpdateSuccess extends RegisterState {
  final User? user;
  final Broker? broker;
  // RegisterUpdateSuccess();
  RegisterUpdateSuccess({this.user, this.broker})
      : super(user: user, broker: broker);
} 

class RegisterUpdateLoading extends RegisterState {}

class RegisterCreateLoading extends RegisterState {}

class RegisterCreateSuccess extends RegisterState {}

class RegisterCreateFailed extends RegisterState {}
