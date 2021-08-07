part of 'broker_bloc.dart';

@immutable
class BrokerState extends Equatable {
  final int selectedCategoryId;
  BrokerState({required this.selectedCategoryId});

  @override
  // TODO: implement props
  List<Object?> get props => [selectedCategoryId];
}

class BrokerInitial extends BrokerState {
  BrokerInitial() : super(selectedCategoryId: 0);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BrokersLoading extends BrokerState {
  BrokersLoading() : super(selectedCategoryId: 0);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BrokersLoadSuccess extends BrokerState {
  final List<Broker> brokers;
  final int selectedCategoryId;

  BrokersLoadSuccess({required this.selectedCategoryId, required this.brokers})
      : super(selectedCategoryId: 0);

  @override
  // TODO: implement props
  List<Object?> get props => [brokers, selectedCategoryId];
}

class BrokersLoadFailed extends BrokerState {
  BrokersLoadFailed() : super(selectedCategoryId: 0);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
