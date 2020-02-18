import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);

    return Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            config.posterUrl(movie.posterPath, 200),
            width: 200,
          ),
        ),
      ],
    );
  }
}
