import 'package:animemangaapp/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderIconButtons extends StatefulWidget {
  const HeaderIconButtons({Key? key}) : super(key: key);

  @override
  _HeaderIconButtonsState createState() => _HeaderIconButtonsState();
}

class _HeaderIconButtonsState extends State<HeaderIconButtons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (print("Tapped Notification")),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            height: 46.h,
            width: 46.w,
            child: Icon(
              FontAwesomeIcons.bell,
              color: kPrimaryColor,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 16.h,
              width: 16.w,
              decoration: BoxDecoration(
                color: Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                    fontSize: 10.sp,
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
