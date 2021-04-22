import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/stopwatch/cubit/stopwatch_cubit.dart';
import 'package:timer_bloc/stopwatch/view/stopwatch_view.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StopwatchCubit(),
      child: const StopwatchBody(),
    );
  }
}
