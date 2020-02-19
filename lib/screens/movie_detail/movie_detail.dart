import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/widgets/movie_poster.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;
  final String heroTag;

  const MovieScreen({Key key, this.movie, this.heroTag})
      : assert(movie != null),
        assert(heroTag != null),
        super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);
    return Scaffold(
      backgroundColor: MoviesColors.primaryColor,
      body: Hero(
        tag: Key(widget.heroTag),
        child: MoviePoster(
          type: PosterType.full,
          movie: widget.movie,
          config: config,
        ),

      ),
    );
  }
}
