import 'package:flutter/material.dart';
import 'package:movies/di/di.dart';
import 'package:movies/models/models.dart';
import 'package:movies/screens/movie_detail/cast_list.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/text.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movie_detail.dart';
import 'package:movies/widgets/change_notifier_builder.dart';
import 'package:movies/widgets/movie_poster.dart';
import 'package:movies/widgets/rating.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  final String heroTag;

  const MovieDetailScreen({Key key, this.movie, this.heroTag})
      : assert(movie != null),
        assert(heroTag != null),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailViewModel movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = getIt<MovieDetailViewModel>();
    movieDetail.load(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);
    final movie = widget.movie;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MoviesColors.primaryColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Hero(
                    tag: Key(widget.heroTag),
                    child: MoviePoster(
                      type: PosterType.full,
                      movie: movie,
                      config: config,
                      width: screenWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 16,
                      spacing: 16,
                      children: <Widget>[
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Rating(rating: movie.voteAverage),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      movie.overview,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: MoviesColors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 165,
                    child: _buildCast(),
                  ),
                  _buildInfos(),
                  SafeArea(
                    top: false,
                    minimum: const EdgeInsets.only(bottom: 24),
                    child: Container(),
                  ),
                ]),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: BackButton(
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCast() {
    return ChangeNotifierBuilder(
      notifier: movieDetail,
      builder: (context) {
        final cast = movieDetail.credits?.cast;

        if (cast == null) {
          return Container();
        }

        return CastList(cast: cast);
      },
    );
  }

  Widget _buildInfos() {
    return ChangeNotifierBuilder(
      notifier: movieDetail,
      builder: (context) {
        final movie = movieDetail.movie ?? widget.movie;
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLabel('Studio'),
                  _buildLabel('Genre'),
                  _buildLabel('Release'),
                ],
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildValue(formatCompanies(movie.companies)),
                    _buildValue(formatGenres(movie.genres)),
                    _buildValue(formatReleaseYear(movie.releaseDate)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildValue(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        label,
        softWrap: false,
        overflow: TextOverflow.fade,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }
}
