import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/status.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movies.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/paginated_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);
    final movies = Provider.of<MoviesViewModel>(context);

    if (config.status == Status.loading) {
      return Container();
    }

    return Scaffold(
      backgroundColor: MoviesColors.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
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
                _MoviesRow(
                  label: 'UPCOMING',
                  paginator: movies.upcoming,
                ),
              ]),
            )
          ],
        ),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onPressed: () {},
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
    );
  }
}
