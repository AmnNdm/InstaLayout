import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/others/components.dart';
import 'package:insta_layout/others/post.dart';
import 'package:insta_layout/search/controller/searchcontroller.dart';

class Suggestion extends GetView<SearchController> {
  const Suggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [appbar(const Text("Videos You Might Like"), sliver: true)];
          },
          body: ListView.builder(
            itemBuilder: (context, index) {
              return PostWidget(
                username: "username $index",
                userimage: controller.images[index],
                postimage: controller.postimages[index],
                time: "1 day ago",
                follow: true,
                like: controller.like[index],
              );
            },
            itemCount: 10,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
          )),
    );
  }
}
