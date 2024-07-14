import 'package:animemangaapp/screens/all_media_screen/dispaly_all_list_screen.dart';
import 'package:animemangaapp/screens/boarding_page.dart';
import 'package:animemangaapp/screens/discover_screen/components/anime_manga_genre_list.dart';
import 'package:animemangaapp/screens/discover_screen/discover_screen.dart';
import 'package:animemangaapp/screens/favourite_screen/favourite_screen.dart';
import 'package:animemangaapp/screens/home_screen/home_screen.dart';
import 'package:animemangaapp/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  BoardingPage.routeName: (context) => BoardingPage(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DisplayAllMedia.routeName: (context) => DisplayAllMedia(),
  DiscoverScreen.routeName: (context) => DiscoverScreen(),
  FavouriteScreen.routeName: (context) => FavouriteScreen(),
  ProfilePage.routeName: (context) => ProfilePage(),
  AnimeMangaGenreList.routeName: (context) => AnimeMangaGenreList()
};
