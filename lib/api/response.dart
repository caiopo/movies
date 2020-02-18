import 'package:json_annotation/json_annotation.dart';
import 'package:movies/models/models.dart';

part 'response.g.dart';

abstract class Page<T> {
  final List<T> results;
  final int page;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  Page({
    this.results,
    this.page,
    this.totalResults,
    this.totalPages,
  });
}

@JsonSerializable()
class MoviePage extends Page<Movie> {
  MoviePage({
    List<Movie> results,
    int page,
    int totalResults,
    int totalPages,
  }) : super(
          results: results,
          page: page,
          totalResults: totalResults,
          totalPages: totalPages,
        );

  factory MoviePage.fromJson(Map<String, dynamic> json) =>
      _$MoviePageFromJson(json);

  Map<String, dynamic> toJson() => _$MoviePageToJson(this);
}
