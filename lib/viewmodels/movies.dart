import 'package:injectable/injectable.dart';
import 'package:movies/api/movies_service.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/api/response.dart';
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
  Paginator<Movie> _searchResults;

  String _query = '';

  Paginator<Movie> get nowPlaying => _nowPlaying;

  Paginator<Movie> get popular => _popular;

  Paginator<Movie> get topRated => _topRated;

  Paginator<Movie> get upcoming => _upcoming;

  Paginator<Movie> get searchResults => _searchResults;

  String get query => _query;

  MoviesViewModel(this._service) {
    _nowPlaying = Paginator(_service.getNowPlaying);
    _popular = Paginator(_service.getPopular);
    _topRated = Paginator(_service.getTopRated);
    _upcoming = Paginator(_service.getUpcoming);
    _searchResults = Paginator(_performSearch);

    addChildren([
      _nowPlaying,
      _popular,
      _topRated,
      _upcoming,
      _searchResults,
    ]);
  }

  set query(String q) {
    if (q != _query) {
      _query = q;
      _searchResults.reset();
    }
  }

  Future<Page<Movie>> _performSearch(int page) async {
    if (_query.isEmpty) {
      return null;
    }

    final result = await _service.search(_query, page);

    return result;
  }
}
