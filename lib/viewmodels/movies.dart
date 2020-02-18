import 'package:injectable/injectable.dart';
import 'package:movies/api/movies_service.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/nested_change_notifier.dart';

enum MovieListType {
  nowPlaying,
  popular,
  topRated,
  upcoming,
}

@injectable
class MoviesViewModel extends NestedChangeNotifier {
  final MoviesService _service;

  Paginator<Movie> _nowPlaying;
  Paginator<Movie> _popular;
  Paginator<Movie> _topRated;
  Paginator<Movie> _upcoming;

  Paginator<Movie> get nowPlaying => _nowPlaying;

  Paginator<Movie> get popular => _popular;

  Paginator<Movie> get topRated => _topRated;

  Paginator<Movie> get upcoming => _upcoming;

  MoviesViewModel(this._service) {
    _nowPlaying = Paginator(_service.getNowPlaying);
    _popular = Paginator(_service.getPopular);
    _topRated = Paginator(_service.getTopRated);
    _upcoming = Paginator(_service.getUpcoming);

    addChildren([
      _nowPlaying,
      _popular,
      _topRated,
      _upcoming,
    ]);
  }
}
