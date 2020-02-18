import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';

class Rating extends StatelessWidget {
  final double rating;

  const Rating({Key key, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // convert rating (0-10) to stars (0-5)
    final stars = rating / 2;
    final filledStars = stars.floor() - 1;
    final partialStars = stars % 1;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        if (i <= filledStars) {
          return _buildFilledStar(MoviesColors.filledStar);
        }

        if (i == filledStars + 1) {
          return _buildPartialStar(partialStars);
        }

        return _buildFilledStar(MoviesColors.backgroundStar);
      }),
    );
  }

  Widget _buildFilledStar(Color color) {
    return Icon(
      Icons.star,
      color: color,
    );
  }

  Widget _buildPartialStar(double percent) {
    return Stack(
      children: <Widget>[
        _buildFilledStar(MoviesColors.backgroundStar),
        ClipRect(
          clipper: _StarClipper(percent),
          child: _buildFilledStar(MoviesColors.filledStar),
        ),
      ],
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double percent;

  _StarClipper(this.percent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(
      0,
      0,
      size.width * percent,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return !(oldClipper is _StarClipper) ||
        percent != (oldClipper as _StarClipper)?.percent;
  }
}
