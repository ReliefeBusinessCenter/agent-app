import 'dart:async';

// import 'package:app/Widget/Dashboard/broker.dart';

import 'package:app/model/broker/broker.dart';
// import 'package:app/model/category.dart';
import 'package:app/repository/brokersRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'broker_event.dart';
part 'broker_state.dart';

class BrokerBloc extends Bloc<BrokerEvent, BrokerState> {
  final BrokersRepository brokersRepository;
  List<Broker> brokerList = [];
  List<Broker> selectedCategories = [];
  List<Broker> searchedBrokers = [];
  int? categoryId;
  String? searchBrokerName = '';
  int page = 0;

  BrokerBloc({required this.brokersRepository}) : super(BrokerInitial());

  @override
  Stream<BrokerState> mapEventToState(
    BrokerEvent event,
  ) async* {
    yield (BrokersLoading(isName: state.isName));
    // TODO: implement mapEventToState
    if (event is FetchEvent) {
      try {
        List<Broker> brokers = (await this.brokersRepository.getBrokers());
        print("Data arrived at the data provider: ${brokers}");

        if (brokers != null) {
          brokerList = brokers;
          yield BrokersLoadSuccess(
              selectedCategoryId: 0, brokers: brokerList, isName: state.isName);
        } else {
          yield BrokersLoadFailed(message: "Unable to load brokers");
        }
      } catch (e) {}
    }
    if (event is DeleteBrokerEvent) {
      try {
        bool _deleteResponse = await brokersRepository.deleteBroker(event.id);
        List<Broker> brokers = (await this.brokersRepository.getBrokers());
        print("Data arrived at the data provider: ${brokers}");

        if (brokers != [] && _deleteResponse) {
          brokerList = brokers;
          yield BrokersLoadSuccess(
              selectedCategoryId: 0, brokers: brokerList, isName: state.isName);
        } else {
          yield BrokersLoadFailed(message: "Unable to load brokers");
        }
      } catch (e) {
        yield BrokersLoadFailed(message: "Unable to load brokers");
      }
    }
    if (event is SelectEvent) {
      print("select event from product bloc");
      //
      print("Category Id: ${event.categoryId}");
      this.selectedCategories = [];
      print("Select event i scalled");
      this.categoryId = event.categoryId;
      if (event.categoryId == 0) {
        print("selact all event have been called");
        print("Broker list: $brokerList");
        yield BrokersLoadSuccess(
            selectedCategoryId: event.categoryId,
            brokers: brokerList,
            isName: state.isName);
      } else {
        for (int i = 0; i < brokerList.length; i++) {
          int brokerCatID = brokerList[i].category!.categoryId as int;
          print("Broker Categrory Id:${brokerList[i].category!.toJson()}");

          // print("This is the category ID for th product: ${productCatID}");
          if (brokerCatID == (event.categoryId)) {
            print("All category has ben clicked");
            this.selectedCategories.add(brokerList[i]);
          }

          print("Products: ${this.selectedCategories}");
          yield BrokersLoadSuccess(
              selectedCategoryId: event.categoryId,
              brokers: selectedCategories,
              isName: state.isName);
        }
      }

      // print("Products: ${this.selectedCategories[0].order}");
      // print("select even is called");

      // List<Broker> brokers = (await this.brokersRepository.getBrokers());
      // yield BrokersLoadSuccess(
      //     selectedCategoryId: event.categoryId, brokers: brokers);

      // // filteredBrokers.add(
      // //     state.brokers.map((e) => e.categoryId == state.selectedCategoryId));
      // print("This is the selected category id: ${event.categoryId}");
      // print("This is the state data for the brokers ${state.brokers}");

      // yield (BrokersLoadSuccess(
      //     selectedCategoryId: event.categoryId, brokers: filteredBrokers)

      //     );
    } else if (event is UpdateBrokerEvent) {
      try {
        Broker _brokerResponse =
            await brokersRepository.updateBroker(event.broker, event.status);
          List<Broker> brokers = (await this.brokersRepository.getBrokers());
        if (_brokerResponse is Broker) {
          yield BrokersLoadSuccess(
              brokers: brokers,
              isName: state.isName,
              selectedCategoryId: 0);
        } else {
          yield BrokersLoadFailed(message: "Failed to update broker");
        }
      } catch (e) {
        yield BrokersLoadFailed(message: "Failed to update broker");
      }
    }
    else if (event is UpdateBrokerProfileEvent) {
      try {
        Broker _brokerResponse =
            await brokersRepository.updateBrokerProfile(event.broker, event.imageChanged);
        if (_brokerResponse is Broker) {
          yield BrokersLoadSuccess(
              brokers: [_brokerResponse],
              isName: state.isName,
              selectedCategoryId: 0);
        } else {
          yield BrokersLoadFailed(message: "Failed to update broker");
        }
      } catch (e) {
        yield BrokersLoadFailed(message: "Failed to update broker");
      }
    }
     else if (event is SearchEvent) {
      // search event
      //
      this.searchedBrokers = [];
      print("Search event is scalled");
      this.searchBrokerName = event.name;
      this.page = 1;

      //  filter from the cache
      for (int i = 0; i < brokerList.length; i++) {
        if (state.isName) {
          if (brokerList[i]
              .user!
              .fullName!
              .toLowerCase()
              .contains(this.searchBrokerName.toString().toLowerCase())) {
            this.searchedBrokers.add(brokerList[i]);
          }
        } else {
          if (brokerList[i]
              .user!
              .city!
              .toLowerCase()
              .contains(this.searchBrokerName.toString().toLowerCase())) {
            this.searchedBrokers.add(brokerList[i]);
          }
        }
      }

      yield BrokersLoadSuccess(
          selectedCategoryId: state.selectedCategoryId,
          brokers: searchedBrokers,
          isName: state.isName);
    } else if (event is FetchEvent) {
      // fetch event
    } else if (event is ChangeSearchMode) {
      yield BrokersLoadSuccess(
          selectedCategoryId: state.selectedCategoryId,
          brokers: brokerList,
          isName: event.isName);
      // yield SearchModeChanged(
      //     selectedCategoryId: state.selectedCategoryId,
      //     brokers: state.brokers,
      //     isName: event.isName);
    } else if (event is FetchBrokerByEmail) {
      try {
        Broker? _broker = await brokersRepository.getBrokerByEmail(event.phone);
        if (_broker is Broker) {
          yield BrokersLoadSuccess(
              isName: state.isName,
              selectedCategoryId: state.selectedCategoryId,
              brokers: [_broker]);
        } else {
          yield BrokersLoadFailed(message: "Unable to fetch");
        }
      } catch (e) {
        yield BrokersLoadFailed(message: "Unable to fetch");
      }
    }
  }
}
