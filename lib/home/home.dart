import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/home/comments.dart';
import 'package:insta_layout/home/components.dart';
import 'package:insta_layout/others/constants.dart';
import 'package:insta_layout/home/homecontroller.dart';
import 'package:insta_layout/home/messages/messages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends GetView<HomeController> {
  final bool hideStatus;
  MyHomePage({Key? key, this.hideStatus = false}) : super(key: key) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    // isdark = brightness == Brightness.dark;
    return Scaffold(
      appBar: appbar(
        Text("InstaLayout"),
        action: GestureDetector(
            onTap: () {
              Get.to(() => const MessagesScreen());
            },
            child: Image.asset(
              Constants.message,
              scale: 2.5.h,
              color: isDarkMode(),
            )),
      ),
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
        return postWidget(index);
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
            circularBorder(72, 75),
            Positioned(
                left: 4.w,
                top: 4.h,
                child: index == 0
                    ? profileImage(34, Constants.user0)
                    : profileImage(34, image)),
            Visibility(
                visible: index == 0,
                child: Positioned(
                    left: 50.w,
                    top: 55.h,
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
            height: 5.h,
          ),
          Text(
            "User $index",
            style: TextStyle(fontSize: 12.sp),
          )
        ],
      ),
    );
  }

  Widget postWidget(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8.0.w, 4.0.h, 8.0.w, 4.0.h),
          child: Row(
            children: [
              Stack(children: [
                circularBorder(28, 30),
                Positioned(
                    left: 2.w,
                    top: 1.7.h,
                    child: profileImage(13, controller.images[index])),
              ]),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: Text(
                "UserName $index",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
              )),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
              )
            ],
          ),
        ),
        GestureDetector(
            onDoubleTap: () {
              controller.like.toggle();
            },
            child: Image.asset(
              Constants.postImage,
              scale: 0.7.h,
              // fit: BoxFit.fill,
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(12.0.w, 8.0.h, 12.0.w, 8.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconButtons(),
                SizedBox(
                  height: 6.h,
                ),
                const Text(
                  '197 likes',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 6.h,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => const CommentsScreen());
                    },
                    child: const Text('View all comments')),
                SizedBox(
                  height: 8.h,
                ),
                addcomment(controller.images[index]),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "1 hour ago",
                  style: TextStyle(fontSize: 10.sp),
                )
              ],
            ))
      ],
    );
  }
}
