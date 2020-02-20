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
    releaseDate: json['release_date'] as String,
    genres: (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    companies: (json['production_companies'] as List)
        ?.map((e) =>
            e == null ? null : Company.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'genres': instance.genres,
      'production_companies': instance.companies,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'name': instance.name,
    };

Credits _$CreditsFromJson(Map<String, dynamic> json) {
  return Credits(
    cast: (json['cast'] as List)
        ?.map((e) =>
            e == null ? null : CastMember.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreditsToJson(Credits instance) => <String, dynamic>{
      'cast': instance.cast,
    };

CastMember _$CastMemberFromJson(Map<String, dynamic> json) {
  return CastMember(
    name: json['name'] as String,
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CastMemberToJson(CastMember instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
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
    profileSizes:
        (json['profile_sizes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ImageConfigToJson(ImageConfig instance) =>
    <String, dynamic>{
      'secure_base_url': instance.imageBaseUrl,
      'poster_sizes': instance.posterSizes,
      'profile_sizes': instance.profileSizes,
    };
