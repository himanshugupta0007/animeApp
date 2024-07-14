// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageData _$HomePageDataFromJson(Map<String, dynamic> json) => HomePageData(
      json['trending'] == null
          ? null
          : Trending.fromJson(json['trending'] as Map<String, dynamic>),
      json['season'] == null
          ? null
          : Season.fromJson(json['season'] as Map<String, dynamic>),
      json['nextSeason'] == null
          ? null
          : NextSeason.fromJson(json['nextSeason'] as Map<String, dynamic>),
      json['popular'] == null
          ? null
          : Popular.fromJson(json['popular'] as Map<String, dynamic>),
      json['top'] == null
          ? null
          : Top.fromJson(json['top'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomePageDataToJson(HomePageData instance) =>
    <String, dynamic>{
      'trending': instance.trending,
      'season': instance.season,
      'nextSeason': instance.nextSeason,
      'popular': instance.popular,
      'top': instance.top,
    };
