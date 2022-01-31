// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/controllers/cameracontroller.dart';
import 'package:insta_layout/views/camera/cameraview.dart';
import 'package:insta_layout/views/camera/gallerypostview.dart';

import '../../mainscreen.dart';

class CameraScreen extends GetView<CameraSController> {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
            color: Colors.black,
            child: ObxValue((RxInt rxInt) {
              return Stack(
                children: [
                  Visibility(
                      visible: rxInt.value == 0,
                      replacement: const CameraView(),
                      child: const PostScreen()),
                  AnimatedPositioned(
                    width: 200,
                    height: 35,
                    left: rxInt.value == 0 ? 150 : 80,
                    top: MediaQuery.of(context).size.height / 1.07,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      decoration: BoxDecoration(
                          color: (rxInt.value != 0)
                              ? Colors.black
                              : Colors.grey.shade800,
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  AnimatedPositioned(
                    width: 300,
                    height: 35,
                    left: rxInt.value == 0 ? 45 : 50,
                    top: MediaQuery.of(context).size.height / 1.07,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    child: Container(
                      child: typeSlider(),
                    ),
                  ),
                ],
              );
            }, controller.selected)),
        onWillPop: () async {
          Get.offAll(() => const MainScreen(),
              transition: Transition.rightToLeft);
          return false;
        });
  }

  Widget typeSlider() {
    return SizedBox(
        height: 30.h,
        child: RotatedBox(
            quarterTurns: -1,
            child: ObxValue((RxInt rxInt) {
              return ListWheelScrollView(
                magnification: 2.0,
                onSelectedItemChanged: (x) {
                  rxInt.value = x;
                  if (x == 0) {
                    print("selected post at index $x");
                    // Get.to(() => PostPicture());
                    // rxInt.value = 1;
                  }
                },
                diameterRatio: rxInt.value == 2 ? 1.5 : 5.0,
                controller: controller.scrollController,
                children: List.generate(
                    3,
                    (index) => RotatedBox(
                          quarterTurns: 1,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: index == rxInt.value ? 70.w : 60.w,
                            height: index == rxInt.value ? 70.h : 60.h,
                            alignment: Alignment.center,
                            child: Text(
                              controller.items[index],
                              style: TextStyle(
                                  fontSize:
                                      index == rxInt.value ? 15.sp : 13.sp,
                                  color: index == rxInt.value
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: index == rxInt.value
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                        )),
                itemExtent: 63.0,
              );
            }, controller.selected)));
  }
}
