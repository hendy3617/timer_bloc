import 'package:flutter/material.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Timer'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('1 Minute'),
              onPressed: () {
                _returnTime(context, const Duration(minutes: 1));
              },
            ),
            ElevatedButton(
              child: const Text('2 Minute'),
              onPressed: () {
                _returnTime(context, const Duration(minutes: 2));
              },
            ),
            ElevatedButton(
              child: const Text('3 Minute'),
              onPressed: () {
                _returnTime(context, const Duration(minutes: 3));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _returnTime(BuildContext context, Duration duration) {
    Navigator.pop(context, duration);
  }
}
