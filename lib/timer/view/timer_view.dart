import 'package:flutter/material.dart';
import 'package:timer_bloc/shared_widget/circle_widget.dart';

class TimerBody extends StatelessWidget {
  const TimerBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map(
        (e) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CircleWidget(
                  child: Text(e.toString()),
                  constraints: constraints,
                  deltaBetweenCircle: 0,
                );
              },
            ),
          );
        },
      ).toList(),
    );
  }
}
