import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components.dart';

class CNCWidget extends StatelessWidget {
  // int index;
  String title;
  String userImage, content, time;
  Widget? trailing;
  Widget? leading;
  bool isNotification = false;
  // String? notificationImage;

  CNCWidget(
      {Key? key,
      // required this.index,
      required this.userImage,
      required this.title,
      this.content = "",
      this.time = "",
      this.isNotification = false,
      this.trailing,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading ?? profileImage(28, userImage),
      title: isNotification
          ? RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: title,
                    style: TextStyle(
                        color: isDarkMode(), fontWeight: FontWeight.bold)),
                TextSpan(
                    text: content.isEmpty
                        ? " requested to follow you. "
                        : " $content ",
                    style: TextStyle(color: isDarkMode())),
                TextSpan(text: time, style: TextStyle(color: Colors.grey))
              ]),
            )
          : Text(title,
              style:
                  TextStyle(color: isDarkMode(), fontWeight: FontWeight.w400)),
      subtitle: isNotification ? null : Text(content),
      trailing: trailing,
      contentPadding: EdgeInsets.fromLTRB(8.w, 0.0, 10.w, 0.0),
    );
  }
}
