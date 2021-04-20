part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  const CounterState(this.count);
  final int count;
}

class CounterInitial extends CounterState {
  const CounterInitial(int count) : super(count);
}
