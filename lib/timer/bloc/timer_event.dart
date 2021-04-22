part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent {}

class TimerAdd extends TimerEvent {
  TimerAdd({required this.model});

  final TimerModel model;
}

class TimerDelete extends TimerEvent {
  TimerDelete({required this.id});

  final int id;
}

class TimerPlay extends TimerEvent {
  TimerPlay({required this.id});

  final int id;
}

class TimerStop extends TimerEvent {
  TimerStop({required this.id});

  final int id;
}

class TimerUpdate extends TimerEvent {
  TimerUpdate({required this.model});

  final TimerModel model;
}

class TimerUpdateElapsed extends TimerEvent {
  TimerUpdateElapsed();
}
