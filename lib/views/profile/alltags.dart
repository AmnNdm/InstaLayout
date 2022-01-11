import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/components/circularwidget.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/components/customwidgets.dart';

class AllTags extends StatelessWidget {
  const AllTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: Column(children: [
        CircularWidget(
          height: 95,
          width: 100,
          border: 2,
          child: Icon(
            Icons.assignment_ind_outlined,
            size: 40.h,
          ),
          title: Column(
            children: [
              Text("Photos and",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18.sp,
                      color: isDarkMode())),
              Text("Videos of you",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18.sp,
                      color: isDarkMode()))
            ],
          ),
          color: isDarkMode(),
        ),
        SizedBox(
          height: 10.h,
        ),
        Column(
          children: [
            Text("When people tag you in photos and",
                style: TextStyle(color: Colors.grey.shade600)),
            Text("videos, they'll appear here.",
                style: TextStyle(color: Colors.grey.shade600))
          ],
        )
      ]),
    );
  }
}
