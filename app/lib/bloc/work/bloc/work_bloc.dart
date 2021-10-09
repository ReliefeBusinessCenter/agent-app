import 'dart:async';

import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/delivery.dart';
import 'package:app/model/login_info.dart';
import 'package:app/model/work.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/repository/brokersRepository.dart';
import 'package:app/repository/customer_repository.dart';
import 'package:app/repository/delivery_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'work_event.dart';
part 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  final CustomerRepository customerRepository;
  final BrokersRepository brokerRepository;
  final DeliveryRepository deliveryRepository;
  // WorkBloc();
  WorkBloc(
      {required this.customerRepository,
      required this.brokerRepository,
      required this.deliveryRepository})
      : super(WorkInitial(work_history: []));

  @override
  Stream<WorkState> mapEventToState(
    WorkEvent event,
  ) async* {
    if (event is FetchWork) {
      yield WorkLoading();
      //  add event
      // ine logged in user
      UserPreferences userPreference = new UserPreferences();
      LoggedUserInfo? loggedUserInfo =
          await userPreference.getUserInformation();
// define user here
      User user = loggedUserInfo!.user as User;
      String email = await userPreference.getUserEmail() as String;
      // call the get customer by email method
      Customer customer = await this
          .customerRepository
          .getCustomerByEmail(user.email as String) as Customer;
      print("Customer Data: ${customer.toJson()}");
      print("User Email address: ${user.email}");
      List<Delivery> works = customer.delivery as List<Delivery>;
// add broker data here
      for (int i = 0; i < works.length; i++) {
        Broker broker = await this
            .brokerRepository
            .getBrokerById(works[i].brokerId as int) as Broker;
        works[i].broker = broker;
      }
      print("Value of the Customer After Parsing: ${works}");
      // if (!works.contains(event.work)) {
      //   works.add(event.work);
      // }
      yield (AdddWorkSuccess(delivery_history: works));
    } else if (event is DeleteWork) {
      yield WorkLoading();
      bool isDeleted = await this
          .deliveryRepository
          .deleteDelivery(event.work.deliveryId as int);
      if (isDeleted == true) {
        yield DeleteSuccessState(delivery_history: state.delivery_history);
      } else {
        yield DeleteFailedState(
            delivery_history: state.delivery_history,
            message: "Failed to Delete");
      }
    } else if (event is MarkAsDoneWork) {
        yield WorkLoading();
      bool isUpdated = await this.deliveryRepository.updateDelivery(event.work);
      if (isUpdated == true) {
// updated successfully
        yield UpdateSuccessState(
            delivery_history: state.delivery_history, message: "Updated");
      } else {
// failed to updated
        yield UpdateFailedState(
            delivery_history: state.delivery_history,
            message: "Failed to Update");
      }
    } else {
      // // Initial
      // List<Work> works = state.work_history;
      // yield WorkInitial(work_history: works);
    }
  }
}
