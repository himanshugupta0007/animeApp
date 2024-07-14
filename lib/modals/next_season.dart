import 'package:animemangaapp/modals/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'media.dart';

part 'next_season.g.dart';

@JsonSerializable()
class NextSeason {
  NextSeason(this.media);
  List<Media>? media;

  factory NextSeason.fromJson(Map<String, dynamic> json) =>
      _$NextSeasonFromJson(json);

  Map<String, dynamic> toJson() => _$NextSeasonToJson(this);
}
