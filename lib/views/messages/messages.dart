// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/homecontroller.dart';
import 'package:insta_layout/mainscreen.dart';
import 'package:insta_layout/views/messages/requests.dart';
import 'calls.dart';
import 'chats.dart';

class MessagesScreen extends GetView<HomeController> {
  const MessagesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const MainScreen(),
            transition: Transition.leftToRight);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.offAll(() => const MainScreen(),
                        transition: Transition.leftToRight);
                  }),
              automaticallyImplyLeading: false,
              backgroundColor: isnotDarkMode(),
              elevation: 0.0,
              title: const Text("username"),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0.w),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.video_call_outlined,
                            size: 30.h,
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.create,
                            size: 24.h,
                          )),
                    ],
                  ),
                ),
              ],
              bottom: PreferredSize(
                  child: buttons(context),
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(Get.context!).size.height / 16))),
          body: SingleChildScrollView(
            child: ObxValue((RxInt rxInt) {
              return rxInt.value == 1 ? const Chats() : const Calls();
            }, controller.currentTab),
          )),
    );
  }

  Widget buttons(BuildContext context) {
    return Row(
      children: [
        ObxValue((RxInt rxInt) {
          return GestureDetector(
            onTap: () => rxInt.value = 1,
            child: rxInt.value == 1
                ? tabButton(context, "Chats", true)
                : tabButton(context, "Chats", false),
          );
        }, controller.currentTab),
        ObxValue((RxInt rxInt) {
          return GestureDetector(
            onTap: () => rxInt.value = 2,
            child: rxInt.value == 2
                ? tabButton(context, "Calls", true)
                : tabButton(context, "Calls", false),
          );
        }, controller.currentTab),
        GestureDetector(
          onTap: () => Get.to(() => const RequestsScreen()),
          child: tabButton(context, "Requests", false),
        )
      ],
    );
  }

  tabButton(BuildContext context, String title, bool isactive) {
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
              border:
                  Border(bottom: BorderSide(color: isDarkMode(), width: 2.w)))
          : BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Colors.grey.shade400, width: 0.5.w))),
    );
  }
}
