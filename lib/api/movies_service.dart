import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api/settings.dart';
import 'package:movies/api/response.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MovieService {
  @GET('/movie/now_playing')
  Future<MoviePagedResponse> getNowPlaying();

  @GET('/movie/popular')
  Future<MoviePagedResponse> getPopular();

  @GET('/movie/top_rated')
  Future<MoviePagedResponse> getTopRated();

  @GET('/movie/upcoming')
  Future<MoviePagedResponse> getUpcoming();
}

@RegisterAs(MovieService)
@injectable
class MoviesServiceImpl extends _MovieService {
  MoviesServiceImpl(Dio dio, ApiSettings settings)
      : super(dio, baseUrl: settings.baseUrl);
}
