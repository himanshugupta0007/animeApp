import 'package:animemangaapp/graphql_requests/graphql_requests.dart';
import 'package:animemangaapp/helper/constants.dart';
import 'package:animemangaapp/helper/text_constants.dart';
import 'package:animemangaapp/modals/home_page_data.dart';
import 'package:animemangaapp/modals/media.dart';
import 'package:animemangaapp/modals/next_season.dart';
import 'package:animemangaapp/modals/popular.dart';
import 'package:animemangaapp/modals/season.dart';
import 'package:animemangaapp/modals/top.dart';
import 'package:animemangaapp/modals/trending.dart';
import 'package:animemangaapp/screens/all_media_screen/dispaly_all_list_screen.dart';
import 'package:animemangaapp/widgets/loader_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../widgets/anime_manga_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      required this.type,
      required this.season,
      required this.year,
      required this.nextSeason,
      required this.nextYear})
      : super(key: key);

  final String type;
  final String season;
  final int year;
  final String nextSeason;
  final int nextYear;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Query(
          options: QueryOptions(
            fetchPolicy: FetchPolicy.noCache,
            document: gql(home_page_anime_manga_query),
            variables: <String, dynamic>{
              'type': widget.type,
              'season': widget.season,
              'seasonYear': widget.year,
              'nextSeason': widget.nextSeason,
              'nextYear': widget.nextYear
            },
          ),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.isLoading) {
              return CircularLoaderWidget();
            }

            if (result.exception != null) {
              print(result.exception);
            }
            //todo: Add fetch more options in the code
            // FetchMoreOptions opts = FetchMoreOptions(updateQuery: updateQuery)
            var homePageData = getHomePageData(result.data);
            return getHomePageLayout(context, homePageData, widget.type);
          }),
    );
  }

/*
  Get Transformed data
*/
  HomePageData getHomePageData(Map<String, dynamic>? data) {
    var trendingData = Map<String, dynamic>.from(data?[TRENDING_DATA]);
    Trending tredingMedia = Trending.fromJson(trendingData);
    var seasonData = Map<String, dynamic>.from(data?[SEASON]);
    Season seasonMedia = Season.fromJson(seasonData);
    var nextSeasonData = Map<String, dynamic>.from(data?[NEXT_SEASON]);
    NextSeason nextSeasonMedia = NextSeason.fromJson(nextSeasonData);
    var popularData = Map<String, dynamic>.from(data?[POPULAR]);
    Popular popularMedia = Popular.fromJson(popularData);
    var topData = Map<String, dynamic>.from(data?[TOP_DATA]);
    Top topMedia = Top.fromJson(topData);

    return HomePageData(
        tredingMedia, seasonMedia, nextSeasonMedia, popularMedia, topMedia);
  }
}

Widget getHomePageLayout(
    BuildContext context, HomePageData homePageData, String tabType) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      getListViewBuilderForData(context, homePageData.trending!.media,
          TRENDING_ANIME_TEXT, tabType, TRENDING_DATA),
      getListViewBuilderForData(context, homePageData.popular!.media,
          POPULAR_ANIME_TEXT, tabType, POPULAR),
      getListViewBuilderForData(
          context, homePageData.top!.media, TOP_ANIME_TEXT, tabType, TOP_DATA),
      if (tabType.toString() == 'ANIME')
        getListViewBuilderForData(context, homePageData.season!.media,
            SEASON_ANIME_TEXT, tabType, SEASON),
      if (tabType.toString() == 'ANIME')
        getListViewBuilderForData(context, homePageData.nextSeason!.media,
            NEXT_SEASON_TEXT, tabType, NEXT_SEASON),
    ],
  );
}

getListViewBuilderForData(BuildContext context, List<Media>? mediaData,
    String headerText, String mediaType, String pageDataType) {
  return SizedBox(
    height: 300.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 35.h,
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                headerText,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.8),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
              if (!(pageDataType.toUpperCase() == 'SEASON' ||
                  pageDataType.toUpperCase() == 'NEXTSEASON'))
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DisplayAllMedia.routeName,
                          arguments: <String, String>{
                            'mediaType': mediaType,
                            'queryParameterType': pageDataType
                          });
                    },
                    child: Text(
                      SEE_ALL,
                      style: TextStyle(color: Colors.white60, fontSize: 16.sp),
                    ))
            ],
          ),
        ),
        Container(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mediaData!.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimeMangaTile(mediaData: mediaData[index]);
            },
          ),
        ),
      ],
    ),
  );
}
