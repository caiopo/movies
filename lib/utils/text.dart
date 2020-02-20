import 'package:movies/models/models.dart';

String formatGenres(List<Genre> genres) {
  return genres?.map((g) => g.name)?.join(', ') ?? '';
}

String formatCompanies(List<Company> companies) {
  return companies?.map((g) => g.name)?.join(', ') ?? '';
}

String formatReleaseYear(String releaseDate) {
  return releaseDate?.substring(0, 4) ?? '';
}

String formatInitials(String name) {
  final names = name.split(' ');

  if (names.isEmpty) {
    return '??';
  }

  if (names.length == 1) {
    return name.substring(0, 2).toUpperCase();
  }

  return '${names.first.substring(0, 1)}${names.last.substring(0, 1)}'
      .toUpperCase();
}
