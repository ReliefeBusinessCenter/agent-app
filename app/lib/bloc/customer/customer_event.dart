part of 'customer_bloc.dart';

abstract class CustomerEvent {
  const CustomerEvent();

 
}


class SearchEvent extends CustomerEvent {
  final String name;
  SearchEvent({required this.name});
}

class FetchEvent extends CustomerEvent {}