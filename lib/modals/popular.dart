import 'package:animemangaapp/modals/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'media.dart';

part 'popular.g.dart';

@JsonSerializable()
class Popular {
  Popular(this.media);
  List<Media>? media;

  factory Popular.fromJson(Map<String, dynamic> json) =>
      _$PopularFromJson(json);

  Map<String, dynamic> toJson() => _$PopularToJson(this);
}
