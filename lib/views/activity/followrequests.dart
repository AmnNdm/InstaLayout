import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/appbar.dart';
import 'package:insta_layout/components/cnc.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/activitycontroller.dart';

class FollowRequests extends GetView<ActivityController> {
  const FollowRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [MyAppBar(title: const Text("Follow Requests"))],
        body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return CNCWidget(
              userImage: controller.images[index + 1],
              title: controller
                  .moreThan11(controller.images[index + 1].toString()),
              content: "Username ${index + 1}",
              trailing: SizedBox(
                width: 150.w,
                child: Row(
                  children: [
                    button(title: "Confirm", color: Colors.blue),
                    SizedBox(
                      width: 5.w,
                    ),
                    button(title: "Delete", color: Colors.white)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
