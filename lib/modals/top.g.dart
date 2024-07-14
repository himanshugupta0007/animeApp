// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Top _$TopFromJson(Map<String, dynamic> json) => Top(
      (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopToJson(Top instance) => <String, dynamic>{
      'media': instance.media,
    };
