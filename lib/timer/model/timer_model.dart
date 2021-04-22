import 'dart:async';

import 'package:timer_bloc/timer/bloc/timer_bloc.dart';

class TimerModel {
  TimerModel({
    required this.bloc,
    required this.duration,
    bool? isPlaying,
    int? id,
  })  : this.id = id ?? _latestId,
        _isPlaying = isPlaying ?? false {
    if (id == null) _latestId += 1;
  }

  // Auto increment id
  static int _latestId = 0;

  final Duration duration;
  final int id;

  /// For telling bloc to update the new model
  final TimerBloc bloc;

  Timer? _caller;

  final _stopwatch = Stopwatch();

  bool _isPlaying;
  bool get isPlaying => _isPlaying;

  String get getFormattedTime => _formattedTime();

  void startTimer() {
    _stopwatch.start();
    _isPlaying = true;
    _caller = Timer.periodic(const Duration(seconds: 1), _snitcher);
  }

  void stopTimer() {
    _stopwatch.stop();
    _stopwatch.reset();
    _caller?.cancel();
    _isPlaying = false;
    bloc.add(TimerUpdate(model: this));
  }

  // Close this model before being discarded
  void close() {
    _caller?.cancel();
    _stopwatch.stop();
  }

  TimerModel copyWith(
      {TimerBloc? bloc, Duration? duration, int? id, bool? isPlaying}) {
    return TimerModel(
      bloc: bloc ?? this.bloc,
      duration: duration ?? this.duration,
      id: id ?? this.id,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  String _formattedTime() {
    final left = timeLeft().inSeconds;

    return '${(left ~/ 3600) % 24}:${(left ~/ 60) % 60}:${left % 60}';
  }

  Duration timeLeft() {
    return duration - _stopwatch.elapsed;
  }

  void _snitcher(Timer timer) {
    bloc.add(TimerUpdateElapsed());
  }
}
