import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    this.borderWidth = 3.0,
    required this.child,
    required this.constraints,
    this.borderColor,
  }) : super(key: key);

  final BoxConstraints constraints;
  final double borderWidth;
  final Widget child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxWidth * 0.8,
      width: constraints.maxWidth * 0.8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 3.0,
          color: borderColor ?? Theme.of(context).primaryColor,
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
