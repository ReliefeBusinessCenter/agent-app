part of 'workdeals_bloc.dart';

// import 'package:app/model/deals.dart';

class DealsState {
  final List<Deals> deals_history;

  DealsState({required this.deals_history});
 
}

class DealsInitial extends DealsState {
  final List<Deals> work_history;

  DealsInitial({required this.work_history}) : super(deals_history: []);
  @override
  List<Object> get props => [work_history];
}

class DealsLoading extends DealsState {
  DealsLoading() : super(deals_history: []);
}


class FetchDealsSuccess extends DealsState {
  final List<Deals> deals_history;

  FetchDealsSuccess({required this.deals_history})
      : super(deals_history: deals_history);
  @override
  List<Object> get props => [deals_history];
}

class DeleteDealsSuccessState extends DealsState {
  final List<Deals> deals_history;

  DeleteDealsSuccessState({required this.deals_history})
      : super(deals_history: deals_history);
  @override
  List<Object> get props => [deals_history];
}
class DeletingDealsState extends DealsState{
  final List<Deals> deals_history;
  DeletingDealsState({required this.deals_history}) : super(deals_history:deals_history );

}

class DeleteDealsFailedState extends DealsState {
  final String message;
  final List<Deals> deals_history; 

  DeleteDealsFailedState({required this.deals_history, required this.message})
      : super(deals_history: deals_history);
  @override
  List<Object> get props => [deals_history];
}
class UpdatingDealsState extends DealsState{
  final List<Deals> deals_history;
  UpdatingDealsState({required this.deals_history}) : super(deals_history:deals_history );

}
class UpdateDealsFailedState extends DealsState {
  final String message;
  final List<Deals> deals_history;

  UpdateDealsFailedState({required this.deals_history, required this.message})
      : super(deals_history: deals_history);
  @override
  List<Object> get props => [deals_history];
}

class UpdateDealsSuccessState extends DealsState {
  final String message;
  final List<Deals> deals_history;

  UpdateDealsSuccessState({required this.deals_history, required this.message})
      : super(deals_history: deals_history);
  @override
  List<Object> get props => [deals_history];
}

