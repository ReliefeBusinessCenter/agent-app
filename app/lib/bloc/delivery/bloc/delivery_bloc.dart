import 'dart:async';

import 'package:app/model/broker/broker.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/model/delivery.dart';
import 'package:app/model/login_info.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/repository/customer_repository.dart';
import 'package:app/repository/delivery_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final DeliveryRepository deliveryRepository;
  // final CustomerRepository customerRepository;
  DeliveryBloc({required this.deliveryRepository})
      : super(DeliveryInitial(delivery: Delivery()));

  @override
  Stream<DeliveryState> mapEventToState(
    DeliveryEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is DeliveryInitializationEvent) {
      // delivery initialization
      UserPreferences userPreference = new UserPreferences();
// define logged in user
      Customer? customer = await userPreference.getCustomerInformation();
// define user here

      Delivery delivery = state.delivery as Delivery;
      delivery.customer = customer;
      // delivery.location=customer.u
      yield DeliveryInitial(delivery: delivery);
    } else if (event is SelectBrokerEvent) {
      // select broker for the delivery
      Broker broker = event.broker;
      Delivery delivery = state.delivery as Delivery;
      delivery.broker = broker;
      yield DeliveryStateUpdated(delivery: delivery);
    } else if (event is DeliveryCreateEvent) {
      print("Delivery creating...............................................");
      // delivery create method
      // delivery create loading
      yield DeliveryCreating(delivery: state.delivery as Delivery);
      bool _alredyExisted = false;
      Delivery _delivery = state.delivery!;
      print("-------------------broker ID___${_delivery.brokerId}");
      UserPreferences _userPreferences = UserPreferences();
     await _userPreferences.getCustomerInformation().then((customer) => {
            print(
                "<-------------------Fetching customer information --------------------------------> ${customer!.delivery}"),
            customer.delivery!.forEach((delivery) {
              print("The delivery object is ${delivery.customer!.customerId}");
              if (delivery.brokerId == _delivery.broker!.brokerId) {
                _alredyExisted = true;
                print(
                    "______________________Already existed = $_alredyExisted");
              }
            })
          });
      print(
          "==================================Creating====================================");
// call the delivery method call
      if (!_alredyExisted) {
        print(
            "=======+++++++ not existed delivery id is ${state.delivery!.broker!.brokerId}}");
        bool isCreated = await this
            .deliveryRepository
            .createDelivery(state.delivery as Delivery);
        if (isCreated == true) {
          // delivery created successfully
          yield DeliveryCreateSuccess(delivery: state.delivery as Delivery);
        } else {
          // delivervy created failed
          yield DeliveryCreateFailed(delivery: state.delivery as Delivery);
        }
      } else {
        print("========================ALready Existed");
        yield DeliveryCreateFailed(delivery: state.delivery as Delivery);
      }
    }
  }
}
