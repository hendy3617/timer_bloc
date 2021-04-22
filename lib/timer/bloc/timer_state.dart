part of 'timer_bloc.dart';

@immutable
abstract class TimerState {
  const TimerState(this.timers, this.isPlaying);

  final bool isPlaying;
  final List<TimerModel> timers;
}

class TimerInitial extends TimerState {
  TimerInitial({List<TimerModel>? models}) : super(models ?? [], false);
}

class TimerNewState extends TimerState {
  const TimerNewState(List<TimerModel> timers)
      : super(timers, false);
}

class TimerStateTicking extends TimerState {
  const TimerStateTicking(List<TimerModel> models, this.tickModel) : super(models, true);

  final TimerModel tickModel;
}
