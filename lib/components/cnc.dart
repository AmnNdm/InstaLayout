import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'customwidgets.dart';

class CNCWidget extends StatelessWidget {
  // int index;
  final String title;
  final String userImage, content, time;
  final Widget? trailing;
  final Widget? leading;
  final bool isNotification;
  final Function()? ontap;

  const CNCWidget(
      {Key? key,
      // required this.index,
      required this.userImage,
      required this.title,
      this.content = "",
      this.time = "",
      this.isNotification = false,
      this.trailing,
      this.leading,
      this.ontap})
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
                TextSpan(text: time, style: const TextStyle(color: Colors.grey))
              ]),
            )
          : Text(title,
              style:
                  TextStyle(color: isDarkMode(), fontWeight: FontWeight.w400)),
      subtitle: isNotification ? null : Text(content),
      trailing: trailing,
      contentPadding: EdgeInsets.fromLTRB(8.w, 0.0, 10.w, 0.0),
      onTap: ontap,
    );
  }
}
