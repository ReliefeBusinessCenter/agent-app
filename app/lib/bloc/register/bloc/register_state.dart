part of 'register_bloc.dart';

class RegisterState {
  final User? user;
  final Broker? broker;
  RegisterState({ this.user,  this.broker });
}

class RegisterInitial extends RegisterState {
  RegisterInitial() : super(user: User(), broker: Broker());
}
class RegisterUpdateSuccess extends RegisterState{
  final User? user;
  final Broker? broker;
  // RegisterUpdateSuccess();
  RegisterUpdateSuccess({ this.user, this.broker}) : super(user: user, broker: broker);

}

