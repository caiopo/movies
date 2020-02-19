import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/viewmodels/config.dart';

enum PosterType {
  thumbnail,
  full,
}

class MoviePoster extends StatelessWidget {
  final PosterType type;
  final Movie movie;
  final ConfigViewModel config;
  final double width;

  const MoviePoster({
    Key key,
    this.type,
    this.movie,
    this.config,
    this.width,
  })  : assert(type != null),
        assert(movie != null),
        assert(config != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: _borderRadius(),
      child: movie.posterPath != null
          ? Image.network(
              _url(),
              width: width,
              height: width != null ? (width * 1.5) : null,
              // account for thumbnails that don't have the
              // correct aspect ratio
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/images/poster-placeholder.png',
              width: width,
              height: width != null ? (width * 1.5) : null,
              fit: BoxFit.cover,
            ),
    );
  }

  String _url() {
    switch (type) {
      case PosterType.thumbnail:
        return config.thumbnail(movie.posterPath);
      case PosterType.full:
        return config.full(movie.posterPath);
    }

    // unreachable unless new values are added to PosterType
    throw ArgumentError.value(type);
  }

  BorderRadius _borderRadius() {
    switch (type) {
      case PosterType.thumbnail:
        return BorderRadius.circular(24);
      case PosterType.full:
        return const BorderRadius.only(
          bottomLeft: const Radius.circular(32),
          bottomRight: const Radius.circular(32),
        );
    }

    // unreachable unless new values are added to PosterType
    throw ArgumentError.value(type);
  }
}
