part of 'work_bloc.dart';

class WorkState extends Equatable {
  List<Work> work_history;

  WorkState({required this.work_history});

  @override
  List<Object> get props => [work_history];
}

class WorkInitial extends WorkState {
  WorkInitial() : super(work_history: []);
}
