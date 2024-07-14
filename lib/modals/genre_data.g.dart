// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreData _$GenreDataFromJson(Map<String, dynamic> json) => GenreData(
      animeList: json['animeList'] == null
          ? null
          : AnimeList.fromJson(json['animeList'] as Map<String, dynamic>),
      mangaList: json['mangaList'] == null
          ? null
          : MangaList.fromJson(json['mangaList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenreDataToJson(GenreData instance) => <String, dynamic>{
      'animeList': instance.animeList,
      'mangaList': instance.mangaList,
    };
