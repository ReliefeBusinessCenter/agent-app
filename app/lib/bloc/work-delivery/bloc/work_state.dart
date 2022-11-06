part of 'work_bloc.dart';

class WorkState {
  final List<Delivery> delivery_history;

  WorkState({required this.delivery_history});
  @override
  List<Object> get props => [];
}

class WorkInitial extends WorkState {
  final List<Delivery> work_history;

  WorkInitial({required this.work_history}) : super(delivery_history: []);
  @override
  List<Object> get props => [work_history];
}

class WorkLoading extends WorkState {
  WorkLoading() : super(delivery_history: []);
}

class AdddWorkSuccess extends WorkState {
  final List<Delivery> delivery_history;

  AdddWorkSuccess({required this.delivery_history})
      : super(delivery_history: delivery_history);
  @override
  List<Object> get props => [delivery_history];
}

class FetchWorkSuccess extends WorkState {
  final List<Delivery> delivery_history;

  FetchWorkSuccess({required this.delivery_history})
      : super(delivery_history: delivery_history);
  @override
  List<Object> get props => [delivery_history];
}

class DeleteSuccessState extends WorkState {
  final List<Delivery> delivery_history;

  DeleteSuccessState({required this.delivery_history})
      : super(delivery_history: delivery_history);
  @override
  List<Object> get props => [delivery_history];
}
class DeletingState extends WorkState{
  final List<Delivery> delivery_history;
  DeletingState({required this.delivery_history}) : super(delivery_history:delivery_history );

}

class DeleteFailedState extends WorkState {
  final String message;
  final List<Delivery> delivery_history;

  DeleteFailedState({required this.delivery_history, required this.message})
      : super(delivery_history: delivery_history);
  @override
  List<Object> get props => [delivery_history];
}
class UpdatingState extends WorkState{
  final List<Delivery> delivery_history;
  UpdatingState({required this.delivery_history}) : super(delivery_history:delivery_history );

}
class UpdateFailedState extends WorkState {
  final String message;
  final List<Delivery> delivery_history;

  UpdateFailedState({required this.delivery_history, required this.message})
      : super(delivery_history: delivery_history);
  @override
  List<Object> get props => [delivery_history];
}

class UpdateSuccessState extends WorkState {
  final String message;
  final List<Delivery> delivery_history;

  UpdateSuccessState({required this.delivery_history, required this.message})
      : super(delivery_history: delivery_history);
  @override
  List<Object> get props => [delivery_history];
}

