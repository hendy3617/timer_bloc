import 'package:flutter/material.dart';
import 'package:timer_bloc/shared_widget/circle_widget.dart';

class StopwatchBody extends StatelessWidget {
  const StopwatchBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.5),
              child: CircleWidget(
                constraints: constraints,
                child: Text(
                  '00:00:00',
                  style: textTheme.headline3,
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
      child: const Icon(Icons.play_arrow, color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {},
    );
  }
}
