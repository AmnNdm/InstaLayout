// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/controllers/cameracontroller.dart';
import 'package:insta_layout/views/camera/postpicture.dart';

import '../../mainscreen.dart';
import 'imagepreview.dart';

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
                      replacement: one(),
                      child: two()),
                  // rxInt.value == 0 ? two() : one(),
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
                      // child: typeSlider(),
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
                  // typeSlider()
                ],
              );
            }, controller.selected)),
        onWillPop: () async {
          Get.offAll(() => const MainScreen(),
              transition: Transition.rightToLeft);
          return false;
        });
  }

  Widget one() {
    return GetBuilder<CameraSController>(builder: (controller) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.h, top: 28.h),
            child: controller.camera!.value.isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: cameraView())
                : const AspectRatio(aspectRatio: 0.593),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                ObxValue((RxInt rxInt) {
                  return Visibility(
                    visible: !(rxInt.value == 2),
                    child: GestureDetector(
                      onTap: () => Get.to(() => ImagePreview(),
                          transition: Transition.noTransition),
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border:
                                Border.all(color: Colors.white, width: 2.w)),
                      ),
                    ),
                  );
                }, controller.selected),
                Spacer(),
                IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(
                    Icons.cameraswitch_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print(controller.camera!.description.toString());
                    controller.switchCamera();
                    print(controller.camera!.description.toString());
                  },
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget cameraView() {
    print(controller.camera!.value.aspectRatio / 3);
    return AspectRatio(
      aspectRatio: controller.camera!.value.aspectRatio / 3.175,
      // controller.value.aspectRatio / 3.45,
      child: GestureDetector(
        onDoubleTap: () {
          controller.switchCamera();
        },
        child: CameraPreview(controller.camera!,
            child: Column(
              children: [
                Row(children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.flash_off,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Get.offAll(() => const MainScreen(),
                            transition: Transition.rightToLeft);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ]),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // String imagefile =
                    controller.onTakePictureButtonPressed();
                    // showImage(imagefile);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget typeSlider() {
    return SizedBox(
        // width: 150.w,
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

  Widget two() {
    return Padding(
      padding: EdgeInsets.only(top: 28.h),
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
