part of 'register_bloc.dart';

class RegisterEvent {}

class Initialization extends RegisterEvent {}

class AddName extends RegisterEvent {
  final String name;
  AddName({required this.name});
}

class AddEmail extends RegisterEvent {
  final String email;
  AddEmail({required this.email});
}

class AddCity extends RegisterEvent {
  final String city;
  AddCity({required this.city});
}

class AddSubCity extends RegisterEvent {
  final String subCity;
  AddSubCity({required this.subCity});
}

class AddKebele extends RegisterEvent {
  final String kebele;
  AddKebele({required this.kebele});
}

class AddGender extends RegisterEvent {
  final String gender;
  AddGender({required this.gender});
}

class AddTypeUser extends RegisterEvent {
  final String userType;
  AddTypeUser({required this.userType});
}

class AddImage extends RegisterEvent {
  final String image;
  AddImage({required this.image});
}

class AddPassword extends RegisterEvent {
  final String password;
  AddPassword({required this.password});
}

// broker registeration
class AddCommunicationSkills extends RegisterEvent {
  final double skill;
  AddCommunicationSkills({required this.skill});
}


class AddBrokerType extends RegisterEvent {
  final Category? category;
  AddBrokerType({this.category});
}


class AddBrookingSkills extends RegisterEvent {
  final double skill;
  AddBrookingSkills({required this.skill});
}


class AddWorkDone extends RegisterEvent {
  final double skill;
  AddWorkDone({required this.skill});
}

class AddWorkInProgress extends RegisterEvent {
  final double skill;
  AddWorkInProgress({required this.skill});
}

class BecomeAgent extends RegisterEvent {
  // final Broker broker;
  // BecomeAgent({required this.broker});
}

class RegisterUser extends RegisterEvent {}
