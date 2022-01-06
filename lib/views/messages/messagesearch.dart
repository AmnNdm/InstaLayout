import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/appbar.dart';
import 'package:insta_layout/components/cnc.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/homecontroller.dart';

class MessageSearchScreen extends GetView<HomeController> {
  const MessageSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MyAppBar(
            title: const TextField(
              autofocus: true,
              cursorColor: Colors.grey,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Search'),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: allPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Recent",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CNCWidget(
                  userImage: controller.images[3],
                  title: "Username 3",
                  trailing: Icon(
                    Icons.close,
                    size: 20.h,
                  ),
                  content: controller.images[3].toString(),
                ),
                CNCWidget(
                  userImage: controller.images[4],
                  title: "Username 4",
                  trailing: Icon(
                    Icons.close,
                    size: 20.h,
                  ),
                  content: controller.images[4].toString(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Suggested",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.images.length - 1,
                        itemBuilder: (context, index) {
                          return CNCWidget(
                            userImage: controller.images[index + 1],
                            title: "Username ${index + 1}",
                            content: controller.images[index + 1].toString(),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
