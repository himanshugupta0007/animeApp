// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      Title.fromJson(json['title'] as Map<String, dynamic>),
      json['status'] as String?,
      CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
      json['bannerImage'] as String?,
      json['id'] as int,
      json['startDate'] == null
          ? null
          : StartDate.fromJson(json['startDate'] as Map<String, dynamic>),
      json['endDate'] == null
          ? null
          : EndDate.fromJson(json['endDate'] as Map<String, dynamic>),
      json['description'] as String?,
      json['format'] as String?,
      json['episodes'] as int?,
      json['duration'] as int?,
      json['chapters'] as int?,
      json['volumes'] as int?,
      (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      json['isAdult'] as bool,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
      'bannerImage': instance.bannerImage,
      'coverImage': instance.coverImage,
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
      'format': instance.format,
      'episodes': instance.episodes,
      'duration': instance.duration,
      'chapters': instance.chapters,
      'volumes': instance.volumes,
      'genres': instance.genres,
      'isAdult': instance.isAdult,
    };
