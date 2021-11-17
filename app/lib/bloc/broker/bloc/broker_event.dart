part of 'broker_bloc.dart';

@immutable
abstract class BrokerEvent {}

class SelectEvent extends BrokerEvent {
  final int categoryId;
  final String search;
  SelectEvent({required this.categoryId, required this.search});
}

class SearchEvent extends BrokerEvent {
  final String name;
  SearchEvent({required this.name});
}

class FetchEvent extends BrokerEvent {}

class DeleteBrokerEvent extends BrokerEvent {
  final int id;
  DeleteBrokerEvent(this.id);
}
