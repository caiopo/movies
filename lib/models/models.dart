import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final double voteAverage;
  final List<Genre> genres;

  @JsonKey(name: 'production_companies')
  final List<Company> companies;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.releaseDate,
    this.genres,
    this.companies,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Company {
  String name;

  Company({this.name});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Genre {
  String name;

  Genre({this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class Credits {
  final List<CastMember> cast;

  Credits({this.cast});

  factory Credits.fromJson(Map<String, dynamic> json) =>
      _$CreditsFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CastMember {
  final String name;
  final String profilePath;

  CastMember({this.name, this.profilePath});

  factory CastMember.fromJson(Map<String, dynamic> json) =>
      _$CastMemberFromJson(json);

  Map<String, dynamic> toJson() => _$CastMemberToJson(this);
}

@JsonSerializable()
class Config {
  final ImageConfig images;

  Config({this.images});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageConfig {
  @JsonKey(name: 'secure_base_url')
  final String imageBaseUrl;

  final List<String> posterSizes;
  final List<String> profileSizes;

  ImageConfig({
    this.imageBaseUrl,
    this.posterSizes,
    this.profileSizes,
  });

  factory ImageConfig.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ImageConfigToJson(this);
}
