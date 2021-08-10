part of 'favorite_bloc.dart';

class FavoriteState {
  final List<Broker> favorit_brokers;

  FavoriteState({required this.favorit_brokers});

  @override
  List<Object> get props => [favorit_brokers];
}

class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super(favorit_brokers: []);
}

class UnFavoriteSuccess extends FavoriteState {
  final List<Broker> favorit_brokers;
  UnFavoriteSuccess({required this.favorit_brokers})
      : super(favorit_brokers: favorit_brokers);
}
