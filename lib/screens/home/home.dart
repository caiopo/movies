import 'package:flutter/material.dart';
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
      backgroundColor: MoviesColors.cyan,
      body: SafeArea(
        child: PaginatedList(
          builder: (context, index) {
            return MovieItem(
              movie: movies.topRated.items[index],
//              onPress:
            );
          },
          paginator: movies.topRated,
        ),
      ),
    );
  }
}
