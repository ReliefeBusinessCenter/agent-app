part of 'broker_bloc.dart';

@immutable
class BrokerState extends Equatable {
  final bool isName;
  final int selectedCategoryId;
  final List<Broker> brokers;
  BrokerState(
      {required this.selectedCategoryId,
      required this.brokers,
      required this.isName});

  @override
  // TODO: implement props
  List<Object?> get props => [selectedCategoryId];
}

class BrokerInitial extends BrokerState {
  BrokerInitial() : super(isName: true, selectedCategoryId: 0, brokers: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BrokersLoading extends BrokerState {
  final bool isName;
  BrokersLoading({required this.isName})
      : super(isName: true, selectedCategoryId: 0, brokers: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BrokersLoadSuccess extends BrokerState {
  final List<Broker> brokers;
  final int selectedCategoryId;
  final bool isName;

  BrokersLoadSuccess(
      {required this.isName,
      required this.selectedCategoryId,
      required this.brokers})
      : super(
            isName: isName,
            selectedCategoryId: selectedCategoryId,
            brokers: brokers);

  @override
  // TODO: implement props
  List<Object?> get props => [brokers, selectedCategoryId];
}

class BrokersLoadFailed extends BrokerState {
  final String message;

  BrokersLoadFailed({required this.message})
      : super(isName: true, selectedCategoryId: 0, brokers: []);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchModeChanged extends BrokerState {
  final bool isName;
  final int selectedCategoryId;
  final List<Broker> brokers;
  SearchModeChanged(
      {required this.isName,
      required this.selectedCategoryId,
      required this.brokers})
      : super(
            isName: isName,
            selectedCategoryId: selectedCategoryId,
            brokers: []);
}

