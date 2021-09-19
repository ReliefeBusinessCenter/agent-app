part of 'work_bloc.dart';

class WorkState {
  final List<Delivery> delivery_history;

  WorkState({required this.delivery_history});
  @override
  List<Object> get props => [];
}

class WorkInitial extends WorkState {
  final List<Work> work_history;

  WorkInitial({required this.work_history}) : super(delivery_history: []);
  @override
  List<Object> get props => [work_history];
}
class AddWorkLoading extends WorkState{
  AddWorkLoading() : super(delivery_history: []);

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
