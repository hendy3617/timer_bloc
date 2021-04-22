part of 'stopwatch_cubit.dart';

@immutable
abstract class StopwatchState {
  const StopwatchState(
    this.started,
    this.elapsed,
  );

  final bool started;
  final String elapsed;
}

class StopwatchInitial extends StopwatchState {
  const StopwatchInitial(bool started, String elapsed)
      : super(started, elapsed);
}

class StopwatchNewState extends StopwatchState {
  const StopwatchNewState(bool started, String elapsed) : super(started, elapsed);
}
