import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/di/di.iconfig.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

@injectableInit
void configure() {
  $initGetIt(getIt);

  // runs only if compiled in debug mode
  assert(() {
    getIt<Dio>().interceptors.add(PrettyDioLogger(responseBody: false));
    return true;
  }());
}
