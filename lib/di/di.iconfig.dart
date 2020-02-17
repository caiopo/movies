// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:movies/api/config.dart';
import 'package:dio/dio.dart';
import 'package:movies/api/movies_service.dart';
import 'package:dio/src/dio.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<ApiConfig>(() => ApiConfig());
  g.registerFactory<Dio>(() => Dio(
        BaseOptions(
          queryParameters: {
            'api_key': ApiConfig().apiKey,
          },
        ),
      ));
  g.registerFactory<MovieService>(() => MoviesServiceImpl(
        g<Dio>(),
        g<ApiConfig>(),
      ));
}
