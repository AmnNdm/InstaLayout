import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/cnc.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/homecontroller.dart';

import 'messagesearch.dart';

class Chats extends GetView<HomeController> {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: allPadding,
          child: searchBar(page: const MessageSearchScreen(), context: context),
        ),
        SizedBox(
          height: 8.h,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 11,
              itemBuilder: (context, index) {
                return CNCWidget(
                  userImage: controller.images[index],
                  title: "Username $index",
                  content: controller.messages[index],
                  trailing: const Icon(
                    Icons.camera_enhance_outlined,
                    color: Colors.grey,
                  ),
                );
              }),
        )
      ],
    );
  }
}
