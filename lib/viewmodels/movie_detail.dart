import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/api/credits_service.dart';
import 'package:movies/api/movies_service.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/status.dart';

@injectable
class MovieDetailViewModel extends ChangeNotifier {
  final MoviesService _moviesService;
  final CreditsService _creditsService;

  Status _status = Status.loading;
  Movie _movie;
  Credits _credits;

  MovieDetailViewModel(this._moviesService, this._creditsService);

  Status get status => _status;

  Movie get movie => _movie;

  Credits get credits => _credits;

  void load(int movieId) async {
    _status = Status.loading;
    notifyListeners();

    final results = await Future.wait([
      _moviesService.movieDetail(movieId),
      _creditsService.credits(movieId),
    ]);

    _status = Status.success;
    _movie = results[0];
    _credits = results[1];
    notifyListeners();
  }
}
