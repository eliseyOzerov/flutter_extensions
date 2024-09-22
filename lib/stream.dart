import 'dart:async';

extension StreamExtension on Stream {
  Future<T?> waitForEvent<T>(Function(T) responseHandler, {Duration? timeout = const Duration(seconds: 5)}) {
    late final StreamSubscription subscription;
    final Completer<T?> completer = Completer();
    subscription = listen((event) {
      if (event.runtimeType == T) {
        final result = responseHandler(event);
        completer.complete(result);
      }
      subscription.cancel();
    });
    if (timeout != null) {
      return completer.future.timeout(
        timeout,
        onTimeout: () {
          subscription.cancel();
          return Future.error(TimeoutException('No response received for ${T.toString} in ${timeout.inSeconds} seconds'));
        },
      );
    } else {
      return completer.future;
    }
  }

  Future<T?> firstEvent<T>(Function(T) responseHandler, {Duration? timeout = const Duration(seconds: 5)}) {
    if (timeout != null) {
      return firstWhere((element) => element is T).timeout(
        timeout,
        onTimeout: () {
          return Future<T>.error("Timeout waiting for event of type $T");
        },
      ).then((e) => responseHandler(e));
    } else {
      return firstWhere((element) => element is T).then((e) => responseHandler(e));
    }
  }

  StreamSubscription<T> listenTo<T>(Function(T) eventHandler) {
    return where((e) => e is T).map((e) => e as T).listen(eventHandler);
  }
}

extension StreamExtension2<T> on Stream<T> {
  Future<T> nextEvent() {
    final Completer<T> completer = Completer<T>();
    StreamSubscription<T>? subscription;

    subscription = listen(
      (event) {
        completer.complete(event);
        subscription?.cancel();
      },
      onError: (error) {
        completer.completeError(error);
        subscription?.cancel();
      },
      onDone: () {
        if (!completer.isCompleted) {
          completer.completeError(StateError("Stream was done without emitting any events."));
        }
      },
      cancelOnError: true,
    );

    return completer.future;
  }
}
