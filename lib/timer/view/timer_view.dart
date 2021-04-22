import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/timer/bloc/timer_bloc.dart';
import 'package:timer_bloc/timer/model/timer_model.dart';
import 'package:timer_bloc/timer/view/add_button.dart';
import 'package:timer_bloc/timer/view/timer_widget.dart';

class TimerBody extends StatelessWidget {
  const TimerBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            if (state.timers.isEmpty) {
              return Center(
                child: Text(
                  'Timer is empty',
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            }
            return GridView.count(
              crossAxisCount: 2,
              children: state.timers
                  .map((timer) => _itemBuilder(timer))
                  .toList(),
            );
          },
        ),
        const Align(alignment: Alignment(0.95, 0.95), child: AddButton()),
      ],
    );
  }

  Widget _itemBuilder(TimerModel model) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _mapStateToWidget(context, model, constraints);
      },
    );
  }

  Widget _mapStateToWidget(
      BuildContext context, TimerModel model, BoxConstraints constraints) {
    final state = context.read<TimerBloc>().state;
    if (state is TimerInitial) {
      return TimerWidget(
        model: model,
        constraints: constraints,
        onTap: () {
          final bloc = context.read<TimerBloc>();
          bloc.add(TimerPlay(id: model.id));
        },
        dismissible: true,
        highlighted: true,
      );
    }

    if (state is TimerNewState) {
      return TimerWidget(
        model: model,
        constraints: constraints,
        highlighted: true,
        dismissible: true,
        onTap: () {
          final bloc = context.read<TimerBloc>();
          bloc.add(TimerPlay(id: model.id));
        },
      );
    }
    if (state is TimerStateTicking) {
      return TimerWidget(
        model: model,
        constraints: constraints,
        highlighted: state.tickModel.id == model.id,
        dismissible: false,
        onTap: () {
          if (state.tickModel.id == model.id) {
            final bloc = context.read<TimerBloc>();
            bloc.add(TimerStop(id: model.id));
          }
        },
      );
    }

    throw Exception('Unknown state: ${state.runtimeType}');
  }
}
