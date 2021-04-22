part of 'timer_bloc.dart';

@immutable
abstract class TimerState {
  const TimerState(this.timers, this.isPlaying);

  final bool isPlaying;
  final List<TimerModel> timers;
}

class TimerInitial extends TimerState {
  TimerInitial() : super([], false);
}

class TimerNewState extends TimerState {
  const TimerNewState(List<TimerModel> timers, bool isPlaying)
      : super(timers, isPlaying);
}
