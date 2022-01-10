// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

Color isDarkMode() {
  if (MediaQuery.of(Get.context!).platformBrightness == Brightness.dark) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

Color isnotDarkMode() {
  if (MediaQuery.of(Get.context!).platformBrightness == Brightness.dark) {
    return Colors.black;
  } else {
    return Colors.white;
  }
}

EdgeInsetsGeometry allPadding = EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h);

Widget profileImage(double r, String image) {
  return CircleAvatar(
    radius: r.r,
    backgroundColor: Colors.black,
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

Widget searchBar(
    {required Widget page, bool? withNavbar, required BuildContext context}) {
  return TextField(
    decoration: InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      hintText: "Search",
      hintStyle: TextStyle(fontSize: 16.sp),
      // focusColor: isDarkMode(),
      prefixIcon: Icon(
        Icons.search_outlined,
        color: Colors.grey.shade600,
      ),
      border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none),
      filled: true,
    ),
    readOnly: true,
    onTap: () {
      pushNewScreen(context, screen: page, withNavBar: withNavbar);
      // Get.to(() => page);
    },
  );
}

Widget button({required String title, required Color color}) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(
      title,
      style: TextStyle(
          color: color == Colors.blue ? Colors.white : isDarkMode(),
          fontSize: 12.sp),
    ),
    style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        minimumSize: MaterialStateProperty.all<Size>(Size(80.w, 30.h)),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        elevation: MaterialStateProperty.all<double>(0.0),
        backgroundColor: MaterialStateProperty.all<Color>(
            color == Colors.blue ? color : isnotDarkMode()),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(
            color: color == Colors.blue ? color : Colors.grey.shade300,
            width: 0.5.w))),
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
