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

class ChangeSearchMode extends BrokerEvent {
  final bool isName;
  ChangeSearchMode({required this.isName});
}

class UpdateBrokerEvent extends BrokerEvent {
  final bool status;
  final Broker broker;

  UpdateBrokerEvent(this.broker, this.status);
}

class FetchBrokerByEmail extends BrokerEvent {
  final String phone;
  FetchBrokerByEmail(this.phone);
}
