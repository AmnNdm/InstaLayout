import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/appbar.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/homecontroller.dart';

class CommentsScreen extends GetView<HomeController> {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          MyAppBar(
            title: const Text("Comments"),
            action: GestureDetector(
              onTap: () {},
              child: Image.asset(
                Constants.send,
                scale: 6.5,
                color: isDarkMode(),
              ),
            ),
          ),
        ];
      },
      body: Container(),
    ));
  }
}
