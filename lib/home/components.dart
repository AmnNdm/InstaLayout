// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/home/homecontroller.dart';
import '../search.dart';
import '../others/constants.dart';
import 'messages/messagesearch.dart';

Color isDarkMode() {
  if (MediaQuery.of(Get.context!).platformBrightness == Brightness.dark) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

EdgeInsetsGeometry allPadding = EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h);

appbar(
  Widget title, {
  bool bottom = false,
  Widget? flexibleWidget,
  Widget? action,
}) {
  return AppBar(
    backgroundColor:
        (MediaQuery.of(Get.context!).platformBrightness == Brightness.dark)
            ? Colors.black
            : Colors.white,
    elevation: 0.0,
    title: title,
    actions: action != null ? [action] : null,
    bottom: bottom
        ? PreferredSize(
            child: flexibleWidget!,
            preferredSize:
                Size.fromHeight(MediaQuery.of(Get.context!).size.height / 16))
        : null,
  );
}

Widget iconButtons() {
  return Row(
    children: [
      ObxValue((RxBool rxBool) {
        return GestureDetector(
            onTap: () {
              rxBool.value = !rxBool.value;
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
      }, Get.find<HomeController>().like),
      SizedBox(
        width: 14.w,
      ),
      GestureDetector(
          onTap: () {},
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
        decoration: InputDecoration.collapsed(
            hintText: "Add a comment...",
            hintStyle: TextStyle(fontSize: 14.sp)),
      ))
    ],
  );
}

Widget profileImage(double r, String image) {
  return CircleAvatar(
    radius: r.r,
    foregroundImage: AssetImage(
      image,
    ),
  );
}

Widget circularBorder(double h, double w) {
  return Container(
    height: h.h,
    width: w.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(width: 2.w, color: Colors.indigo)),
  );
}

activeButton(BuildContext context, String title, bool isactive) {
  return Container(
    height: 50.h,
    width: 120.w,
    child: Center(
        child: isactive
            ? Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )
            : Text(
                title,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w600),
              )),
    decoration: isactive
        ? BoxDecoration(
            border: Border(bottom: BorderSide(color: isDarkMode(), width: 2.w)))
        : BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.grey.shade400, width: 0.5.w))),
  );
}

Widget searchBar() {
  return TextField(
    decoration: InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      hintText: "Search",
      hintStyle: TextStyle(fontSize: 16.sp),
      focusColor: isDarkMode(),
      prefixIcon: const Icon(Icons.search_outlined),
      border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none),
      filled: true,
    ),
    readOnly: true,
    onTap: () {
      Get.to(() => MessageSearchScreen());
    },
  );
}

Widget chatWidget(int index, String image, String message) {
  return ListTile(
    leading: profileImage(28, image),
    title: Text("Username $index"),
    subtitle: Text(message),
    trailing: const Icon(
      Icons.camera_enhance_outlined,
      color: Colors.grey,
    ),
    contentPadding: EdgeInsets.zero,
  );
}

Widget callWidget(int index, String image, String username,
    {bool trailing = false, bool cross = false}) {
  return ListTile(
    leading: profileImage(28, image),
    title: Text("Username $index"),
    subtitle: Text(username),
    trailing: trailing
        ? SizedBox(
            width: 60.w,
            child: Row(
              children: [
                Icon(
                  Icons.call_outlined,
                  color: isDarkMode(),
                  size: 22.h,
                ),
                Spacer(),
                Icon(
                  Icons.video_call_outlined,
                  color: isDarkMode(),
                  size: 28.h,
                )
              ],
            ),
          )
        : cross
            ? Icon(
                Icons.close,
                size: 20.h,
              )
            : null,
    contentPadding: EdgeInsets.fromLTRB(8.w, 0.0, 10.w, 0.0),
  );
}
