import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/activity/activitycontroller.dart';
import 'package:insta_layout/others/cnc.dart';
import 'package:insta_layout/others/components.dart';

class FollowRequests extends GetView<ActivityController> {
  const FollowRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            [appbar(const Text("Follow Requests"), sliver: true)],
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
