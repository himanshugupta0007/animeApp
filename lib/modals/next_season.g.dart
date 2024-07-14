// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextSeason _$NextSeasonFromJson(Map<String, dynamic> json) => NextSeason(
      (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NextSeasonToJson(NextSeason instance) =>
    <String, dynamic>{
      'media': instance.media,
    };
