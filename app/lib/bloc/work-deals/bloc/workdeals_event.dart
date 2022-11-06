part of 'workdeals_bloc.dart';

abstract class DealsEvent extends Equatable {
  const DealsEvent();

  @override
  List<Object> get props => [];
}

class DealsInitialFetch extends DealsEvent {}

class FetchDeals extends DealsEvent {}

class DeleteDeals extends DealsEvent {
  final Deals deals;
  DeleteDeals({required this.deals});
}

class MarkAsDoneDeals extends DealsEvent {
  final Deals deals;
  MarkAsDoneDeals({required this.deals});
}

class MarkAsAccepted extends DealsEvent {
  final Deals deals;
  MarkAsAccepted({required this.deals});
}
class MarkAsRejected extends DealsEvent {
  final Deals work;
  MarkAsRejected({required this.work});
}