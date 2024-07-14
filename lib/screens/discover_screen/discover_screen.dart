import 'package:animemangaapp/helper/constants.dart';
import 'package:animemangaapp/helper/custom_search_delegate.dart';
import 'package:animemangaapp/screens/discover_screen/components/body.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static String routeName = '/searchScreen';

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSearch(context: context, delegate: CustomSearchDelegate());
        },
        child: Icon(Icons.search),
        backgroundColor: kPrimaryColor,
      ),
      body: DiscoverBody(),
    );
  }
}
