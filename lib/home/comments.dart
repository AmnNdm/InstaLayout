import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/home/controller/homecontroller.dart';
import 'package:insta_layout/others/components.dart';
import 'package:insta_layout/others/constants.dart';

class CommentsScreen extends GetView<HomeController> {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        const Text("Comments"),
        action: GestureDetector(
          onTap: () {},
          child: Image.asset(
            Constants.send,
            scale: 6.5,
            color: isDarkMode(),
          ),
        ),
      ),
    );
  }
}
