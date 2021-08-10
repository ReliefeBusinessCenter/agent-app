part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FavoriteInitialFetch extends FavoriteEvent {}

class Favorite extends FavoriteEvent {
  final Broker broker;
  Favorite({required this.broker});
}

class UnFavorite extends FavoriteEvent {
  final Broker broker;
  UnFavorite({required this.broker});
}
