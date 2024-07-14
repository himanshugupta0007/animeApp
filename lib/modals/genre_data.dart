import 'package:json_annotation/json_annotation.dart';
import 'anime_list.dart';
import 'manga_list.dart';
part 'genre_data.g.dart';

@JsonSerializable()
class GenreData {
  GenreData({this.animeList, this.mangaList});
  AnimeList? animeList;
  MangaList? mangaList;

  factory GenreData.fromJson(Map<String, dynamic> json) =>
      _$GenreDataFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDataToJson(this);
}
