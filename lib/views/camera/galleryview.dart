import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/controllers/cameracontroller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryView extends GetView<CameraSController> {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PostPicture Screen"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 28.h),
          child: Container(
            color: Colors.white,
          ),
        ));
  }
}
