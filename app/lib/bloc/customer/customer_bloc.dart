import 'package:app/model/customer/customer.dart';
import 'package:app/repository/customer_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  CustomerBloc({required this.customerRepository}) : super(CustomersInitial());
  List<Customer> customerList = [];
  
  List<Customer> searcheCustomers = [];
 
  String? searchBrokerName = '';
  int page = 0;
 

   @override
  Stream<CustomerState> mapEventToState(
    CustomerEvent event,
  ) async* {
    if (event is FetchEvent) {
      try {
        List<Customer> customers = (await this.customerRepository.getCustomers());
        print("Data arrived at the data provider: $customers");

        if (customers != []) {
          customerList = customers;
          yield CustomersLoadSuccess(customers: customerList);
        } else {
          yield CustomersLoadFailed(message: "Unable to load brokers");
        }
      } catch (e) {}
    }
  }
}
