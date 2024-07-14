import 'package:animemangaapp/modals/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'display_all_data.g.dart';

@JsonSerializable()
class DisplayAllData {
  DisplayAllData(this.media);
  List<Media>? media;

  factory DisplayAllData.fromJson(Map<String, dynamic> json) =>
      _$DisplayAllDataFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayAllDataToJson(this);
}
