import 'package:animemangaapp/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          //border: Border.all(color: kPrimaryColor.withOpacity(0.5)),
          color: kPrimaryColor.withOpacity(0.5)),
      child: TextField(
        textAlign: TextAlign.left,
        onChanged: (value) => print(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15.h),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: 'Search anime, manga',
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
