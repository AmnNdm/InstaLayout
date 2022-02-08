// ignore_for_file: avoid_print
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import '../../main.dart';
import '../views/camera/imagepreview.dart';

class CameraSController extends GetxController {
  CameraController? camera;
  XFile? imageFile;
  RxInt selected = 1.obs;
  FixedExtentScrollController scrollController =
      FixedExtentScrollController(initialItem: 1);
  List<String> items = ["P O S T", "S T O R Y", "L I V E"];

  @override
  void onInit() {
    super.onInit();
    print("inside init");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: ([SystemUiOverlay.bottom]));
    camera = CameraController(cameras[0], ResolutionPreset.max);
    camera!.initialize().then((value) => update());
  }

  @override
  void onClose() {
    print("inside onclose");
    camera!.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.onClose();
  }

  double leftside() {
    if (selected.value == 0) {
      return 145;
    } else {
      return 90;
    }
  }

  void switchCamera() {
    if (camera!.description.lensDirection == CameraLensDirection.back) {
      camera = CameraController(cameras[1], ResolutionPreset.max);
      camera!.initialize().then((value) => update());
    } else {
      camera = CameraController(cameras[0], ResolutionPreset.max);
      camera!.initialize().then((value) => update());
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      // if (mounted) {
      //   setState(() {
      imageFile = file;
      update();
      // videoController?.dispose();
      // videoController = null;
      // });
      if (file != null) {
        print('Picture saved to ${file.path}');
        Get.to(
            () => ImagePreview(
                  path: file.path,
                ),
            transition: Transition.noTransition);
        // Get.to(() => ImagePreview(file.path));
      }

      // }
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = camera;
    if (cameraController == null || !cameraController.value.isInitialized) {
      print('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }
}
