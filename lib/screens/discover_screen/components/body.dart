import 'package:animemangaapp/provider/genre_provider.dart';
import 'package:animemangaapp/screens/discover_screen/components/genre_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({Key? key}) : super(key: key);

  @override
  _DiscoverBodyState createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Consumer<GenrePrvider>(
          builder: (context, genreProvider, child) => Container(
                height: 750.h,
                width: double.infinity,
                padding: EdgeInsets.all(10.h),
                child: GridView.builder(
                    shrinkWrap: true,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 2.w,
                        mainAxisExtent: 150.h),
                    itemCount: genreProvider.getGenreList().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10.h),
                        child: GenreTiles(
                            genres: genreProvider.getGenreList()[index]),
                      );
                    }),
              )),
    ));
  }
}
