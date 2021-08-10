part of 'work_bloc.dart';

class WorkState {
  final List<Work> work_history;

  WorkState({required this.work_history});
  @override
  List<Object> get props => [];
}

class WorkInitial extends WorkState {
  final List<Work> work_history;

  WorkInitial({required this.work_history}) : super(work_history: []);
  @override
  List<Object> get props => [work_history];
}

class AdddWorkSuccess extends WorkState {
  final List<Work> work_history;

  AdddWorkSuccess({required this.work_history})
      : super(work_history: work_history);
  @override
  List<Object> get props => [work_history];
}

class FetchWorkSuccess extends WorkState {
  final List<Work> work_history;

  FetchWorkSuccess({required this.work_history})
      : super(work_history: work_history);
  @override
  List<Object> get props => [work_history];
}

class DeleteSuccessState extends WorkState {
  final List<Work> work_history;

  DeleteSuccessState({required this.work_history})
      : super(work_history: work_history);
  @override
  List<Object> get props => [work_history];
}
