import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiSettings {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = '4fbdbdb7ab0a64a4ff94f65a19d7693a';
}

@registerModule
class DioModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          queryParameters: {
            'api_key': ApiSettings().apiKey,
          },
        ),
      );
}
