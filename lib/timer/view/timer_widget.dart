import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:timer_bloc/shared_widget/circle_widget.dart';
import 'package:timer_bloc/timer/bloc/timer_bloc.dart';
import 'package:timer_bloc/timer/model/timer_model.dart';
import 'package:timer_bloc/util.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    Key? key,
    required this.model,
    required this.constraints,
    required this.onTap,
    required this.highlighted,
    required this.dismissible,
  }) : super(key: key);

  final TimerModel model;
  final BoxConstraints constraints;
  final VoidCallback onTap;
  final bool highlighted;
  final bool dismissible;

  @override
  Widget build(BuildContext context) {
    if (!dismissible) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: _widget(),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Dismissible(
        key: Key('__${model.id}__'),
        direction: DismissDirection.horizontal,
        onDismissed: (_) {
          _onDismissed(context, model);
        },
        child: _widget(),
      ),
    );
  }

  Widget _widget() {
    return GestureDetector(
      child: CircleWidget(
        constraints: constraints,
        borderColor: highlighted ? null : Colors.grey,
        child: Text(model.getFormattedTime),
      ),
      onTap: onTap,
    );
  }

  void _onDismissed(BuildContext context, TimerModel model) {
    final TimerBloc bloc = context.read<TimerBloc>();
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
