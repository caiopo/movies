// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:movies/api/settings.dart';
import 'package:dio/dio.dart';
import 'package:movies/api/credits_service.dart';
import 'package:dio/src/dio.dart';
import 'package:movies/api/movies_service.dart';
import 'package:movies/api/config_service.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movies.dart';
import 'package:movies/viewmodels/movie_detail.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<ApiSettings>(() => ApiSettings());
  g.registerFactory<CreditsService>(() => CreditsServiceImpl(
        g<Dio>(),
        g<ApiSettings>(),
      ));
  g.registerFactory<MoviesService>(() => MoviesServiceImpl(
        g<Dio>(),
        g<ApiSettings>(),
      ));
  g.registerFactory<ConfigService>(() => ConfigServiceImpl(
        g<Dio>(),
        g<ApiSettings>(),
      ));
  g.registerFactory<MoviesViewModel>(() => MoviesViewModel(
        g<MoviesService>(),
      ));
  g.registerFactory<MovieDetailViewModel>(() => MovieDetailViewModel(
        g<MoviesService>(),
        g<CreditsService>(),
      ));
  _registerEagerSingletons(g, environment);
}

// Eager singletons must be registered in the right order
void _registerEagerSingletons(GetIt g, String environment) {
  g.registerSingleton<Dio>(Dio(
    BaseOptions(
      queryParameters: {
        'api_key': ApiSettings().apiKey,
      },
    ),
  ));
  g.registerSingleton<ConfigViewModel>(ConfigViewModel(
    g<ConfigService>(),
  ));
}
