// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaList _$MangaListFromJson(Map<String, dynamic> json) => MangaList(
      (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MangaListToJson(MangaList instance) => <String, dynamic>{
      'media': instance.media,
    };
