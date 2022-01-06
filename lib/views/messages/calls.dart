import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/cnc.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/homecontroller.dart';

class Calls extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: allPadding,
            child: Text("Watch together",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          ),
          // ignore: sized_box_for_whitespace
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
                itemCount: 11,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(8.w, 0.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        Constants.image,
                      ),
                    ),
                  );
                }),
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          Padding(
            padding: allPadding,
            child: Text("Call friends",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
          ),
          Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    return CNCWidget(
                        userImage: controller.images[index],
                        title: "Username $index",
                        content: controller.images[index].toString(),
                        trailing: SizedBox(
                          width: 60.w,
                          child: Row(
                            children: [
                              Icon(
                                Icons.call_outlined,
                                color: isDarkMode(),
                                size: 22.h,
                              ),
                              const Spacer(),
                              Icon(
                                Icons.video_call_outlined,
                                color: isDarkMode(),
                                size: 28.h,
                              )
                            ],
                          ),
                        ));
                  }))
        ]);
  }
}
