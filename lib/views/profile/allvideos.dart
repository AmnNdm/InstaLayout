import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/components/constants.dart';

class AllVideos extends StatelessWidget {
  const AllVideos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      children: List.generate(
        1,
        (index) {
          return GestureDetector(
              onTap: () {
                // ignore: avoid_print
                print("$index clicked");
              },
              child: videoWidget());
        },
      ),
    );
  }

  Widget videoWidget() {
    return Stack(
      children: [
        SizedBox(
          height: 120.h,
          width: 130.w,
          child: Image.asset(
            Constants.postImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 85.h,
            child: Row(
              children: const [
                Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white,
                ),
                Text(
                  "0",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                )
              ],
            ))
      ],
    );
  }
}
