import 'package:json_annotation/json_annotation.dart';

part 'coverImage.g.dart';

@JsonSerializable()
class CoverImage {
  CoverImage({this.extraLarge, this.large, this.medium});
  String? extraLarge;
  String? large;
  String? medium;

  factory CoverImage.fromJson(Map<String, dynamic> json) =>
      _$CoverImageFromJson(json);

  Map<String, dynamic> toJson() => _$CoverImageToJson(this);
}
