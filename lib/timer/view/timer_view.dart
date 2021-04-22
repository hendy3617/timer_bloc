import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/shared_widget/circle_widget.dart';
import 'package:timer_bloc/timer/bloc/timer_bloc.dart';
import 'package:timer_bloc/timer/model/timer_model.dart';
import 'package:timer_bloc/timer/view/add_timer_page.dart';
import 'package:timer_bloc/util.dart';

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
                  .map((timer) => _itemBuilder(context, timer))
                  .toList(),
            );
          },
        ),
        const Align(alignment: Alignment(0.95, 0.95), child: AddButton()),
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, TimerModel model) {
    final bloc = context.read<TimerBloc>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Dismissible(
            key: Key('__${model.id}__'),
            direction: DismissDirection.horizontal,
            onDismissed: (_) {
              _onDismissed(context, model);
            },
            child: GestureDetector(
              child: CircleWidget(
                constraints: constraints,
                borderColor:
                    (model.isPlaying || !bloc.isPlaying) ? null : Colors.grey,
                child: Text(model.getFormattedTime),
              ),
              onTap: () {
                final bloc = context.read<TimerBloc>();
                if (model.isPlaying) {
                  bloc.add(TimerStop(id: model.id));
                } else {
                  if (!bloc.state.isPlaying) {
                    bloc.add(TimerPlay(id: model.id));
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }

  void _onDismissed(BuildContext context, TimerModel model) {
    final bloc = context.read<TimerBloc>();
    bloc.add(TimerDelete(id: model.id));
    showSnackbar(
      context,
      Text('${model.duration} removed'),
      SnackBarAction(
        label: 'Undo',
        onPressed: () {
          bloc.add(TimerAdd(model: model));
        },
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      child: const Icon(Icons.add, color: Colors.white, size: 32),
      onPressed: () async {
        final result = await _gotoAddTimerPage(context);
        if (result != null) {
          final bloc = context.read<TimerBloc>();
          final model =
              TimerModel(bloc: bloc, duration: result, isPlaying: false);
          bloc.add(TimerAdd(model: model));
        }
      },
    );
  }

  Future<Duration?> _gotoAddTimerPage(BuildContext context) async {
    final result = await Navigator.of(context).push<Duration>(
      MaterialPageRoute<Duration>(
        builder: (context) => const AddTimerPage(),
      ),
    );
    return result;
  }
}
