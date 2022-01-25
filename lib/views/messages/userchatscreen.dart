import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/models/messagesdao.dart';

List<Message> messages = [
  Message(
    content: "hello",
    type: "s",
    time: DateTime.now(),
  ),
  Message(
    content:
        "Now, we have the messages appearing on the screen but they are not styled the way we want in the chatting screen.",
    type: "r",
    time: DateTime.now(),
  ),
  Message(
    content: "hello",
    type: "s",
    time: DateTime.now(),
  ),
  Message(
    content: "hello",
    type: "r",
    time: DateTime.now(),
  ),
  Message(
    content: "hello",
    type: "s",
    time: DateTime.now(),
  ),
  Message(
    content: "hello",
    type: "s",
    time: DateTime.now(),
  ),
  Message(
    content:
        "Now, we have the messages appearing on the screen but they are not styled the way we want in the chatting screen.",
    type: "r",
    time: DateTime.now(),
  ),
  Message(
    content: "hello",
    type: "s",
    time: DateTime.now(),
  ),
  Message(
    content:
        "Now, we have the messages appearing on the screen but they are not styled the way we want in the chatting screen.",
    type: "r",
    time: DateTime.now(),
  ),
  Message(
    content: "hello",
    type: "s",
    time: DateTime.now(),
  ),
  Message(
    content:
        "Now, we have the messages appearing on the screen but they are not styled the way we want in the chatting screen.",
    type: "r",
    time: DateTime.now(),
  ),
  Message(
    content: "hello",
    type: "s",
    time: DateTime.now(),
  ),
  Message(
    content:
        "Now, we have the messages appearing on the screen but they are not styled the way we want in the chatting screen.",
    type: "r",
    time: DateTime.now(),
  ),
];

class UserChatScreen extends StatelessWidget {
  String username;
  UserChatScreen(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
        backgroundColor: isnotDarkMode(),
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 58.h),
            child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return messageWidget(index);
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                cursorColor: Colors.grey.shade600,
                maxLines: 3,
                minLines: 1,
                decoration: InputDecoration(
                    focusColor: isDarkMode(),
                    hintText: "Type Message",
                    suffixIcon: IconButton(
                      onPressed: () {},
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
              ),
            ),
          )
        ],
      ),
    );
  }

  messageWidget(int index) {
    String time = messages[index].time.toString().split('.').first;
    print(time);
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 10.h),
      child: Align(
        alignment: messages[index].type == "s"
            ? Alignment.topRight
            : Alignment.topLeft,
        child: Column(
          crossAxisAlignment: messages[index].type == "s"
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10.h),
              margin: messages[index].type == "s"
                  ? EdgeInsets.only(left: 40.w)
                  : EdgeInsets.only(right: 40.w),
              decoration: BoxDecoration(
                  color: messages[index].type == "s"
                      ? Colors.grey.shade500
                      : Colors.blue.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(20.r))
                      .subtract(messages[index].type == "s"
                          ? BorderRadius.only(
                              bottomRight: Radius.circular(20.r))
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(20.r)))),
              child: Text(
                messages[index].content,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }
}
