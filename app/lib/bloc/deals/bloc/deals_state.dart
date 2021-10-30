part of 'deals_bloc.dart';

 class DealsState  {
   final Deals? deals;
  DealsState({required this.deals});
}

// class DealsInitial extends DealsState {}



class DealsInitial extends DealsState {
  final Deals? deals;

  DealsInitial({required this.deals}) : super(deals: deals);
}

class DealsStateUpdated extends DealsState {
  final Deals deals;

  DealsStateUpdated({required this.deals}) : super(deals: deals);
}

class DealsCreating extends DealsState {
  final Deals deals;

  DealsCreating({required this.deals}) : super(deals: deals);
}

class DealsCreateFailed extends DealsState {
  final Deals deals;
  DealsCreateFailed({required this.deals}) : super(deals: deals);
}

class DealsCreateSuccess extends DealsState {
  final Deals deals;
  DealsCreateSuccess({required this.deals}) : super(deals: deals);
}
