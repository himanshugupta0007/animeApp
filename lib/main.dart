import 'package:animemangaapp/helper/routes.dart';
import 'package:animemangaapp/helper/theme.dart';
import 'package:animemangaapp/provider/anime_manga_provider.dart';
import 'package:animemangaapp/provider/genre_provider.dart';
import 'package:animemangaapp/screens/boarding_page.dart';
import 'package:animemangaapp/services/graphql_service.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

GetIt getItInstance = GetIt.I;

void registerServices() {
  getItInstance.registerLazySingleton(() => GraphQLService());
}

void main() {
  registerServices();
  // runApp(DevicePreview(builder: (context) => AnimeMangaApp()));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AnimeMangaProvider(),
      ),
      ChangeNotifierProvider(create: (context) => GenrePrvider())
    ],
    child: AnimeMangaApp(),
  ));
}

class AnimeMangaApp extends StatefulWidget {
  const AnimeMangaApp({Key? key}) : super(key: key);

  @override
  _AnimeMangaAppState createState() => _AnimeMangaAppState();
}

class _AnimeMangaAppState extends State<AnimeMangaApp> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLService.initailizeClient(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Anime Manga App',
          theme: theme(),
          initialRoute: BoardingPage.routeName,
          routes: routes,
        ),
      ),
    );
  }
}
