import 'package:bloc/bloc.dart';
import 'package:timer_bloc/stopwatch/cubit/stopwatch_cubit.dart';

class MyBlocObserver extends BlocObserver {
  MyBlocObserver() {
    print('Observer instantiated');
  }
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // TODO: implement onEvent
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    // TODO: implement onError
    super.onError(bloc, error, stacktrace);
    print('Error occured: $error, $stacktrace');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (change.nextState is StopwatchNewState) {
      print(
          'Transition from ${change.currentState.elapsed} to ${change.nextState.elapsed}');
      return;
    }
    print('State change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // TODO: implement onChange
  }
}
