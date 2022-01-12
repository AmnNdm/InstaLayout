import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mainscreen.dart';

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(MainScreen(),
            transition: Transition.rightToLeft, duration: Duration(seconds: 2));
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Text("Camera Screen"),
        ),
      ),
    );
  }
}
