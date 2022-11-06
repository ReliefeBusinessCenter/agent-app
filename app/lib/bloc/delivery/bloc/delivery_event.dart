part of 'delivery_bloc.dart';

abstract class DeliveryEvent {
  const DeliveryEvent();
}
class DeliveryInitializationEvent extends DeliveryEvent{

}
class DeliveryCreateEvent extends DeliveryEvent {}

class SelectBrokerEvent extends DeliveryEvent {
  final Broker broker;
  SelectBrokerEvent({required this.broker});
}
