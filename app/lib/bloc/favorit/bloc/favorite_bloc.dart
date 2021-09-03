import 'dart:async';


import 'package:app/model/broker/broker.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is Favorite) {
      //
      List<Broker> favorites = state.favorit_brokers;
      if (favorites.contains(event.broker)) {
      } else {
        favorites.add(event.broker);
      }

      yield FavoriteState(favorit_brokers: favorites);
    } else if (event is UnFavorite) {
      List<Broker> favorites = state.favorit_brokers;
      if (favorites.contains(event.broker)) {
        favorites.remove(event.broker);
      }

      yield UnFavoriteSuccess(favorit_brokers: favorites);
    } else if (event is FavoriteInitialFetch) {
      yield FavoriteInitial();
    }
  }
}
