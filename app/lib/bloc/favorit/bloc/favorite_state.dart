part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<Broker> favorit_brokers;

  FavoriteState({required this.favorit_brokers});

  @override
  List<Object> get props => [favorit_brokers];
}

class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super(favorit_brokers: []);
}
