import 'package:animemangaapp/modals/next_season.dart';
import 'package:animemangaapp/modals/popular.dart';
import 'package:animemangaapp/modals/season.dart';
import 'package:animemangaapp/modals/top.dart';
import 'package:animemangaapp/modals/trending.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_page_data.g.dart';

@JsonSerializable()
class HomePageData {
  HomePageData(
      this.trending, this.season, this.nextSeason, this.popular, this.top);
  Trending? trending;
  Season? season;
  NextSeason? nextSeason;
  Popular? popular;
  Top? top;

  factory HomePageData.fromJson(Map<String, dynamic> json) =>
      _$HomePageDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageDataToJson(this);
}
