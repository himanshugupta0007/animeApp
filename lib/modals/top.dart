import 'package:animemangaapp/modals/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'media.dart';

part 'top.g.dart';

@JsonSerializable()
class Top {
  Top(this.media);
  List<Media>? media;

  factory Top.fromJson(Map<String, dynamic> json) => _$TopFromJson(json);

  Map<String, dynamic> toJson() => _$TopToJson(this);
}
