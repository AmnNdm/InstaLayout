import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/home/comments.dart';

import 'components.dart';
import 'constants.dart';

class PostWidget extends StatelessWidget {
  final String userimage, username, postimage, time;
  final bool follow;
  final Function()? ontap;
  final RxBool like;
  final Function()? bottomsheet;

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
                  Spacer(),
                  Visibility(
                      visible: follow,
                      child: button(title: "Follow", color: Colors.blue))
                ],
              )),
              IconButton(
                // TODO: add bottom sheet
                onPressed: bottomsheet,
                icon: const Icon(Icons.more_vert),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerRight,
              )
            ],
          ),
        ),
        GestureDetector(
            onDoubleTap: () {
              // TODO: handle tap
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
                addcomment(userimage),
                SizedBox(
                  height: 8.h,
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
                // TODO: handle tap here too
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
      style: TextStyle(fontWeight: FontWeight.w800),
    );
  }

  Widget addcomment(String image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        profileImage(15, image),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
            child: TextField(
          readOnly: true,
          decoration: InputDecoration.collapsed(
              hintText: "Add a comment...",
              hintStyle: TextStyle(fontSize: 14.sp)),
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
