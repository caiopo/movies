import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api/settings.dart';
import 'package:movies/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'config_service.g.dart';

@RestApi()
abstract class ConfigService {
  @GET('/configuration')
  Future<Config> getConfig();
}

@RegisterAs(ConfigService)
@injectable
class ConfigServiceImpl extends _ConfigService {
  ConfigServiceImpl(Dio dio, ApiSettings settings)
      : super(dio, baseUrl: settings.baseUrl);
}
