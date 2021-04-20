import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/timer/bloc/timer_bloc.dart';
import 'package:timer_bloc/timer/view/timer_view.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return TimerBody();
      },
    );
  }
}
