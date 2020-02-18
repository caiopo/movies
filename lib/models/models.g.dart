// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    title: json['title'] as String,
    overview: json['overview'] as String,
    posterPath: json['poster_path'] as String,
    voteAverage: (json['vote_average'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return Config(
    images: json['images'] == null
        ? null
        : ImageConfig.fromJson(json['images'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'images': instance.images,
    };

ImageConfig _$ImageConfigFromJson(Map<String, dynamic> json) {
  return ImageConfig(
    imageBaseUrl: json['secure_base_url'] as String,
    posterSizes:
        (json['poster_sizes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ImageConfigToJson(ImageConfig instance) =>
    <String, dynamic>{
      'secure_base_url': instance.imageBaseUrl,
      'poster_sizes': instance.posterSizes,
    };
