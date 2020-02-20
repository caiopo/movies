import 'package:flutter/material.dart';
import 'package:movies/api/paginator.dart';
import 'package:movies/screens/routes.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/widgets/change_notifier_builder.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/paginated_list.dart';

class MoviesRow extends StatelessWidget {
  final String label;
  final Paginator paginator;

  const MoviesRow({
    Key key,
    this.label,
    this.paginator,
  }) : super(key: key);

  void onSeeAllPressed(BuildContext context) {
    Navigator.push(
      context,
      Routes.movieList(label: label, paginator: paginator),
    );
  }

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
                onPressed: () => onSeeAllPressed(context),
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
          ChangeNotifierBuilder(
            notifier: paginator,
            builder: (context) => ConstrainedBox(
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
          ),
        ],
      ),
    );
  }
}
