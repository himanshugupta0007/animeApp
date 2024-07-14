import 'package:animemangaapp/modals/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'media.dart';

part 'season.g.dart';

@JsonSerializable()
class Season {
  Season(this.media);
  List<Media>? media;

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
