part of 'broker_bloc.dart';

@immutable
abstract class BrokerEvent {}

class SelectEvent extends BrokerEvent {
  final int categoryId;
  SelectEvent({required this.categoryId});
}

class SearchEvent extends BrokerEvent {
  final String name;
  SearchEvent({required this.name});
}

class FetchEvent extends BrokerEvent {}
