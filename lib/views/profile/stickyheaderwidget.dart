import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/profilecontroller.dart';

class StickyHeaderWidget extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        floating: false,
        pinned: true,
        delegate: CustomDelegate(controller: controller));
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  final ProfileController controller;
  CustomDelegate({required this.controller});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Row(
      children: [
        ObxValue((RxInt rxInt) {
          return GestureDetector(
              onTap: () {
                rxInt.value = 1;
              },
              child: rxInt.value == 1
                  ? iconButton(context, Icons.grid_on_sharp, true)
                  : iconButton(context, Icons.grid_on_sharp, false));
        }, controller.tab),
        ObxValue((RxInt rxInt) {
          return GestureDetector(
            onTap: () {
              rxInt.value = 2;
            },
            child: rxInt.value == 2
                ? iconButton(context, Icons.play_arrow_outlined, true)
                : iconButton(context, Icons.play_arrow_outlined, false),
          );
        }, controller.tab),
        ObxValue((RxInt rxInt) {
          return GestureDetector(
              onTap: () {
                rxInt.value = 3;
              },
              child: rxInt.value == 3
                  ? iconButton(context, Icons.assignment_ind_outlined, true)
                  : iconButton(context, Icons.assignment_ind_outlined, false));
        }, controller.tab),
      ],
    );
  }

  iconButton(BuildContext context, IconData icon, bool isactive) {
    return Container(
      width: 120.w,
      child: Center(
          child: isactive
              ? Icon(
                  icon,
                  color: isDarkMode(),
                )
              : Icon(
                  icon,
                  color: Colors.grey,
                )),
      decoration: isactive
          ? BoxDecoration(
              color: isnotDarkMode(),
              border:
                  Border(bottom: BorderSide(color: isDarkMode(), width: 2.w)))
          : BoxDecoration(
              color: isnotDarkMode(),
              border: Border(
                  bottom:
                      BorderSide(color: Colors.grey.shade400, width: 0.5.w))),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
