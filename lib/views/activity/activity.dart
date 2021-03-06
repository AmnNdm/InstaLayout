import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/appbar.dart';
import 'package:insta_layout/components/cnc.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/activitycontroller.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'followrequests.dart';

class ActivityScreen extends GetView<ActivityController> {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [MyAppBar(title: const Text("Activity"))];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CNCWidget(
                userImage: Constants.userM,
                leading: requests(120, Constants.userM),
                title: "Follow requests",
                content: "Approve or ignore requests",
                ontap: () =>
                    pushNewScreen(context, screen: const FollowRequests()),
              ),
              title("Today"),
              CNCWidget(
                userImage: Constants.userF,
                title: Constants.userF.toString(),
                trailing: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      Constants.postImage,
                      fit: BoxFit.cover,
                    )),
                isNotification: true,
                content: " liked your image. ",
                time: "1s",
              ),
              CNCWidget(
                userImage: Constants.userM,
                title: Constants.userM.toString(),
                time: "23h",
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
                isNotification: true,
              ),
              title("Yesterday"),
              CNCWidget(
                userImage: Constants.userF,
                title: Constants.userF.toString(),
                trailing: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      Constants.postImage,
                      fit: BoxFit.cover,
                    )),
                isNotification: true,
                content: " liked your image. ",
                time: "24h",
              ),
              CNCWidget(
                userImage: Constants.userM,
                title: Constants.userM.toString(),
                time: "1d",
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
                isNotification: true,
              ),
              title("This Week"),
              CNCWidget(
                userImage: Constants.userF,
                title: Constants.userF.toString(),
                trailing: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      Constants.postImage,
                      fit: BoxFit.cover,
                    )),
                isNotification: true,
                content: " liked your image. ",
                time: "2d",
              ),
              CNCWidget(
                userImage: Constants.userM,
                title: Constants.userM.toString(),
                time: "5d",
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
                isNotification: true,
              ),
              title("This Month"),
              CNCWidget(
                userImage: Constants.userF,
                title: Constants.userF.toString(),
                trailing: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      Constants.postImage,
                      fit: BoxFit.cover,
                    )),
                isNotification: true,
                content: " liked your image. ",
                time: "7d",
              ),
              CNCWidget(
                userImage: Constants.userM,
                title: Constants.userM.toString(),
                time: "4w",
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
                isNotification: true,
              ),
              title("Earlier"),
              CNCWidget(
                userImage: Constants.userF,
                title: Constants.userF.toString(),
                trailing: SizedBox(
                    height: 50.h,
                    width: 55.w,
                    child: Image.asset(
                      Constants.postImage,
                      fit: BoxFit.cover,
                    )),
                isNotification: true,
                content: " liked your image. ",
                time: "5w",
              ),
              CNCWidget(
                userImage: Constants.userM,
                title: Constants.userM.toString(),
                time: "9w",
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
                isNotification: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget requests(int total, String user) {
    return Stack(
      children: [
        profileImage(28, user),
        Positioned(
            left: 35.w,
            child: CircleAvatar(
              radius: 9.r,
              backgroundColor: Colors.red.shade400,
              child: Text(
                "$total",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w800),
              ),
            ))
      ],
    );
  }

  Widget title(String t) {
    return Padding(
      padding: allPadding,
      child: Text(
        t,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
      ),
    );
  }
}
