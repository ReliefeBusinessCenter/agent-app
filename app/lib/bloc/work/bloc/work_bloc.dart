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
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'work_event.dart';
part 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  final CustomerRepository customerRepository;
  final BrokersRepository brokerRepository;
  // WorkBloc();
  WorkBloc({required this.customerRepository, required this.brokerRepository})
      : super(WorkInitial(work_history: []));

  @override
  Stream<WorkState> mapEventToState(
    WorkEvent event,
  ) async* {
    if (event is AddWork) {
      yield AddWorkLoading();
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
      // //  Delete event
      // List<Work> works = state.work_history;
      // if (works.contains(event.work)) {
      //   works.remove(event.work);
      // }
      // yield (DeleteSuccessState(work_history: works));
    } else {
      // // Initial
      // List<Work> works = state.work_history;
      // yield WorkInitial(work_history: works);
    }
  }
}
