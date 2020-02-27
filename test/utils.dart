import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/status.dart';
import 'package:movies/viewmodels/config.dart';

class TestWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class A extends ChangeNotifier implements ConfigViewModel {
  @override
  // TODO: implement config
  Config get config => null;

  @override
  String full(String path) {
    // TODO: implement full
    return null;
  }

  @override
  String posterUrl(String path, int minWidth) {
    // TODO: implement posterUrl
    return null;
  }

  @override
  String profileUrl(String path, int minWidth) {
    // TODO: implement profileUrl
    return null;
  }

  @override
  // TODO: implement status
  Status get status => null;

  @override
  String thumbnail(String path) {
    // TODO: implement thumbnail
    return null;
  }
}
