import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  const MovieScreen({Key key, this.movie}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);
    return Scaffold(
      body: Hero(
        tag: Key('poster ${widget.movie.id}'),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          child: Image.network(
            config.splash(widget.movie.posterPath),
          ),
        ),
      ),
    );
  }
}
