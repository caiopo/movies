import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/screens/movie/movie.dart';

abstract class Routes {
  static MaterialPageRoute movie(Movie movie) {
    return MaterialPageRoute(builder: (context) {
      return MovieScreen(movie: movie);
    });
  }
}
