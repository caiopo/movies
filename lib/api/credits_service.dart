import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api/settings.dart';
import 'package:movies/models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'credits_service.g.dart';

@RestApi()
abstract class CreditsService {
  @GET('/movie/{id}/credits')
  Future<Credits> credits(@Path('id') int movieId);
}

@RegisterAs(CreditsService)
@injectable
class CreditsServiceImpl extends _CreditsService {
  CreditsServiceImpl(Dio dio, ApiSettings settings)
      : super(dio, baseUrl: settings.baseUrl);
}
