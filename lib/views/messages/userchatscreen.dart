import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/messagecontroller.dart';

class UserChatScreen extends GetView<MessageController> {
  String userid;
  UserChatScreen(this.userid, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("at build: ${controller.messagesList.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("user$userid"),
        backgroundColor: isnotDarkMode(),
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          getMessageStream(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: inputFieldWidget(),
            ),
          )
        ],
      ),
    );
  }

  getMessageStream() {
    return StreamBuilder(
        stream: controller.dbRef.child(userid).onValue,
        builder: (context, snapshot1) {
          controller.messagesList.clear();
          print(controller.dbRef.child(userid).onChildChanged.length);
          String otheruser = userid == "1" ? "2" : "1";
          print(userid);
          print(otheruser);
          if (userid == "1" || userid == "2") {
            return StreamBuilder(
                stream: controller.dbRef.child(otheruser).onValue,
                builder: (context, snapshot2) {
                  controller.messagesList.clear();

                  if (snapshot1.hasData && snapshot2.hasData) {
                    final data1 =
                        (snapshot1.data as DatabaseEvent).snapshot.value as Map;
                    controller.messagedata(data1);
                    final data2 =
                        (snapshot2.data as DatabaseEvent).snapshot.value as Map;
                    controller.messagedata(data2);
                    print("complete list: ${controller.messagesList.length}");
                  }
                  return messageList();
                });
          } else {
            if (snapshot1.hasData) {
              final data1 =
                  (snapshot1.data as DatabaseEvent).snapshot.value as Map;
              controller.messagedata(data1);

              print("complete list: ${controller.messagesList.length}");
            }
            return messageList();
          }
        });
  }

  Widget messageList() {
    return Padding(
      padding: EdgeInsets.only(bottom: 58.h),
      child: ListView.builder(
          // controller: controller.scrollController,
          shrinkWrap: true,
          reverse: true,
          itemCount: controller.messagesList.length,
          itemBuilder: (context, index) {
            return messageWidget(controller.messagesList[index]);
          }),
    );
  }

  Widget messageWidget(Message m) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 10.h),
      child: Align(
        alignment: m.type == userid ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          crossAxisAlignment: m.type == userid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.h),
              margin: m.type == userid
                  ? EdgeInsets.only(left: 40.w)
                  : EdgeInsets.only(right: 40.w),
              decoration: BoxDecoration(
                  color: m.type == userid
                      ? Colors.grey.shade500
                      : Colors.blue.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(20.r))
                      .subtract(m.type == userid
                          ? BorderRadius.only(
                              bottomRight: Radius.circular(20.r))
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(20.r)))),
              child: Text(
                m.content,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Text(
              m.time,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }

  Widget inputFieldWidget() {
    return TextField(
      controller: controller.txtedtcontroller,
      cursorColor: Colors.grey.shade600,
      maxLines: 3,
      minLines: 1,
      decoration: InputDecoration(
          focusColor: isDarkMode(),
          hintText: "Type Message",
          suffixIcon: IconButton(
            onPressed: () {
              String time = DateTime.now().toString().split('.').first;
              Message m = Message(
                  content: controller.txtedtcontroller.text,
                  type: userid,
                  time: time);
              controller.sendMessage(m, userid);
              print(controller.txtedtcontroller.text);
              controller.txtedtcontroller.clear();
            },
            icon: const Icon(Icons.send),
            color: Colors.blue,
          ),
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.r))),
    );
  }
}
