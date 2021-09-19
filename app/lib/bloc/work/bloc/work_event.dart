part of 'work_bloc.dart';

abstract class WorkEvent extends Equatable {
  const WorkEvent();

  @override
  List<Object> get props => [];
}

class WorkInitialFetch extends WorkEvent {}

class AddWork extends WorkEvent {
  final Work work;
  AddWork({required this.work});
}

class DeleteWork extends WorkEvent {
  final Delivery work;
  DeleteWork({required this.work});
}
