import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/stopwatch/stopwatch.dart';
import 'package:timer_bloc/timer/timer.dart';

import 'cubit/landpage_cubit.dart';

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pink),
      home: BlocProvider<LandpageCubit>(
        create: (context) => LandpageCubit(),
        child: Landpage(),
      ),
    );
  }
}

class Landpage extends StatelessWidget {
  Landpage({Key? key}) : super(key: key);

  final items = [
    const BottomNavigationBarItem(
      label: 'Stopwatch',
      icon: Icon(Icons.lock_clock),
    ),
    const BottomNavigationBarItem(
      label: 'Timer',
      icon: Icon(Icons.timelapse),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandpageCubit, LandpageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state.currentPage == PageList.stopwatch
                ? const Text('Stopwatch')
                : const Text('Timer'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 8.0,
            items: items,
            currentIndex: state.currentPage.index,
            onTap: (value) {
              final bloc = context.read<LandpageCubit>();
              if (value == 0) {
                bloc.gotoStopwatchPage();
              } else {
                bloc.gotoTimerPage();
              }
            },
          ),
          body: state.currentPage == PageList.stopwatch
              ? const StopwatchPage()
              : const TimerPage(),
        );
      },
    );
  }
}
