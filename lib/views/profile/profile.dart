import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/appbar.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/profilecontroller.dart';
import 'package:insta_layout/views/profile/allposts.dart';
import 'package:insta_layout/views/profile/alltags.dart';
import 'package:insta_layout/views/profile/allvideos.dart';
import 'package:insta_layout/views/profile/stickyheaderwidget.dart';
import 'package:insta_layout/views/messages/chats.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MyAppBar(
                  title: const Text("Username0"),
                  leading: const Icon(Icons.lock_outline),
                  action: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                  ],
                )
              ],
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: thatWidget()),
              StickyHeaderWidget(),
              SliverToBoxAdapter(
                child: ObxValue((RxInt rxInt) {
                  if (rxInt == 2) {
                    return AllVideos();
                  } else if (rxInt == 3) {
                    return AllTags();
                  } else {
                    return AllPosts();
                  }
                }, controller.tab),
              ),
              // SliverToBoxAdapter(child: Chats())
            ],
          )),
    );
  }

  Widget thatWidget() {
    return Padding(
      padding: allPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              profileImage(45, Constants.user0),
              SizedBox(width: 40.w),
              figure(22, "Posts"),
              SizedBox(width: 20.w),
              figure(22, "Followers"),
              SizedBox(width: 15.w),
              figure(22, "Following"),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            Constants.user0.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Edit profile"),
                style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all(0.0),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade300)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(305.w, 35.h))),
              ),
              // SizedBox(
              //   width: 2.w,
              // ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: 16.h,
                ),
                style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all(0.0),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade300)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(Size(38.w, 35.h))),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(children: [
            Expanded(
                child: Text(
              "Story highlights",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
            )),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16.h,
            ),
          ])
        ],
      ),
    );
  }

  Widget figure(int figure, String type) {
    return Column(
      children: [
        Text(
          figure.toString(),
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        Text(type)
      ],
    );
  }
}
