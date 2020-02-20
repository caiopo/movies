import 'package:flutter/material.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/models/models.dart';
import 'package:movies/screens/movie_detail/movie_detail.dart';
import 'package:movies/screens/movie_list/movie_list.dart';

abstract class Routes {
  static MaterialPageRoute movieDetail({Movie movie, String heroTag}) {
    return MaterialPageRoute(builder: (context) {
      return MovieDetailScreen(
        movie: movie,
        heroTag: heroTag,
      );
    });
  }

  static MaterialPageRoute movieList({
    String label,
    Paginator<Movie> paginator,
  }) {
    return MaterialPageRoute(builder: (context) {
      return MovieListScreen(label: label, paginator: paginator);
    });
  }
}
