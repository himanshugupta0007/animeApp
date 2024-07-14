import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularLoaderWidget extends StatelessWidget {
  const CircularLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
            child: Container(
                padding: EdgeInsets.only(top: 200.h),
                child: CircularProgressIndicator())));
  }
}
