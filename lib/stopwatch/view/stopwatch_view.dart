import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/shared_widget/circle_widget.dart';
import 'package:timer_bloc/stopwatch/cubit/stopwatch_cubit.dart';

class StopwatchBody extends StatelessWidget {
  const StopwatchBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.5),
              child: CircleWidget(
                constraints: constraints,
                child: BlocBuilder<StopwatchCubit, StopwatchState>(
                  builder: (context, state) {
                    return Text(
                      state.elapsed,
                      style: textTheme.headline3,
                    );
                  },
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.95),
              child: ActionButton(),
            ),
          ],
        );
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: BlocBuilder<StopwatchCubit, StopwatchState>(
        builder: (context, state) {
          if (state.started) {
            return const Icon(Icons.stop, color: Colors.white);
          } else {
            return const Icon(Icons.play_arrow, color: Colors.white);
          }
        },
      ),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        context.read<StopwatchCubit>().toggleStopwatch();
      },
    );
  }
}
