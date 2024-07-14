import 'package:animemangaapp/modals/genres.dart';
import 'package:animemangaapp/screens/discover_screen/components/anime_manga_genre_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreTiles extends StatelessWidget {
  const GenreTiles({Key? key, required this.genres}) : super(key: key);

  final Genres genres;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AnimeMangaGenreList.routeName,
          arguments: <String, String>{
            'genreType': genres.genreName,
          }),
      child: Container(
        height: 150.h,
        width: 150.w,
        child: Card(
          color: Colors.black,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                              NetworkImage(genres.coverImage.large.toString())),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 100.h,
                  width: 100.w),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  genres.genreName.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      overflow: TextOverflow.visible,
                      fontSize: 14.sp,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
