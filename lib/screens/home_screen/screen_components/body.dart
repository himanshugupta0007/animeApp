import 'package:animemangaapp/helper/text_constants.dart';
import 'package:animemangaapp/screens/home_screen/screen_components/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key, this.bodyType = ANIME}) : super(key: key);

  final String bodyType;

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            HomePage(
                type: widget.bodyType,
                season: 'SUMMER',
                year: 2021,
                nextSeason: 'FALL',
                nextYear: 2021)
          ],
        ),
      ),
    );
  }
}
