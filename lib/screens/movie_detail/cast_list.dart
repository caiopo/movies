import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/text.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:provider/provider.dart';

class CastList extends StatelessWidget {
  final List<CastMember> cast;

  const CastList({Key key, this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(24),
      itemBuilder: (context, index) {
        final member = cast[index];
        return CastItem(
          castMember: member,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 16);
      },
      itemCount: cast.length,
    );
  }
}

class CastItem extends StatelessWidget {
  final CastMember castMember;

  const CastItem({Key key, this.castMember}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);

    final hasPhoto = castMember.profilePath != null;

    return SizedBox(
      width: 90,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.grey.shade600,
            child: !hasPhoto
                ? Text(
                    formatInitials(castMember.name),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
            backgroundImage: hasPhoto
                ? NetworkImage(
                    config.profileUrl(castMember.profilePath, 70),
                  )
                : null,
            radius: 35,
          ),
          SizedBox(height: 8),
          Text(
            castMember.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              color: MoviesColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
