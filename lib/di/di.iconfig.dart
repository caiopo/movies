// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:movies/api/settings.dart';
import 'package:dio/dio.dart';
import 'package:movies/api/movies_service.dart';
import 'package:movies/api/credits_service.dart';
import 'package:movies/api/config_service.dart';
import 'package:movies/viewmodels/movie_detail.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movies.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final dioModule = _$DioModule();
  g.registerFactory<ApiSettings>(() => ApiSettings());
  g.registerFactory<MoviesService>(() => MoviesServiceImpl(
        g<Dio>(),
        g<ApiSettings>(),
      ));
  g.registerFactory<CreditsService>(() => CreditsServiceImpl(
        g<Dio>(),
        g<ApiSettings>(),
      ));
  g.registerFactory<ConfigService>(() => ConfigServiceImpl(
        g<Dio>(),
        g<ApiSettings>(),
      ));
  g.registerFactory<MovieDetailViewModel>(() => MovieDetailViewModel(
        g<MoviesService>(),
        g<CreditsService>(),
      ));
  g.registerFactory<MoviesViewModel>(() => MoviesViewModel(
        g<MoviesService>(),
      ));

  //Eager singletons must be registered in the right order
  g.registerSingleton<Dio>(dioModule.dio);
  g.registerSingleton<ConfigViewModel>(ConfigViewModel(
    g<ConfigService>(),
  ));
}

class _$DioModule extends DioModule {}
