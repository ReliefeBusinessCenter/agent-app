part of 'register_bloc.dart';

class RegisterState {
  final User? user;
  final Broker? broker;
  final Skills? skills;
  RegisterState({this.user, this.broker, this.skills});
}

class RegisterInitial extends RegisterState {
  final User user;
  
  // RegisterInitial({required this.user});
  RegisterInitial({required this.user}) : super(user: User(), broker: Broker());
}

class RegisterUpdateSuccess extends RegisterState {
  final User? user;
  final Broker? broker;
  final Skills? skills;
  // RegisterUpdateSuccess();
  RegisterUpdateSuccess({this.user, this.broker, this.skills})
      : super(user: user, broker: broker,skills: skills);
}

class RegisterUpdateLoading extends RegisterState {}

class RegisterCreateLoading extends RegisterState {}

class RegisterCreateSuccess extends RegisterState {}

class RegisterCreateFailed extends RegisterState {}

class BeingAnAgentSucess extends RegisterState {}

class BeingAnAgentFailed extends RegisterState {}

class BeingAnAgentCreating extends RegisterState {}
