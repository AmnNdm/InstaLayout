import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/controllers/cameracontroller.dart';

class ImagePreview extends GetView<CameraSController> {
  String path;

  ImagePreview(
      {Key? key,
      this.path =
          "/data/user/0/com.example.insta_layout/cache/CAP7317585605362182203.jpg"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: ([SystemUiOverlay.bottom]));
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 15.h, top: 28.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                        aspectRatio: 0.593,
                        child: Image.file(
                          File(path),
                          fit: BoxFit.cover,
                        )),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 45.h,
                        width: 136.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: Colors.grey.shade900),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 45.h,
                        width: 136.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: Colors.grey.shade900),
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 22.r,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
