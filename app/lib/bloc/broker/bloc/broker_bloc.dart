import 'dart:async';

// import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/model/broker.dart';
import 'package:app/model/category.dart';
import 'package:app/repository/brokersRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'broker_event.dart';
part 'broker_state.dart';

class BrokerBloc extends Bloc<BrokerEvent, BrokerState> {
  final BrokersRepository brokersRepository;
  List<Broker> brokerList = [];
  int page = 0;

  BrokerBloc({required this.brokersRepository}) : super(BrokerInitial());

  @override
  Stream<BrokerState> mapEventToState(
    BrokerEvent event,
  ) async* {
    yield (BrokersLoading());
    // TODO: implement mapEventToState
    if (event is FetchEvent) {
      try {
        List<Broker> brokers = (await this.brokersRepository.getBrokers(0, ''));

        if (brokers != null) {
          yield BrokersLoadSuccess(selectedCategoryId: 0, brokers: brokers);
        } else {
          yield BrokersLoadFailed(message: "Unable to load brokers");
        }
      } catch (e) {}
    }
    if (event is SelectEvent) {
      print("select even is called");

      List<Broker> brokers = (await this
          .brokersRepository
          .getBrokers(event.categoryId, event.search));
      yield BrokersLoadSuccess(
          selectedCategoryId: event.categoryId, brokers: brokers);

      // filteredBrokers.add(
      //     state.brokers.map((e) => e.categoryId == state.selectedCategoryId));
      print("This is the selected category id: ${event.categoryId}");
      print("This is the state data for the brokers ${state.brokers}");

      // yield (BrokersLoadSuccess(
      //     selectedCategoryId: event.categoryId, brokers: filteredBrokers)

      //     );
    } else if (event is SearchEvent) {
      // search event

    } else if (event is FetchEvent) {
      // fetch event
    }
  }
}
