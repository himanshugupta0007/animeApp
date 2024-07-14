import 'package:animemangaapp/helper/constants.dart';
import 'package:animemangaapp/helper/text_constants.dart';
import 'package:animemangaapp/screens/home_screen/screen_components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                unselectedLabelColor: Colors.white60,
                indicatorColor: kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: ANIME,
                  ),
                  Tab(
                    text: MANGA,
                  )
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeBody(
              bodyType: ANIME_TYPE_REQUEST,
            ),
            HomeBody(
              bodyType: MANGA_TYPE_REQUEST,
            )
          ],
        ),
      ),
    );
  }
}
