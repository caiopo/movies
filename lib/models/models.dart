import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String overview;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'vote_average')
  final double voteAverage;

  Movie({
    this.id,
    this.title,
    this.overview,
    this.posterPath,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Config {
  final ImageConfig images;

  Config({this.images});

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable()
class ImageConfig {
  @JsonKey(name: 'secure_base_url')
  final String imageBaseUrl;

  @JsonKey(name: 'poster_sizes')
  final List<String> posterSizes;

  ImageConfig({
    this.imageBaseUrl,
    this.posterSizes,
  });

  factory ImageConfig.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ImageConfigToJson(this);
}
