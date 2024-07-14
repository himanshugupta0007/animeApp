// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_all_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayAllData _$DisplayAllDataFromJson(Map<String, dynamic> json) =>
    DisplayAllData(
      (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DisplayAllDataToJson(DisplayAllData instance) =>
    <String, dynamic>{
      'media': instance.media,
    };
