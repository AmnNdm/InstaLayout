import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/components/cnc.dart';
import 'package:insta_layout/components/customwidgets.dart';
import 'package:insta_layout/controllers/messagecontroller.dart';
import 'package:insta_layout/views/messages/userchatscreen.dart';

import 'messagesearch.dart';

class Inbox extends GetView<MessageController> {
  Inbox({Key? key}) : super(key: key);

  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: allPadding,
          child: searchBar(page: const MessageSearchScreen(), context: context),
        ),
        SizedBox(
          height: 8.h,
        ),
        Flexible(fit: FlexFit.loose, child: userMessageWidget())
      ],
    );
  }

  userMessageWidget() {
    return StreamBuilder(
      stream: controller.alluserRef.onValue,
      builder: (context, snapshot) {
        users.clear();
        if (snapshot.hasData && !snapshot.hasError) {
          final data = (snapshot.data! as DatabaseEvent).snapshot.value as Map;
          if (data == null) {
            return Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
              ),
              Text("Add New User"),
            ]);
          } else {
            data.forEach((key, value) {
              final v = Map<dynamic, dynamic>.from(value);
              User u = User(id: v["id"] /*, name: v["name"]*/);
              users.add(u);

              // users.sort(/*(a, b) => a.id.compareTo(b.id)*/);
              print(users.length);
            });
          }

          for (User eachuser in users) {
            for (User user in users) {
              if (int.parse(eachuser.id) < int.parse(user.id)) {
                String id = eachuser.id;
                eachuser.id = user.id;
                user.id = id;
              }
            }
          }

          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return CNCWidget(
                  userImage: controller.images[index],
                  title: "${users[index].id}",
                  trailing: const Icon(
                    Icons.camera_enhance_outlined,
                    color: Colors.grey,
                  ),
                  ontap: () => Get.to(() => UserChatScreen(users[index].id)),
                );
              });
        } else {
          return Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            CircularProgressIndicator(
              color: isDarkMode(),
            )
          ]);
        }
      },
    );
  }
}
