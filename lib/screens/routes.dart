import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/screens/movie_detail/movie_detail.dart';

abstract class Routes {
  static MaterialPageRoute movieDetail({Movie movie, String heroTag}) {
    return MaterialPageRoute(builder: (context) {
      return MovieScreen(
        movie: movie,
        heroTag: heroTag,
      );
    });
  }
}
