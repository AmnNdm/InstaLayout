// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/home/messages/messagesearch.dart';
import 'package:insta_layout/home/messages/requests.dart';
import 'package:insta_layout/home/components.dart';
import 'package:insta_layout/others/constants.dart';

import '../homecontroller.dart';

class MessagesScreen extends GetView<HomeController> {
  const MessagesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(Text("username"),
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
                ? activeButton(context, "Chats", true)
                : activeButton(context, "Chats", false),
          );
        }, controller.currentTab),
        ObxValue((RxInt rxInt) {
          return GestureDetector(
            onTap: () => rxInt.value = 2,
            child: rxInt.value == 2
                ? activeButton(context, "Calls", true)
                : activeButton(context, "Calls", false),
          );
        }, controller.currentTab),
        GestureDetector(
          onTap: () => Get.to(() => const RequestsScreen()),
          child: activeButton(context, "Requests", false),
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
          searchBar(page: MessageSearchScreen(), context: context),
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
}
