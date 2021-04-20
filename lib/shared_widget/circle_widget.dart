import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    required this.child,
    required this.constraints,
    this.deltaBetweenCircle = 0.05,
  }) : super(key: key);

  final BoxConstraints constraints;
  final Widget child;
  final double deltaBetweenCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth * 0.8,
      height: constraints.maxWidth * 0.8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      alignment: Alignment.center,
      child: Container(
        width: constraints.maxWidth * (0.8 - deltaBetweenCircle),
        height: constraints.maxWidth * (0.8 - deltaBetweenCircle),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
