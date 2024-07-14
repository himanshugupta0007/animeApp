import 'package:animemangaapp/modals/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'manga_list.g.dart';

@JsonSerializable()
class MangaList {
  MangaList(this.media);
  List<Media>? media;

  factory MangaList.fromJson(Map<String, dynamic> json) =>
      _$MangaListFromJson(json);

  Map<String, dynamic> toJson() => _$MangaListToJson(this);
}
