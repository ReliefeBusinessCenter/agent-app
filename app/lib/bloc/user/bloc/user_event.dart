part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserByPhone extends UserEvent {
  final String phone;
  GetUserByPhone({required this.phone});
}

class UpdateUser extends UserEvent {
  final User user;
  UpdateUser({required this.user});
}
