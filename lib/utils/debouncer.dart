import 'dart:async';

import 'package:flutter/widgets.dart';

class Debouncer<T> {
  final Duration duration;
  final ValueSetter<T> callback;

  Timer _timer;

  Debouncer(this.duration, this.callback);

  void call(T t) {
    _timer?.cancel();

    _timer = Timer(
      duration,
      () => callback(t),
    );
  }

  void dispose() {
    _timer?.cancel();
  }
}
