part of 'work_bloc.dart';

abstract class WorkEvent extends Equatable {
  const WorkEvent();

  @override
  List<Object> get props => [];
}

class WorkInitialFetch extends WorkEvent {}

class FetchWork extends WorkEvent {
  
 
}

class DeleteWork extends WorkEvent {
  final Delivery work;
  DeleteWork({required this.work});
}

class MarkAsDoneWork extends WorkEvent {
  final Delivery work;
  MarkAsDoneWork({required this.work});
}
