class StopwatchModel {
  final _stopwatch = Stopwatch();

  void start() {
    _stopwatch.start();
  }

  void stop() {
    _stopwatch.stop();
  }

  void reset() {
    _stopwatch.reset();
  }

  String getTime() => _formatText(_stopwatch.elapsed);

  String _formatText(Duration elapsed) {
    final inSecond = elapsed.inSeconds;
    return '${(inSecond ~/ 3600) % 24}:${(inSecond ~/ 60) % 60}:${inSecond % 60}';
  }

  void close() {
    _stopwatch.stop();
    print('Close stopwatch model');
  }
}
