import 'dart:async';

import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/deals.dart';
import 'package:app/model/delivery.dart';
import 'package:app/model/login_info.dart';
// import 'package:app/model/work.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/repository/brokersRepository.dart';
import 'package:app/repository/customer_repository.dart';
import 'package:app/repository/deals_repository.dart';
import 'package:app/repository/delivery_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workdeals_event.dart';
part 'workdeals_state.dart';

class DealsListBloc extends Bloc<DealsEvent, DealsState> {
  final CustomerRepository customerRepository;
  final BrokersRepository brokerRepository;
  final DealsRepository dealsRepository;
  // WorkBloc();
  DealsListBloc(
      {required this.customerRepository,
      required this.brokerRepository,
      required this.dealsRepository})
      : super(DealsInitial(work_history: []));

  @override
  Stream<DealsState> mapEventToState(
    DealsEvent event,
  ) async* {
    if (event is FetchDeals) {
      List<Deals> works = [];
      yield DealsLoading();
      //  add event
      // ine logged in user
      UserPreferences userPreference = new UserPreferences();
      LoggedUserInfo? loggedUserInfo =
          await userPreference.getUserInformation();
// define user here
      //     User user = loggedUserInfo!.user as User;
      //  LoggedUserInfo? loggedUserInfo =
      //           await userPreference.getUserInformation();
      User user = loggedUserInfo!.user as User;
      // call the get customer by email method
      if (user.role == "Customer") {
// define user here

        Customer customer = await this
            .customerRepository
            .getCustomerByEmail(user.email as String) as Customer;
        List<Deals> deals = customer.deals as List<Deals>;
        yield UpdateDealsSuccessState(deals_history: deals, message: "Updated");
        print("Customer Data: ${customer.toJson()}");
        print("User Email address: ${user.email}");
        works = customer.deals as List<Deals>;
      } else {
        UserPreferences userPreference = new UserPreferences();
        LoggedUserInfo? loggedUserInfo =
            await userPreference.getUserInformation();
// define user here

        Broker broker = await this
            .brokerRepository
            .getBrokerByEmail(user.email as String) as Broker;
        List<Deals> deals = broker.deals as List<Deals>;
        yield UpdateDealsSuccessState(deals_history: deals, message: "Updated");
        print("Broker Data: ${broker.toJson()}");
        print("User Email address: ${user.email}");
        works = broker.deals as List<Deals>;
      }

      // List<Delivery> works = customer.delivery as List<Delivery>;

      yield FetchDealsSuccess(deals_history: works);
    } else if (event is DeleteDeals) {
      yield DealsLoading();
      bool isDeleted =
          await this.dealsRepository.deleteDeals(event.deals.dealsId as int);

      //

      if (isDeleted == true) {
        yield DeleteDealsSuccessState(deals_history: state.deals_history);
      } else {
        yield DeleteDealsFailedState(
            deals_history: state.deals_history, message: "Failed to Delete");
      }
    } else if (event is MarkAsDoneDeals) {
      yield DealsLoading();
      //
      Deals deals = event.deals;
      deals.dealsStatus = "Done";
      bool isUpdated = await this.dealsRepository.updateDeals(deals);

      if (isUpdated == true) {
// updated successfully
        yield UpdateDealsSuccessState(
            deals_history: state.deals_history, message: "Updated");
      } else {
// failed to updated
        yield UpdateDealsFailedState(
            deals_history: state.deals_history, message: "Failed to Update");
      }
    } else if (event is MarkAsAccepted) {
      yield DealsLoading();
      //
      Deals deals = event.deals;
      deals.dealsStatus = "Accepted";
      bool isUpdated = await this.dealsRepository.updateDeals(deals);

      if (isUpdated == true) {
// updated successfully

        yield UpdateDealsSuccessState(
            deals_history: state.deals_history, message: "Updated");
      } else {
        print("Failed to update delivery");
// failed to updated
        yield UpdateDealsFailedState(
            deals_history: state.deals_history, message: "Failed to Update");
      }
    } else if (event is MarkAsRejected) {
      yield DealsLoading();
      //
      Deals deals = event.work;
      deals.dealsStatus = "Rejected";
      bool isUpdated = await this.dealsRepository.updateDeals(deals);

      if (isUpdated == true) {
// updated successfully

        yield UpdateDealsSuccessState(
            deals_history: state.deals_history, message: "Updated");
      } else {
// failed to updated
        yield UpdateDealsFailedState(
            deals_history: state.deals_history, message: "Failed to Update");
      }
    } else {
      // // Initial
      // List<Work> works = state.work_history;
      // yield WorkInitial(work_history: works);
    }
  }
}
