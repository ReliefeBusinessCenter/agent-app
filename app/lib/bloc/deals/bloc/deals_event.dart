part of 'deals_bloc.dart';

abstract class DealsEvent {
  const DealsEvent();
}
class DealsInitializationEvent extends DealsEvent 
{

}

class DealsCreateEvent extends DealsEvent {
  final Deals deals;
  DealsCreateEvent({required this.deals});
}
