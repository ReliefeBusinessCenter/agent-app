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

class ChangeSearchMode extends BrokerEvent {
  final bool isName;
  ChangeSearchMode({required this.isName});
}
