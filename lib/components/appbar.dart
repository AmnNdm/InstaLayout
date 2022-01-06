import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customwidgets.dart';

class MyAppBar extends StatelessWidget {
  final Widget title;
  final bool bottom;
  final Widget? flexibleWidget;
  final Widget? action;

  MyAppBar({
    Key? key,
    required this.title,
    this.bottom = false,
    this.flexibleWidget,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: isnotDarkMode(),
      title: title,
      elevation: 0.2,
      actions: action != null ? [action!] : null,
      bottom: bottom
          ? PreferredSize(
              child: flexibleWidget!,
              preferredSize:
                  Size.fromHeight(MediaQuery.of(Get.context!).size.height / 16))
          : null,
    );
  }
}
