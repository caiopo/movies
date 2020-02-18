import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/screens/routes.dart';
import 'package:movies/utils/random.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/widgets/rating.dart';
import 'package:provider/provider.dart';

const _kPosterWidth = 130.0;

class MovieItem extends StatelessWidget {
  final Movie movie;
  final String heroTag;

  MovieItem({
    Key key,
    @required this.movie,
    String heroTag,
  })  : heroTag = heroTag ?? randomTag(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);

    return InkWell(
      onTap: () async {
        await precacheImage(
          NetworkImage(config.splash(movie.posterPath)),
          context,
        );
        await Navigator.push(
          context,
          Routes.movie(
            movie: movie,
            heroTag: heroTag,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
        ),
        child: LimitedBox(
          maxWidth: _kPosterWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: Key(heroTag),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    config.thumbnail(movie.posterPath),
                    width: _kPosterWidth,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                movie.title,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              Rating(rating: movie.voteAverage),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
