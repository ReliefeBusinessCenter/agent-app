import 'dart:async';

import 'package:app/model/work.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'work_event.dart';
part 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  WorkBloc() : super(WorkInitial(work_history: []));

  @override
  Stream<WorkState> mapEventToState(
    WorkEvent event,
  ) async* {
    if (event is AddWork) {
      //  add event
      List<Work> works = state.work_history;
      if (!works.contains(event.work)) {
        works.add(event.work);
      }
      yield (AdddWorkSuccess(work_history: works));
    } else if (event is DeleteWork) {
      //  Delete event
      List<Work> works = state.work_history;
      if (works.contains(event.work)) {
        works.remove(event.work);
      }
      yield (DeleteSuccessState(work_history: works));
    } else {
      // Initial
      List<Work> works = state.work_history;
      yield WorkInitial(work_history: works);
    }
  }
}
