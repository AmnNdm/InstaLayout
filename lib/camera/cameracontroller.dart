import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class CameraSController extends GetxController {
  CameraController cc = CameraController(cameras[0], ResolutionPreset.max);
  XFile? imageFile;
  double itemWidth = 50.0;
  int itemCount = 3;
  RxInt selected = 1.obs;
  FixedExtentScrollController scrollController =
      FixedExtentScrollController(initialItem: 1);
  List<String> items = ["POST", "STORY", "LIVE"];

  @override
  void onInit() {
    super.onInit();
    // cc.value = CameraController(cameras[0], ResolutionPreset.max);
    cc.initialize().then((value) => update());
    // .then((value) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    // });
  }

  // InternalFinalCallback<void> get onDelete {
  //   cc.value.dispose();
  //   return super.onDelete;
  // }

  @override
  void dispose() {
    cc.dispose();
    super.dispose();
  }

  void switchCamera() {
    if (cc.description.lensDirection == CameraLensDirection.back) {
      cc = CameraController(cameras[1], ResolutionPreset.max);
      cc.initialize().then((value) => update());
      // update();
      // .then((value) {
      //   if (!mounted) {
      //     return;
      //   }
      //   setState(() {});
      // });
    } else {
      cc = CameraController(cameras[0], ResolutionPreset.max);
      cc.initialize().then((value) => update());
      // .then((value) {
      //   if (!mounted) {
      //     return;
      //   }
      //   setState(() {});
      // });
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      // if (mounted) {
      //   setState(() {
      imageFile = file;
      // videoController?.dispose();
      // videoController = null;
      // });
      if (file != null) print('Picture saved to ${file.path}');
      // }
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = cc;
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
