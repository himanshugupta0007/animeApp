import 'package:animemangaapp/modals/coverImage.dart';
import 'package:animemangaapp/modals/end_date.dart';
import 'package:animemangaapp/modals/start_date.dart';
import 'package:animemangaapp/modals/title.dart';
import 'package:json_annotation/json_annotation.dart';
import 'coverImage.dart';
import 'title.dart';
import 'start_date.dart';
import 'end_date.dart';

part 'media.g.dart';

@JsonSerializable()
class Media {
  Media(
      this.title,
      this.status,
      this.coverImage,
      this.bannerImage,
      this.id,
      this.startDate,
      this.endDate,
      this.description,
      this.format,
      this.episodes,
      this.duration,
      this.chapters,
      this.volumes,
      this.genres,
      this.isAdult);
  Title title;
  String? status;
  String? bannerImage;
  CoverImage coverImage;
  int id;
  StartDate? startDate;
  EndDate? endDate;
  String? description;
  String? format;
  int? episodes;
  int? duration;
  int? chapters;
  int? volumes;
  List<String> genres;
  bool isAdult;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
