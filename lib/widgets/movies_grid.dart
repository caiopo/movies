import 'package:flutter/material.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/models/models.dart';
import 'package:movies/widgets/movie_item.dart';

class MoviesGrid extends SliverGrid {
  MoviesGrid({Key key, Paginator<Movie> paginator})
      : super(
          key: key,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.67,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final movie = paginator.items[index];
              return Center(
                child: MovieItem(movie: movie),
              );
            },
            childCount: paginator.items.length,
          ),
        );
}
