import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timer_bloc/stopwatch/model/model.dart';

part 'stopwatch_state.dart';

class StopwatchCubit extends Cubit<StopwatchState> {
  StopwatchCubit() : super(const StopwatchInitial(false, '00:00:00'));

  final _stopwatch = StopwatchModel();
  Timer? _checker;

  void toggleStopwatch() {
    if (!state.started) {
      _startStopwatch();
    } else {
      _stopStopwatch();
    }
  }

  @override
  Future<void> close() async {
    print('Closing stopwatch cubit');
    _stopwatch.close();
    _checker?.cancel();
    super.close();
  }

  void _startStopwatch() {
    emit(StopwatchNewState(true, _stopwatch.getTime()));
    _stopwatch.start();
    _checker = Timer.periodic(const Duration(milliseconds: 250), _emitter);
  }

  void _stopStopwatch() {
    _checker?.cancel();
    _stopwatch.stop();
    _stopwatch.reset();
    emit(StopwatchNewState(false, _stopwatch.getTime()));
  }

  void _emitter(Timer timer) {
    if (_stopwatch.getTime() != state.elapsed) {
      emit(StopwatchNewState(true, _stopwatch.getTime()));
    }
  }
}
