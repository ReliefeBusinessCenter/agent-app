import 'dart:async';

import 'package:app/model/broker.dart';
import 'package:app/model/category.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'broker_event.dart';
part 'broker_state.dart';

class BrokerBloc extends Bloc<BrokerEvent, BrokerState> {
  BrokerBloc() : super(BrokerInitial());

  @override
  Stream<BrokerState> mapEventToState(
    BrokerEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is SelectEvent) {
      print("select even is called");
      yield BrokerState(selectedCategoryId: event.categoryId);
    } else if (event is SearchEvent) {
      // search event
    } else if (event is FetchEvent) {
      // fetch event
    }
  }
}
