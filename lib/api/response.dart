import 'package:json_annotation/json_annotation.dart';
import 'package:movies/models/models.dart';

part 'response.g.dart';

abstract class PagedResponse<T> {
  final List<T> results;
  final int page;
  @JsonKey(name: 'total_results')
  final int totalResults;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  PagedResponse({
    this.results,
    this.page,
    this.totalResults,
    this.totalPages,
  });
}

@JsonSerializable()
class MoviePagedResponse extends PagedResponse<Movie> {
  MoviePagedResponse({
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

  factory MoviePagedResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviePagedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviePagedResponseToJson(this);
}
