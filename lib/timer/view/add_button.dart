import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/timer/bloc/timer_bloc.dart';
import 'package:timer_bloc/timer/model/timer_model.dart';

import 'package:timer_bloc/timer/view/add_timer_page.dart';

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
