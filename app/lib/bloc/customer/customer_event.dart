part of 'customer_bloc.dart';

abstract class CustomerEvent {
  const CustomerEvent();
}

class SearchEvent extends CustomerEvent {
  final String name;
  SearchEvent({required this.name});
}

class FetchEvent extends CustomerEvent {}

class DeleteCustomerEvent extends CustomerEvent {
  final int id;

  DeleteCustomerEvent(this.id);
}

class UpdateCustomerEvent extends CustomerEvent {
  final Customer customer;
  final bool imageChanged;

  UpdateCustomerEvent(this.customer, this.imageChanged);
}

class FetchCustomerByEmail extends CustomerEvent {
  final String phone;

  FetchCustomerByEmail(this.phone);
}

