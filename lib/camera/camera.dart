// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:insta_layout/camera/cameracontroller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/camera/imagepreview.dart';

import '../mainscreen.dart';

class CameraScreen extends GetView<CameraSController> {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: GetBuilder<CameraSController>(builder: (controller) {
      return Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
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
                    GestureDetector(
                      onTap: () => Get.to(() => ImagePreview(),
                          transition: Transition.noTransition),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.white, width: 2.0)),
                      ),
                    ),
                    const Spacer(),
                    typeSlider(),
                    const Spacer(),
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
          ));
    }), onWillPop: () async {
      Get.offAll(() => const MainScreen(), transition: Transition.rightToLeft);
      return false;
    });
  }

  Widget cameraView() {
    print(controller.camera!.value.aspectRatio / 3);
    return AspectRatio(
      aspectRatio: controller.camera!.value.aspectRatio / 3,
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
                    child: const CircleAvatar(
                      radius: 30,
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
        width: 150.0,
        height: 30.0,
        child: RotatedBox(
            quarterTurns: -1,
            child: ObxValue((RxInt rxInt) {
              return ListWheelScrollView(
                magnification: 2.0,
                onSelectedItemChanged: (x) {
                  rxInt.value = x;
                },
                controller: controller.scrollController,
                children: List.generate(
                    3,
                    (index) => RotatedBox(
                          quarterTurns: 1,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: index == rxInt.value ? 60.w : 50.w,
                            height: index == rxInt.value ? 60.h : 50.h,
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
                itemExtent: 50.0,
              );
            }, controller.selected)));
  }
}
