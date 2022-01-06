import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/home/comments.dart';

import 'commentbottomsheet.dart';
import 'components.dart';
import 'constants.dart';

class PostWidget extends StatelessWidget {
  final String userimage, username, postimage, time;
  final bool follow;
  final Function()? ontap;
  final RxBool like;
  final Widget? bottomsheet;

  const PostWidget(
      {Key? key,
      required this.username,
      required this.userimage,
      required this.postimage,
      this.follow = false,
      required this.time,
      this.ontap,
      this.bottomsheet,
      required this.like})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    left: 2.w, top: 1.7.h, child: profileImage(13, userimage)),
              ]),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: Row(
                children: [
                  Text(
                    username,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                  const Spacer(),
                  Visibility(
                      visible: follow,
                      child: button(title: "Follow", color: Colors.blue))
                ],
              )),
              IconButton(
                onPressed: () {
                  Get.bottomSheet(bottomsheet!,
                      backgroundColor:
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? Colors.grey.shade900
                              : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r))));
                },
                icon: const Icon(Icons.more_vert),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
              )
            ],
          ),
        ),
        GestureDetector(
            onDoubleTap: () {
              // TODO: handle like tap
              like.toggle();
              // ontap;
            },
            child: Image.asset(
              postimage,
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
                likes(127),
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
                Obx(
                  () => Visibility(
                    visible: like.value,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: addcomment(),
                    ),
                  ),
                ),
                timestamp(time)
              ],
            ))
      ],
    );
  }

  Widget iconButtons() {
    return Row(
      children: [
        ObxValue((RxBool rxBool) {
          return GestureDetector(
              onTap: () {
                // TODO: handle like tap here too
                // ontap;
                rxBool.toggle();
              },
              child: rxBool.value
                  ? Image.asset(
                      Constants.likeFilled,
                      scale: 6.3.h,
                      filterQuality: FilterQuality.high,
                    )
                  : Image.asset(
                      Constants.like,
                      scale: 6.h,
                      color: isDarkMode(),
                      filterQuality: FilterQuality.high,
                    ));
        }, like),
        SizedBox(
          width: 14.w,
        ),
        GestureDetector(
            onTap: () {
              Get.to(() => const CommentsScreen());
            },
            child: Image.asset(
              Constants.comment,
              scale: 6.h,
              color: isDarkMode(),
            )),
        SizedBox(
          width: 12.w,
        ),
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              Constants.send,
              scale: 6.5.h,
              color: isDarkMode(),
            )),
        const Spacer(),
        GestureDetector(
            onTap: () {},
            child: Image.asset(
              Constants.save,
              scale: 6.h,
              color: isDarkMode(),
            )),
      ],
    );
  }

  Widget likes(int likes) {
    return Text(
      '$likes likes',
      style: const TextStyle(fontWeight: FontWeight.w800),
    );
  }

  Widget addcomment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        profileImage(15, Constants.user0),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            child: TextField(
          readOnly: true,
          decoration: InputDecoration.collapsed(
              hintText: "Add a comment...",
              hintStyle: TextStyle(fontSize: 14.sp)),
          onTap: () {
            Get.bottomSheet(
              CommentBottomSheet(),
              barrierColor: Colors.transparent,
              backgroundColor: MediaQuery.of(Get.context!).platformBrightness ==
                      Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.white,
            );
          },
        ))
      ],
    );
  }

  Widget timestamp(String time) {
    return Text(
      time,
      style: TextStyle(fontSize: 10.sp),
    );
  }
}
