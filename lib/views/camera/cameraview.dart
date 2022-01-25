// ignore_for_file: avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/controllers/cameracontroller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../mainscreen.dart';
import 'imagepreview.dart';

class CameraView extends GetView<CameraSController> {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
