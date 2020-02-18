import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api/response.dart';
import 'package:movies/api/settings.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  @GET('/movie/now_playing')
  Future<MoviePage> getNowPlaying(@Query('page') int page);

  @GET('/movie/popular')
  Future<MoviePage> getPopular(@Query('page') int page);

  @GET('/movie/top_rated')
  Future<MoviePage> getTopRated(@Query('page') int page);

  @GET('/movie/upcoming')
  Future<MoviePage> getUpcoming(@Query('page') int page);
}

@RegisterAs(MoviesService)
@injectable
class MoviesServiceImpl extends _MoviesService {
  MoviesServiceImpl(Dio dio, ApiSettings settings)
      : super(dio, baseUrl: settings.baseUrl);
}
