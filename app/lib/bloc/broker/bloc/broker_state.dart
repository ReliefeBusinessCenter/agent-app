part of 'broker_bloc.dart';

@immutable
class BrokerState extends Equatable {
  final int selectedCategoryId;
  final List<Broker> brokers;
  BrokerState({required this.selectedCategoryId, required this.brokers});

  @override
  // TODO: implement props
  List<Object?> get props => [selectedCategoryId];
}

class BrokerInitial extends BrokerState {
  BrokerInitial() : super(selectedCategoryId: 0, brokers: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BrokersLoading extends BrokerState {
  BrokersLoading() : super(selectedCategoryId: 0, brokers: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BrokersLoadSuccess extends BrokerState {
  final List<Broker> brokers;
  final int selectedCategoryId;

  BrokersLoadSuccess({required this.selectedCategoryId, required this.brokers})
      : super(selectedCategoryId: selectedCategoryId, brokers: brokers);

  @override
  // TODO: implement props
  List<Object?> get props => [brokers, selectedCategoryId];
}

class BrokersLoadFailed extends BrokerState {
  final String message;

  BrokersLoadFailed({required this.message})
      : super(selectedCategoryId: 0, brokers: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
