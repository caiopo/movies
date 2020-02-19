import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api/config_service.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/status.dart';

@singleton
class ConfigViewModel extends ChangeNotifier {
  Status _status = Status.loading;
  Config _config;
  ConfigService _service;

  Config get config => _config;

  Status get status => _status;

  ConfigViewModel(this._service) {
    _load();
  }

  void _load() async {
    try {
      _config = await _service.getConfig();
      _status = Status.success;
    } on DioError catch (e) {
      _status = Status.error;
    } finally {
      notifyListeners();
    }
  }

  String posterUrl(String path, int minWidth) {
    String width = _findWidth(minWidth, _config.images.posterSizes);
    return '${_config.images.imageBaseUrl}$width$path';
  }

  String thumbnail(String path) {
    return posterUrl(path, 150);
  }

  String full(String path) {
    return posterUrl(path, 400);
  }
}

String _findWidth(int minWidth, List<String> availableWidths) {
  for (final width in availableWidths) {
    final _w = _widthToInt(width);

    if (_w != null && _w >= minWidth) {
      return width;
    }
  }

  return availableWidths.last;
}

int _widthToInt(String width) {
  return int.tryParse(width.substring(1));
}
