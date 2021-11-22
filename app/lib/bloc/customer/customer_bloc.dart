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

  String? searchCustomerName = '';
  int page = 0;

  @override
  Stream<CustomerState> mapEventToState(
    CustomerEvent event,
  ) async* {
    if (event is FetchEvent) {
      yield CustomersLoading();
      try {
        List<Customer> customers =
            (await this.customerRepository.getCustomers());
        print("Data arrived at the data provider: $customers");

        if (customers != []) {
          customerList = customers;
          yield CustomersLoadSuccess(customers: customerList);
        } else {
          yield CustomersLoadFailed(message: "Unable to load brokers");
        }
      } catch (e) {}
    } else if (event is UpdateCustomerEvent) {
      yield CustomersLoading();
      try {
        Customer _customer =
            await customerRepository.updateCustomer(event.customer);
        
        if(_customer is Customer ){
          yield CustomersLoadSuccess(customers: [_customer]);
        }else{
          yield CustomersLoadFailed(message: "Unable to update customer");
        }
        
      } catch (e) {
        yield CustomersLoadFailed(message: "Unable to update customer");
      }
    } else if(event is FetchCustomerByEmail){
      yield CustomersLoading();
    }
     else if (event is DeleteCustomerEvent) {
      yield CustomersLoading();
      try {
        bool _deleteResponse =
            await customerRepository.deleteCustomer(event.id);
        List<Customer> customers =
            (await this.customerRepository.getCustomers());
        print("Data arrived at the data provider: $customers");

        if (customers != [] && _deleteResponse) {
          customerList = customers;
          yield CustomersLoadSuccess(customers: customerList);
        } else {
          yield CustomersLoadFailed(message: "Unable to load brokers");
        }
      } catch (e) {
        debugPrint('ddddddddddddddddddddddddddddddddddeeeeeee${e.toString()}');
        yield CustomersLoadFailed(message: "Unable to load brokers");
      }
    } else if (event is SearchEvent) {
      // search event
      //
      this.searcheCustomers = [];
      print("Search event is scalled");
      this.searchCustomerName = event.name;
      this.page = 1;

      //  filter from the cache
      for (int i = 0; i < customerList.length; i++) {
        if (customerList[i]
            .user!
            .fullName!
            .toLowerCase()
            .contains(this.searchCustomerName.toString().toLowerCase())) {
          this.searcheCustomers.add(customerList[i]);
        }
      }

      yield CustomersLoadSuccess(customers: searcheCustomers);
    }
  }
}
