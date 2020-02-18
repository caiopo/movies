import 'package:flutter/cupertino.dart';

abstract class NestedChangeNotifier extends ChangeNotifier {
  final List<ChangeNotifier> _children = [];

  void addChildren(List<ChangeNotifier> children) {
    for (final c in children) {
      c.addListener(() => notifyListeners());
    }

    _children.addAll(children);
  }

  @override
  void dispose() {
    for (final c in _children) {
      c.dispose();
    }
    super.dispose();
  }
}
