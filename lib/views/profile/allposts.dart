import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/controllers/profilecontroller.dart';

class AllPosts extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 1.0,
      mainAxisSpacing: 1.0,
      children: List.generate(
        12,
        (index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 10.h,
              width: 10.w,
              child: Image.asset(
                Constants.image,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
