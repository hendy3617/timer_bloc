import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timer_bloc/timer/model/timer_model.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {}

  final _currentTimers = <TimerModel>[];
  TimerModel? _modelTicking;

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is TimerAdd) {
      print('Event add');
      _addTimer(event.model);
      yield TimerNewState(_currentTimers);
    }
    if (event is TimerDelete) {
      print('Event delete');
      _deleteById(event.id);
      yield TimerNewState(_currentTimers);
    }

    if (event is TimerPlay) {
      print('Event play');
      _startById(event.id);
      yield TimerStateTicking(_currentTimers, _modelTicking!);
    }

    if (event is TimerStop) {
      print('Event stop');
      _stopById(event.id);
      yield TimerNewState(_currentTimers);
    }

    if (event is TimerUpdate) {
      _updateTimer(event.model);
      yield TimerNewState(_currentTimers);
    }

    if (event is TimerUpdateElapsed) {
      yield TimerStateTicking(_currentTimers, _modelTicking!);
    }
  }

  void _startById(int id) {
    final model = _findById(id);
    model.startTimer();
    _modelTicking = model;
  }

  void _stopById(int id) {
    _findById(id).stopTimer();
    _modelTicking = null;
  }

  void _deleteById(int id) {
    final candidate = _findById(id);
    candidate.close();
    _currentTimers.remove(candidate);
  }

  void _addTimer(TimerModel model) {
    final exists = _currentTimers.any((element) => element.id == model.id);
    if (exists) return;
    _currentTimers.add(model);
  }

  void _updateTimer(TimerModel model) {
    final candidate = _findById(model.id);
    final index = _currentTimers.indexOf(candidate);
    _deleteById(model.id);
    _currentTimers.insert(index, model);
  }

  TimerModel _findById(int id) {
    return _currentTimers.firstWhere((element) => element.id == id);
  }
}
