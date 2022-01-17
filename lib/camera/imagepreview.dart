import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/camera/cameracontroller.dart';

class ImagePreview extends GetView<CameraSController> {
  String path;

  ImagePreview(
      {Key? key,
      this.path =
          "/data/user/0/com.example.insta_layout/cache/CAP7317585605362182203.jpg"})
      : super(key: key);

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: AspectRatio(
                        aspectRatio: controller.camera!.value.aspectRatio / 3,
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
                      onTap: () => Get.to(() => ImagePreview()),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 10.r,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        icon: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
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
