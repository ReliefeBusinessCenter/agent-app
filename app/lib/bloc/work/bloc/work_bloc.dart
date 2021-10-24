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
      List<Delivery> works = [];
      yield WorkLoading();
      //  add event
      // ine logged in user
      UserPreferences userPreference = new UserPreferences();
      LoggedUserInfo? loggedUserInfo =
          await userPreference.getUserInformation();
// define user here
      User user = loggedUserInfo!.user as User;

      // call the get customer by email method
      if (user.role == "Customer") {
        Customer customer =    await userPreference.getCustomerInformation() as Customer;
        print("Customer Data: ${customer.toJson()}");
        print("User Email address: ${user.email}");
         works=customer.delivery as List<Delivery>;
      } else {
        Broker broker =    await userPreference.getBrokerInformation() as Broker;
        print("Broker Data: ${broker.toJson()}");
        print("User Email address: ${user.email}");
         works=broker.delivery as List<Delivery>;
      }

      // List<Delivery> works = customer.delivery as List<Delivery>;

      yield (AdddWorkSuccess(delivery_history: works));
    } else if (event is DeleteWork) {
      yield WorkLoading();
      bool isDeleted = await this
          .deliveryRepository
          .deleteDelivery(event.work.deliveryId as int);

      //

      if (isDeleted == true) {
        yield DeleteSuccessState(delivery_history: state.delivery_history);
      } else {
        yield DeleteFailedState(
            delivery_history: state.delivery_history,
            message: "Failed to Delete");
      }
    } else if (event is MarkAsDoneWork) {
      yield WorkLoading();
      //
      Delivery delivery = event.work;
      delivery.deliveryStatus = "Done";
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
    } else if(event is MarkAsAccepted){
       yield WorkLoading();
      //
      Delivery delivery = event.work;
      delivery.deliveryStatus = "Accepted";
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
    }else if(event is MarkAsRejected){
       yield WorkLoading();
      //
      Delivery delivery = event.work;
      delivery.deliveryStatus = "Rejected";
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
    }
    else {
      // // Initial
      // List<Work> works = state.work_history;
      // yield WorkInitial(work_history: works);
    }
  }
}
