part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserSuccess<T> extends UserState {
  final T data;
  UserSuccess({required this.data});
}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String error;
  UserError({required this.error});
}
