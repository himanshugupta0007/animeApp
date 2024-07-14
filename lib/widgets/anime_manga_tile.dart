import 'package:animemangaapp/modals/media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeMangaTile extends StatelessWidget {
  const AnimeMangaTile({Key? key, @required this.mediaData}) : super(key: key);

  final Media? mediaData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(mediaData!.title.userPreferred.toString());
      },
      child: Container(
        height: 220.h,
        width: 140.w,
        child: Card(
          elevation: 10,
          color: Colors.black,
          child: Wrap(
            children: [
              Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            mediaData!.coverImage.large.toString(),
                          )),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 180.h,
                  width: double.infinity),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  mediaData!.title.userPreferred.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      overflow: TextOverflow.fade),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
