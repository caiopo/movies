import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/screens/routes.dart';
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

    return InkWell(
      onTap: () async {
        await precacheImage(
          NetworkImage(config.splash(movie.posterPath)),
          context,
        );
        await Navigator.push(context, Routes.movie(movie));
      },
      child: Column(
        children: <Widget>[
          Hero(
            tag: Key('poster ${movie.id}'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                config.thumbnail(movie.posterPath),
                width: 150,
              ),
            ),
          ),
          Text(movie.title),
          Text(movie.voteAverage.toString()),
          SizedBox(height: 16)
        ],
      ),
    );
  }
}
