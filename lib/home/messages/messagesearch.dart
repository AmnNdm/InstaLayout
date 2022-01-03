import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/others/components.dart';
import '../controller/homecontroller.dart';

class MessageSearchScreen extends GetView<HomeController> {
  const MessageSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        const TextField(
          autofocus: true,
          cursorColor: Colors.grey,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Search'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: allPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Recent",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              callWidget(
                  3, controller.images[3], controller.images[3].toString(),
                  cross: true),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Suggested",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
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
                        return callWidget(
                            index + 1,
                            controller.images[index + 1],
                            controller.images[index + 1].toString());
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
