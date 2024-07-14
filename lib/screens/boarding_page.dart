import 'package:animemangaapp/helper/constants.dart';
import 'package:animemangaapp/helper/text_constants.dart';
import 'package:animemangaapp/provider/genre_provider.dart';
import 'package:animemangaapp/screens/discover_screen/discover_screen.dart';
import 'package:animemangaapp/screens/favourite_screen/favourite_screen.dart';
import 'package:animemangaapp/screens/home_screen/home_screen.dart';
import 'package:animemangaapp/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

int currentIndex = 0;

void navigateToScreen(int index) {
  currentIndex = index;
}

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  static String routeName = '/boardingPage';
  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  final List<Widget> screens = [
    HomeScreen(),
    DiscoverScreen(),
    FavouriteScreen(),
    ProfilePage()
  ];

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<GenrePrvider>(context, listen: false)
        .discoverAnimeMandaGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: HOME,
                backgroundColor: Colors.black.withOpacity(0.1)),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.compass),
                label: CATEGORIES,
                backgroundColor: Colors.black.withOpacity(0.1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: FAVORITE,
                backgroundColor: Colors.black.withOpacity(0.1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: PROFILE,
                backgroundColor: Colors.black.withOpacity(0.1)),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black.withOpacity(0.1),
          currentIndex: selectedIndex,
          iconSize: 25.sp,
          unselectedItemColor: Colors.white60,
          selectedIconTheme: IconThemeData(size: 35.sp, color: kPrimaryColor),
          showUnselectedLabels: true,
          onTap: _onItemTapped),
    );
  }
}
