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
