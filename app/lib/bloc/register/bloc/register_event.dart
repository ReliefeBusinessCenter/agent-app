part of 'register_bloc.dart';

class RegisterEvent {}

class Initialization extends RegisterEvent {}

class AddBasicInfo extends RegisterEvent {
  final User user;
  AddBasicInfo({required this.user});
}

class AddDetailInfo extends RegisterEvent {
  final User user;
  AddDetailInfo({required this.user});
}

class AddBrokerDetail extends RegisterEvent {
  final Broker broker;
  AddBrokerDetail({required this.broker});
}

class AddLocation extends RegisterEvent {
  final double latitude;
  final double longtiude;

  AddLocation({required this.latitude, required this.longtiude});
}

class BecomeAgent extends RegisterEvent {}

class RegisterUser extends RegisterEvent {}
