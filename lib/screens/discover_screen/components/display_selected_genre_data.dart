import 'package:animemangaapp/main.dart';
import 'package:animemangaapp/modals/genre_data.dart';
import 'package:animemangaapp/modals/media.dart';
import 'package:animemangaapp/services/graphql_service.dart';
import 'package:animemangaapp/widgets/anime_manga_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplaySelectedGenreData extends StatefulWidget {
  const DisplaySelectedGenreData(
      {Key? key, required this.genreType, required this.mediaType})
      : super(key: key);

  final String genreType;
  final String mediaType;

  @override
  State<DisplaySelectedGenreData> createState() =>
      _DisplaySelectedGenreDataState();
}

class _DisplaySelectedGenreDataState extends State<DisplaySelectedGenreData> {
  final GraphQLService service = getItInstance<GraphQLService>();
  late Future<GenreData> futureGenreData;

  @override
  void initState() {
    super.initState();
    futureGenreData = service.fetchGenreData(widget.genreType, 1);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureGenreData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            GenreData? genreData = snapshot.data as GenreData?;
            return getGenreListData(genreData, widget.mediaType);
            //return Text(widget.mediaType);
          }
          return getCircularProgressIndicator(context);
        });
  }

  Widget getCircularProgressIndicator(BuildContext context) {
    return Center(
      child: Container(
        height: 70.h,
        width: 70.h,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

Widget getGenreListData(GenreData? genreData, String mediaType) {
  List<Media>? mediaList = (mediaType == 'ANIME')
      ? genreData!.animeList!.media
      : genreData!.mangaList!.media;
  return SafeArea(
      child: SingleChildScrollView(
    child: Container(
      height: 750.h,
      width: double.infinity,
      padding: EdgeInsets.all(10.h),
      child: GridView.builder(
          shrinkWrap: true,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 5.w,
              mainAxisExtent: 230.h),
          itemCount: mediaList!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.h),
              child: AnimeMangaTile(mediaData: mediaList[index]),
            );
          }),
    ),
  ));
}
