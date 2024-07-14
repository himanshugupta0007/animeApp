// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genres _$GenresFromJson(Map<String, dynamic> json) => Genres(
      genreName: json['genreName'] as String,
      coverImage:
          CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'genreName': instance.genreName,
      'coverImage': instance.coverImage,
    };
