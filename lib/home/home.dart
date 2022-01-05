import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/others/circularWidget.dart';
import 'package:insta_layout/others/components.dart';
import 'package:insta_layout/others/constants.dart';
import 'package:insta_layout/home/controller/homecontroller.dart';
import 'package:insta_layout/home/messages/messages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/others/post.dart';

class MyHomePage extends GetView<HomeController> {
  final bool hideStatus;
  const MyHomePage({Key? key, this.hideStatus = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // isdark = brightness == Brightness.dark;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            appbar(const Text("InstaLayout"),
                action: GestureDetector(
                    onTap: () {
                      Get.to(() => const MessagesScreen());
                    },
                    child: Image.asset(
                      Constants.message,
                      scale: 2.5.h,
                      color: isDarkMode(),
                    )),
                sliver: true)
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              stories(context),
              Divider(
                height: 0.h,
              ),
              posts()
            ],
          ),
        ),
      ),
    );
  }

  Widget stories(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6.55,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return storyWidget(index, controller.images[index]);
        },
        itemCount: 11,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget posts() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PostWidget(
            username: "Username $index",
            userimage: controller.images[index],
            postimage: Constants.postImage,
            time: "1 hour ago",
            like: controller.like[index],
            bottomsheet: postBottomSheet());
      },
      itemCount: 10,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
    );
  }

  Widget storyWidget(
    int index,
    String image,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Stack(children: [
            circularBorder(70, 75),
            Positioned(
                left: 4.w,
                top: 3.h,
                child: index == 0
                    ? profileImage(34, Constants.user0)
                    : profileImage(34, image)),
            Visibility(
                visible: index == 0,
                child: Positioned(
                    left: 50.w,
                    top: 50.h,
                    child: CircleAvatar(
                      radius: 10.r,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16.h,
                      ),
                    )))
          ]),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "User $index",
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }

  Widget postBottomSheet() {
    return Container(
      height: 270.h,
      padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4.h,
              width: 40.w,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(26.w, 20.h, 26.w, 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularWidget(
                  height: 56,
                  width: 59,
                  border: 1.3,
                  child: const Icon(
                    Icons.link,
                  ),
                  title: "Link",
                ),
                CircularWidget(
                  height: 56,
                  width: 59,
                  border: 1.3,
                  child: const Icon(Icons.share_outlined),
                  title: "Share",
                ),
                CircularWidget(
                  height: 56,
                  width: 59,
                  border: 1.3,
                  child: Icon(
                    Icons.report_gmailerrorred_outlined,
                    color: Colors.red.shade400,
                  ),
                  title: "Report",
                  color: Colors.red.shade400,
                )
              ],
            ),
          ),
          Divider(),
          thisText("Why you're seeing this post"),
          Divider(),
          thisText("Hide"),
          SizedBox(
            height: 16.h,
          ),
          thisText("Unfollow")
        ],
      ),
    );
  }

  Widget thisText(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
