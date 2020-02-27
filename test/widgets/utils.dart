import 'package:flutter/material.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:provider/provider.dart';

import '../mocks.dart';

class TestWrap extends StatelessWidget {
  final Widget child;

  const TestWrap({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<ConfigViewModel>(
      create: (_) => ConfigViewModelMock(),
      child: MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    );
  }
}
