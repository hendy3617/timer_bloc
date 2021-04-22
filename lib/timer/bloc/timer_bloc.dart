import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timer_bloc/timer/model/timer_model.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {}

  final _currentTimers = <TimerModel>[];
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is TimerAdd) {
      print('Event add');
      _addTimer(event.model);
    } else if (event is TimerDelete) {
      print('Event delete');
      _deleteById(event.id);
    } else if (event is TimerPlay) {
      _startById(event.id);
      print('Event play');
    } else if (event is TimerStop) {
      _stopById(event.id);
      print('Event stop');
    } else if (event is TimerUpdate) {
      _updateTimer(event.model);
    } else if (event is TimerUpdateElapsed) {
      // Do nothing, it update itself internally we only propagate their new state
    } else {
      print('Uncaught event: ${event.runtimeType}');
      return;
    }

    yield TimerNewState(_currentTimers, _isPlaying);
  }

  void _startById(int id) {
    _isPlaying = true;
    _findById(id).startTimer();
  }

  void _stopById(int id) {
    _isPlaying = false;
    _findById(id).stopTimer();
  }

  void _deleteById(int id) {
    final candidate = _findById(id);
    candidate.close();
    _currentTimers.remove(candidate);
    if (_isPlaying) _isPlaying = false;
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
