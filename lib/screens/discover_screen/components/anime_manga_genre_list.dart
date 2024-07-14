import 'package:animemangaapp/helper/text_constants.dart';
import 'package:animemangaapp/screens/discover_screen/components/display_selected_genre_data.dart';
import 'package:flutter/material.dart';

class AnimeMangaGenreList extends StatefulWidget {
  const AnimeMangaGenreList({Key? key}) : super(key: key);

  static String routeName = '/animeMangaGenreList';

  @override
  State<AnimeMangaGenreList> createState() => _AnimeMangaGenreListState();
}

class _AnimeMangaGenreListState extends State<AnimeMangaGenreList> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final String genreType = arg['genreType'];

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(genreType.toUpperCase()),
              centerTitle: true,
              backgroundColor: Colors.black,
              bottom: TabBar(tabs: [Tab(text: ANIME), Tab(text: MANGA)]),
            ),
            body: TabBarView(children: [
              DisplaySelectedGenreData(
                mediaType: ANIME_TYPE_REQUEST,
                genreType: genreType,
              ),
              DisplaySelectedGenreData(
                mediaType: MANGA_TYPE_REQUEST,
                genreType: genreType,
              ),
            ])));
  }
}
