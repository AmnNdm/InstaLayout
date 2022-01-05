// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

Color isDarkMode() {
  if (MediaQuery.of(Get.context!).platformBrightness == Brightness.dark) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

Color isnotDarkMode() {
  if (MediaQuery.of(Get.context!).platformBrightness == Brightness.dark) {
    return Colors.black;
  } else {
    return Colors.white;
  }
}

EdgeInsetsGeometry allPadding = EdgeInsets.fromLTRB(16.w, 8.h, 12.w, 8.h);

appbar(Widget title,
    {bool bottom = false,
    Widget? flexibleWidget,
    Widget? action,
    sliver = false}) {
  return sliver
      ? SliverAppBar(
          floating: true,
          pinned: true,
          backgroundColor: isnotDarkMode(),
          title: title,
          elevation: 0.2,
          actions: action != null ? [action] : null,
        )
      : AppBar(
          backgroundColor: isnotDarkMode(),
          elevation: 0.0,
          title: title,
          actions: action != null ? [action] : null,
          bottom: bottom
              ? PreferredSize(
                  child: flexibleWidget!,
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(Get.context!).size.height / 16))
              : null,
        );
}

Widget profileImage(double r, String image) {
  return CircleAvatar(
    radius: r.r,
    backgroundColor: Colors.black,
    foregroundImage: AssetImage(
      image,
    ),
  );
}

Widget circularBorder(double h, double w) {
  return Container(
    height: h.h,
    width: w.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(width: 2.w, color: Colors.indigo)),
  );
}

Widget searchBar(
    {required Widget page, bool? withNavbar, required BuildContext context}) {
  return TextField(
    decoration: InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.zero,
      hintText: "Search",
      hintStyle: TextStyle(fontSize: 16.sp),
      // focusColor: isDarkMode(),
      prefixIcon: Icon(
        Icons.search_outlined,
        color: Colors.grey.shade600,
      ),
      border: OutlineInputBorder(
          gapPadding: 0,
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none),
      filled: true,
    ),
    readOnly: true,
    onTap: () {
      pushNewScreen(context, screen: page, withNavBar: withNavbar);
      // Get.to(() => page);
    },
  );
}

Widget cncWidget(int index, String image,
    {required bool subtitle,
    String? content,
    String? time,
    bool trailing = false,
    bool call = false,
    bool chat = false,
    bool notification = false,
    String? notificationImage,
    bool request = false}) {
  return ListTile(
    leading: profileImage(28, image),
    title: notification
        ? RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Username $index",
                  style: TextStyle(
                      color: isDarkMode(), fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      request ? " requested to follow you. " : " ${content!} ",
                  style: TextStyle(color: isDarkMode())),
              TextSpan(text: time, style: const TextStyle(color: Colors.grey))
            ]),
          )
        : Text("Username $index"),
    subtitle: subtitle ? Text(content!) : null,
    trailing: trailing
        ? (chat
            ? const Icon(
                Icons.camera_enhance_outlined,
                color: Colors.grey,
              )
            : call
                ? SizedBox(
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
                  )
                : Icon(
                    Icons.close,
                    size: 20.h,
                  ))
        : (notification
            ? (request
                ? SizedBox(
                    width: 150.w,
                    child: Row(
                      children: [
                        button(title: "Confirm", color: Colors.blue),
                        SizedBox(
                          width: 5.w,
                        ),
                        button(title: "Delete", color: Colors.white)
                      ],
                    ),
                  )
                : Image.asset(notificationImage!))
            : null),
    contentPadding: EdgeInsets.fromLTRB(8.w, 0.0, 10.w, 0.0),
  );
}

// Widget postWidget(int index, bool follow) {
//   HomeController controller = Get.find<HomeController>();
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.start,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: EdgeInsets.fromLTRB(8.0.w, 4.0.h, 8.0.w, 4.0.h),
//         child: Row(
//           children: [
//             Stack(children: [
//               circularBorder(28, 30),
//               Positioned(
//                   left: 2.w,
//                   top: 1.7.h,
//                   child: profileImage(13, controller.images[index])),
//             ]),
//             SizedBox(
//               width: 10.w,
//             ),
//             Expanded(
//                 child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     "UserName $index",
//                     style:
//                         TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
//                   ),
//                 ),
//                 Visibility(
//                     visible: follow,
//                     child: button(title: "Follow", color: Colors.blue))
//               ],
//             )),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.more_vert),
//               padding: EdgeInsets.zero,
//               alignment: Alignment.centerRight,
//             )
//           ],
//         ),
//       ),
//       GestureDetector(
//           onDoubleTap: () {
//             controller.like.toggle();
//           },
//           child: Image.asset(
//             Constants.postImage,
//             scale: 0.7.h,
//             // fit: BoxFit.fill,
//           )),
//       Padding(
//           padding: EdgeInsets.fromLTRB(12.0.w, 8.0.h, 12.0.w, 8.0.h),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               iconButtons(),
//               SizedBox(
//                 height: 6.h,
//               ),
//               const Text(
//                 '197 likes',
//                 style: TextStyle(fontWeight: FontWeight.w800),
//               ),
//               SizedBox(
//                 height: 6.h,
//               ),
//               GestureDetector(
//                   onTap: () {
//                     Get.to(() => const CommentsScreen());
//                   },
//                   child: const Text('View all comments')),
//               SizedBox(
//                 height: 8.h,
//               ),
//               addcomment(controller.images[index]),
//               SizedBox(
//                 height: 8.h,
//               ),
//               Text(
//                 "1 hour ago",
//                 style: TextStyle(fontSize: 10.sp),
//               )
//             ],
//           ))
//     ],
//   );
// }

Widget button({required String title, required Color color}) {
  return ElevatedButton(
    onPressed: () {},
    child: Text(
      title,
      style: TextStyle(
          color: color == Colors.blue ? Colors.white : Colors.black,
          fontSize: 12.sp),
    ),
    style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        minimumSize: MaterialStateProperty.all<Size>(Size(80.w, 30.h)),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        elevation: MaterialStateProperty.all<double>(0.0),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(
            color: color == Colors.blue ? color : Colors.grey.shade300,
            width: 0.5.w))),
  );
}
