part of 'register_bloc.dart';

class RegisterEvent {}

class Initialization extends RegisterEvent {}

class AddName extends RegisterEvent {
  final String name;
  AddName({required this.name});
}

class AddPhone extends RegisterEvent {
  final String phoneNumber;
  AddPhone({required this.phoneNumber});
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

class AddAbout extends RegisterEvent {
  final String about;
  AddAbout(this.about);
}

class AddIdImage extends RegisterEvent {
  final String image;
  AddIdImage(this.image);
}

class AddLatitudeLongitude extends RegisterEvent {
  final double latitude;
  final double longitude;
  AddLatitudeLongitude({
    required this.latitude,
    required this.longitude,
  });
}

class RegisterUser extends RegisterEvent {}
