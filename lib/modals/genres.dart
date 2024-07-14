import 'package:json_annotation/json_annotation.dart';
import 'coverImage.dart';
part 'genres.g.dart';

@JsonSerializable()
class Genres {
  Genres({required this.genreName, required this.coverImage});
  String genreName;
  CoverImage coverImage;

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}
