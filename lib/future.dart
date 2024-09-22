extension FutureExtension on Future {
  Future<T> time<T>(String debugLabel) {
    final Stopwatch stopwatch = Stopwatch()..start();
    return then((value) {
      stopwatch.stop();
      return value;
    });
  }

  Future<T> minDuration<T>(Future<T> future, {Duration duration = const Duration(seconds: 2)}) async {
    try {
      final List futures = await Future.wait([
        future,
        Future.delayed(duration),
      ]);
      return futures.first;
    } catch (e) {
      rethrow;
    }
  }
}
