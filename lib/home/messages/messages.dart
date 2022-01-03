// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/home/messages/messagesearch.dart';
import 'package:insta_layout/home/messages/requests.dart';
import 'package:insta_layout/others/components.dart';
import 'package:insta_layout/others/constants.dart';

import '../controller/homecontroller.dart';

class MessagesScreen extends GetView<HomeController> {
  const MessagesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(const Text("username"),
            action: Padding(
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
            bottom: true,
            flexibleWidget: buttons(context)),
        body: SingleChildScrollView(
          child: ObxValue((RxInt rxInt) {
            return rxInt.value == 1 ? chats(context) : calls(context);
          }, controller.currentTab),
        ));
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

  Widget chats(BuildContext context) {
    return Padding(
      padding: allPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          searchBar(page: const MessageSearchScreen(), context: context),
          SizedBox(
            height: 10.h,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 11,
                itemBuilder: (context, index) {
                  return chatWidget(index, controller.images[index],
                      controller.messages[index]);
                }),
          )
        ],
      ),
    );
  }

  Widget calls(BuildContext context) {
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
                    return callWidget(index, controller.images[index],
                        controller.images[index].toString());
                  }))
        ]);
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
}
