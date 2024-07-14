import 'package:animemangaapp/helper/constants.dart';
import 'package:animemangaapp/provider/anime_manga_provider.dart';
import 'package:animemangaapp/screens/all_media_screen/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DisplayAllMedia extends StatefulWidget {
  const DisplayAllMedia({Key? key}) : super(key: key);

  static String routeName = '/displayAllMedia';
  @override
  _DisplayAllMediaState createState() => _DisplayAllMediaState();
}

class _DisplayAllMediaState extends State<DisplayAllMedia> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimeMangaProvider>(context, listen: false).clearList();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final String mediaType = arg['mediaType'];
    final String dataType = arg['queryParameterType'];
    Provider.of<AnimeMangaProvider>(context, listen: false)
        .getAllAnimeMangaDetails(mediaType, 1, dataType);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          dataType.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
              color: kPrimaryColor),
        ),
      ),
      body: DisplayDataBody(mediaType: mediaType, sortType: dataType),
    );
  }
}
