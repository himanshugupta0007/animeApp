import 'package:animemangaapp/modals/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_list.g.dart';

@JsonSerializable()
class AnimeList {
  AnimeList(this.media);
  List<Media>? media;

  factory AnimeList.fromJson(Map<String, dynamic> json) =>
      _$AnimeListFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeListToJson(this);
}
