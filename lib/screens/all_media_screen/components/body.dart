import 'package:animemangaapp/provider/anime_manga_provider.dart';
import 'package:animemangaapp/widgets/anime_manga_tile.dart';
import 'package:animemangaapp/widgets/loader_circular.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DisplayDataBody extends StatefulWidget {
  const DisplayDataBody(
      {Key? key, required this.mediaType, required this.sortType})
      : super(key: key);
  final String mediaType;
  final String sortType;
  @override
  _DisplayDataBodyState createState() => _DisplayDataBodyState();
}

class _DisplayDataBodyState extends State<DisplayDataBody> {
  ScrollController _scrollController = ScrollController();
  int pageCount = 1;
  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 10);
    _scrollController.addListener(() {
      _scrollListener();
    });
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print('Botton');
        Provider.of<AnimeMangaProvider>(context, listen: false)
            .getAllAnimeMangaDetails(
                widget.mediaType, ++pageCount, widget.sortType);
      });
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        print('top');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<AnimeMangaProvider>(context).mediaList.isEmpty
        ? Container(
            child: Center(child: CircularLoaderWidget()),
          )
        : SafeArea(
            child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Consumer<AnimeMangaProvider>(
              builder: (context, animeMangaProvider, child) => Container(
                height: 750.h,
                width: double.infinity,
                padding: EdgeInsets.all(10.h),
                child: GridView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.w,
                        crossAxisSpacing: 5.w,
                        mainAxisExtent: 230.h),
                    itemCount: animeMangaProvider.getMediaList().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10.h),
                        child: AnimeMangaTile(
                            mediaData:
                                animeMangaProvider.getMediaList()[index]),
                      );
                    }),
              ),
            ),
          ));
  }
}
