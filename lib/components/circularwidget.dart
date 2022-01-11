// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularWidget extends StatelessWidget {
  final double height, width, border;
  final Widget child;
  Widget title;
  bool hasTitle;
  Color color;

  CircularWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.border,
      required this.child,
      this.title = const Text("data"),
      this.hasTitle = true,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: height.h,
            width: width.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              border: Border.all(width: border.w, color: color),
            ),
            child: child),
        Visibility(
            visible: hasTitle,
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                title
                // Text(
                //   title,
                //   style: TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: fontsize.sp,
                //       color: color),
                // ),
              ],
            ))
      ],
    );
  }
}
