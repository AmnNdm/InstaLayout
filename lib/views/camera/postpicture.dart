import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/controllers/cameracontroller.dart';

class PostPicture extends GetView<CameraSController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("PostPicture Screen"),
    ));
  }
}
