// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ConfigService implements ConfigService {
  _ConfigService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  getConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/configuration',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Config.fromJson(_result.data);
    return Future.value(value);
  }
}
