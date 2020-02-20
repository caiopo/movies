import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:movies/screens/home/movies_row.dart';
import 'package:movies/screens/home/search_header.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/debouncer.dart';
import 'package:movies/utils/status.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movies.dart';
import 'package:movies/widgets/change_notifier_builder.dart';
import 'package:movies/widgets/movies_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  TextEditingController _searchTextController;
  Debouncer<String> _searchDebouncer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScrollChanged);

    _searchTextController = TextEditingController();
    _searchTextController.addListener(_onSearchTextChanged);

    _searchDebouncer = Debouncer(Duration(milliseconds: 500), (query) {
      final movies = Provider.of<MoviesViewModel>(context, listen: false);
      movies.query = query;
    });
  }

  void _onScrollChanged() {
    // close keyboard when textfield goes out of the screen
    if (_scrollController.offset > 280) {
      FocusScope.of(context).unfocus();
    }

    // search infinite scroll
    final diff =
        _scrollController.position.maxScrollExtent - _scrollController.offset;

    if (diff < 300) {
      final movies = Provider.of<MoviesViewModel>(context, listen: false);
      movies.searchResults.loadNextPage();
    }
  }

  void _onSearchTextChanged() {
    _searchDebouncer.call(_searchTextController.text);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MoviesColors.primaryColor,
      body: CustomScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverStickyHeader(
            header: Container(
              color: MoviesColors.cyan,
              child: SafeArea(
                bottom: false,
                child: Container(),
              ),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SearchHeader(controller: _searchTextController),
              ]),
            ),
          ),
          SliverStickyHeader(
            header: _ListHeaderDecoration(),
            sliver: _buildHomeContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeContent() {
    final config = Provider.of<ConfigViewModel>(context);

    if (config.status == Status.loading) {
      return SliverFillViewport(
        delegate: SliverChildListDelegate([
          Container(),
        ]),
      );
    }

    // don't rebuild everything if only a single paginator changes
    final movies = Provider.of<MoviesViewModel>(context, listen: false);

    return ChangeNotifierBuilder(
      notifier: movies.searchResults,
      builder: (context) {
        if (movies.query.isNotEmpty) {
          if (!movies.searchResults.loading &&
              movies.searchResults.items.isEmpty) {
            return SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Text(
                    'No results',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ]),
            );
          }

          return MoviesGrid(paginator: movies.searchResults);
        }

        return SliverList(
          delegate: SliverChildListDelegate([
            MoviesRow(
              label: 'NOW PLAYING',
              paginator: movies.nowPlaying,
            ),
            MoviesRow(
              label: 'POPULAR',
              paginator: movies.popular,
            ),
            MoviesRow(
              label: 'TOP RATED',
              paginator: movies.topRated,
            ),
            Container(
              color: MoviesColors.primaryColor,
              child: SafeArea(
                top: false,
                child: MoviesRow(
                  label: 'UPCOMING',
                  paginator: movies.upcoming,
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}

class _ListHeaderDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: MoviesColors.cyan,
          height: 24,
        ),
        Center(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: MoviesColors.primaryColor,
            ),
            child: SafeArea(
              bottom: false,
              minimum: const EdgeInsets.only(top: 24),
              child: Container(),
            ),
          ),
        )
      ],
    );
  }
}
