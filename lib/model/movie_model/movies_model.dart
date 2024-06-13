// To parse this JSON data, do
//
//     final moviesModel = moviesModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

@freezed
class MoviesModel with _$MoviesModel {
  const factory MoviesModel({
    @JsonKey(name: "total") @Default('') String total,
    @JsonKey(name: "page") @Default(0) int page,
    @JsonKey(name: "pages") @Default(0) int pages,
    @JsonKey(name: "tv_shows") @Default([]) List<TvShow> tvShows,
  }) = _MoviesModel;

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
}

@freezed
class TvShow with _$TvShow {
  const factory TvShow({
    @JsonKey(name: "id") @Default(0) int id,
    @JsonKey(name: "name") @Default('') String name,
    @JsonKey(name: "permalink") @Default('') String permalink,
    @JsonKey(name: "start_date") @Default('') String startDate,
    @JsonKey(name: "end_date") @Default('') String endDate,
    @JsonKey(name: "country") @Default('') String country,
    @JsonKey(name: "network") @Default('') String network,
    @JsonKey(name: "status") @Default('') String status,
    @JsonKey(name: "image_thumbnail_path")
    @Default('')
    String imageThumbnailPath,
  }) = _TvShow;

  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);
}
