part of 'delivery_bloc.dart';

class DeliveryState {
  final Delivery? delivery;
  DeliveryState({required this.delivery});
}

class DeliveryInitial extends DeliveryState {
  final Delivery? delivery;

  DeliveryInitial({required this.delivery}) : super(delivery: delivery);
}

class DeliveryStateUpdated extends DeliveryState {
  final Delivery delivery;

  DeliveryStateUpdated({required this.delivery}) : super(delivery: delivery);
}

class DeliveryCreating extends DeliveryState {
  final Delivery delivery;

  DeliveryCreating({required this.delivery}) : super(delivery: delivery);
}

class DeliveryCreateFailed extends DeliveryState {
  final Delivery delivery;
  DeliveryCreateFailed({required this.delivery}) : super(delivery: delivery);
}

class DeliveryCreateSuccess extends DeliveryState {
  final Delivery delivery;
  DeliveryCreateSuccess({required this.delivery}) : super(delivery: delivery);
}
