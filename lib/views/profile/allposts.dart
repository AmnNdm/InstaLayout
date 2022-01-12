import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/controllers/profilecontroller.dart';

class AllPosts extends GetView<ProfileController> {
  const AllPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 2.0,
      children: List.generate(
        15,
        (index) {
          return GestureDetector(
            onTap: () {
              // ignore: avoid_print
              print("$index clicked");
            },
            child: SizedBox(
              height: 10.h,
              width: 10.w,
              child: Image.asset(
                Constants.postImage,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
