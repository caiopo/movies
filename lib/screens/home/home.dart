import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/status.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movies.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/paginated_list.dart';
import 'package:movies/widgets/search_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchTextController;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);
    final movies = Provider.of<MoviesViewModel>(context);

    if (config.status == Status.loading) {
      return Container();
    }

    return Scaffold(
        backgroundColor: MoviesColors.primaryColor,
        body: CustomScrollView(
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
                  _SearchHeader(),
                ]),
              ),
            ),
            SliverStickyHeader(
              header: _ListHeaderDecoration(),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _MoviesRow(
                    label: 'NOW PLAYING',
                    paginator: movies.nowPlaying,
                  ),
                  _MoviesRow(
                    label: 'POPULAR',
                    paginator: movies.popular,
                  ),
                  _MoviesRow(
                    label: 'TOP RATED',
                    paginator: movies.topRated,
                  ),
                  Container(
                    color: MoviesColors.primaryColor,
                    child: SafeArea(
                      top: false,
                      child: _MoviesRow(
                        label: 'UPCOMING',
                        paginator: movies.upcoming,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}

class _MoviesRow extends StatelessWidget {
  final String label;
  final Paginator paginator;

  const _MoviesRow({
    Key key,
    this.label,
    this.paginator,
  }) : super(key: key);

  void onSeeAllPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MoviesColors.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 24),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              FlatButton(
                onPressed: onSeeAllPressed,
                child: Text(
                  'See all',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 275,
            ),
            child: PaginatedList(
              paginator: paginator,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              builder: (context, index) {
                final movie = paginator.items[index];

                return MovieItem(
                  movie: movie,
                );
              },
            ),
          ),
        ],
      ),
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
              child: Container(),
            ),
          ),
        )
      ],
    );
  }
}

class _SearchHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MoviesColors.cyan,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 64,
            right: 64,
          ),
          child: Column(
            children: [
              Text(
                'Hello, what do you want to watch?',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              SearchField(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
