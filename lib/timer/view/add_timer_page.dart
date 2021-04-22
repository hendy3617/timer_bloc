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
              child: const Text('10 Seconds'),
              onPressed: () {
                _returnTime(context, const Duration(seconds: 10));
              },
            ),
            ElevatedButton(
              child: const Text('20 Seconds'),
              onPressed: () {
                _returnTime(context, const Duration(seconds: 20));
              },
            ),
            ElevatedButton(
              child: const Text('30 Seconds'),
              onPressed: () {
                _returnTime(context, const Duration(seconds: 30));
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
