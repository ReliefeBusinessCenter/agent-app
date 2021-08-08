import 'dart:async';

import 'package:app/model/work.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'work_event.dart';
part 'work_state.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  WorkBloc() : super(WorkInitial());

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
      yield (WorkState(work_history: works));
    } else if (event is DeleteWork) {
      //  Delete event
      List<Work> works = state.work_history;
      if (works.contains(event.work)) {
        works.remove(event.work);
      }
      yield (WorkState(work_history: works));
    } else {
      // Initial
      yield (WorkState(work_history: []));
    }
  }
}
