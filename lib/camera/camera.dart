import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'package:insta_layout/camera/cameracontroller.dart';

class CameraScreen extends GetView<CameraSController> {
//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   // CameraController? controller;
//   // XFile? imageFile;
//   // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   // double itemWidth = 50.0;
//   // int itemCount = 3;
//   // int selected = 1;
//   // FixedExtentScrollController _scrollController =
//   //     FixedExtentScrollController(initialItem: 1);
//   // List<String> items = ["POST", "STORY", "LIVE"];
//   @override
//   void initState() {
//     super.initState();

//     // controller = CameraController(cameras[0], ResolutionPreset.max);
//     // controller!.initialize().then((value) {
//     //   if (!mounted) {
//     //     return;
//     //   }
//     //   setState(() {});
//     // });
//   }

//   @override
//   void dispose() {
//     // controller?.dispose();
//     super.dispose();
//   }

  // void switchCamera() {
  //   if (controller!.description.lensDirection == CameraLensDirection.back) {
  //     controller = CameraController(cameras[1], ResolutionPreset.max);
  //     controller!.initialize().then((value) {
  //       if (!mounted) {
  //         return;
  //       }
  //       setState(() {});
  //     });
  //   } else {
  //     controller = CameraController(cameras[0], ResolutionPreset.max);
  //     controller!.initialize().then((value) {
  //       if (!mounted) {
  //         return;
  //       }
  //       setState(() {});
  //     });
  //   }
  // }

  // void onTakePictureButtonPressed() {
  //   takePicture().then((XFile? file) {
  //     if (mounted) {
  //       setState(() {
  //         imageFile = file;
  //         // videoController?.dispose();
  //         // videoController = null;
  //       });
  //       if (file != null) print('Picture saved to ${file.path}');
  //     }
  //   });
  // }

  // Future<XFile?> takePicture() async {
  //   final CameraController? cameraController = controller;
  //   if (cameraController == null || !cameraController.value.isInitialized) {
  //     print('Error: select a camera first.');
  //     return null;
  //   }

  //   if (cameraController.value.isTakingPicture) {
  //     // A capture is already pending, do nothing.
  //     return null;
  //   }

  //   try {
  //     XFile file = await cameraController.takePicture();
  //     return file;
  //   } on CameraException catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraSController>(builder: (controller) {
      return Container(
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: controller.cc.value.isInitialized
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: cameraView())
                    : Text('Loading camera...'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white, width: 2.0)),
                    ),
                    Spacer(),
                    typeSlider(),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(
                        Icons.cameraswitch_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print(controller.cc.description.toString());
                        controller.switchCamera();
                        print(controller.cc.description.toString());
                      },
                    ),
                  ],
                ),
              )
            ],
          ));
    });
  }

  Widget cameraView() {
    print(controller.cc.value.aspectRatio);
    return AspectRatio(
      aspectRatio: controller.cc.value.aspectRatio / 3,
      // controller.value.aspectRatio / 3.45,
      child: GestureDetector(
        onDoubleTap: () {
          controller.switchCamera();
        },
        child: CameraPreview(controller.cc,
            child: Column(
              children: [
                Row(children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.flash_off,
                        color: Colors.white,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ))
                ]),
                Spacer(),
                GestureDetector(
                  onTap: controller.onTakePictureButtonPressed,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: CircleAvatar(
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
    return Container(
        width: 150.0,
        height: 30.0,
        child: RotatedBox(
            quarterTurns: -1,
            child: ListWheelScrollView(
              magnification: 2.0,
              onSelectedItemChanged: (x) {
                controller.selected.value = x;
                // setState(() {
                //   selected = x;
                // });
              },
              controller: controller.scrollController,
              children: List.generate(
                  3,
                  (index) => RotatedBox(
                        quarterTurns: 1,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: index == controller.selected.value ? 60 : 50,
                          height: index == controller.selected.value ? 60 : 50,
                          alignment: Alignment.center,
                          child: Text(
                            controller.items[index],
                            style: TextStyle(
                                fontSize: index == controller.selected.value
                                    ? 15
                                    : 13,
                                color: index == controller.selected.value
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: index == controller.selected.value
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ),
                      )),
              itemExtent: controller.itemWidth,
            )
            // ObxValue((RxInt rxInt) {
            //   return ListWheelScrollView(
            //     magnification: 2.0,
            //     onSelectedItemChanged: (x) {
            //       rxInt.value = x;
            //       // setState(() {
            //       //   selected = x;
            //       // });
            //     },
            //     controller: controller.scrollController,
            //     children: List.generate(
            //         3,
            //         (index) => RotatedBox(
            //               quarterTurns: 1,
            //               child: AnimatedContainer(
            //                 duration: Duration(milliseconds: 300),
            //                 width: index == rxInt.value ? 60 : 50,
            //                 height: index == rxInt.value ? 60 : 50,
            //                 alignment: Alignment.center,
            //                 child: Text(
            //                   controller.items[index],
            //                   style: TextStyle(
            //                       fontSize: index == rxInt.value ? 15 : 13,
            //                       color: index == rxInt.value
            //                           ? Colors.white
            //                           : Colors.grey,
            //                       fontWeight: index == rxInt.value
            //                           ? FontWeight.bold
            //                           : FontWeight.normal),
            //                 ),
            //               ),
            //             )),
            //     itemExtent: controller.itemWidth,
            //   );
            // }, controller.selected),
            ));
  }
}
