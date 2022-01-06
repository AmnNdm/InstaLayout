import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  bottomsheet: postBottomSheet());
            },
            itemCount: 10,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
          )),
    );
  }

  Widget postBottomSheet() {
    return Container(
      height: 170.h,
      padding: EdgeInsets.fromLTRB(0.w, 10.h, 0.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4.h,
              width: 35.w,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          thisText("Report..."),
          SizedBox(
            height: 16.h,
          ),
          thisText("Copy Link"),
          SizedBox(
            height: 16.h,
          ),
          thisText("Share to...")
        ],
      ),
    );
  }
}
