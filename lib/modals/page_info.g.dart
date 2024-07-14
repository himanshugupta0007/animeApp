// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) => PageInfo(
      json['hasNextPage'] as bool,
      json['currentPage'] as int,
      json['lastPage'] as int,
    );

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
      'hasNextPage': instance.hasNextPage,
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
    };
