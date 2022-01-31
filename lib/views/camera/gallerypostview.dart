import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/controllers/cameracontroller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostScreen extends GetView<CameraSController> {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PostPicture Screen"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 28.h),
          child: Container(
            color: Colors.white,
          ),
        ));
  }
}
