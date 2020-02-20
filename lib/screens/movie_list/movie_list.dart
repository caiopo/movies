import 'package:flutter/material.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/widgets/change_notifier_builder.dart';
import 'package:movies/widgets/movies_grid.dart';

class MovieListScreen extends StatefulWidget {
  final String label;
  final Paginator<Movie> paginator;

  const MovieListScreen({
    Key key,
    this.label,
    this.paginator,
  }) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollChanged);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScrollChanged() {
    //  infinite scroll
    final diff =
        _scrollController.position.maxScrollExtent - _scrollController.offset;
    if (diff < 300) {
      widget.paginator.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MoviesColors.primaryColor,
      body: ChangeNotifierBuilder(
        notifier: widget.paginator,
        builder: (context) => CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text(
                widget.label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: MoviesColors.primaryColor,
              centerTitle: false,
            ),
            MoviesGrid(paginator: widget.paginator)
          ],
        ),
      ),
    );
  }
}
