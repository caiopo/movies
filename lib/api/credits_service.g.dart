// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CreditsService implements CreditsService {
  _CreditsService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  credits(movieId) async {
    ArgumentError.checkNotNull(movieId, 'movieId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        '/movie/$movieId/credits',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Credits.fromJson(_result.data);
    return Future.value(value);
  }
}
