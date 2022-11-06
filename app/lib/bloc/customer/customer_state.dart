part of 'customer_bloc.dart';

@immutable
class CustomerState {
  final List<Customer> customers;
  CustomerState({required this.customers});
}

class CustomersInitial extends CustomerState {
  CustomersInitial() : super(customers: []);
}

class CustomersLoading extends CustomerState {
  CustomersLoading() : super(customers: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CustomersLoadSuccess extends CustomerState {
  final List<Customer> customers;

  CustomersLoadSuccess({required this.customers}) : super(customers: customers);
}

class CustomersLoadFailed extends CustomerState {
  final String message;

  CustomersLoadFailed({required this.message}) : super(customers: []);
}
