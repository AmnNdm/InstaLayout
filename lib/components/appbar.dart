import 'package:flutter/material.dart';

import 'customwidgets.dart';

class MyAppBar extends StatelessWidget {
  final Widget title;
  final List<Widget>? action;
  // final Widget? leading;
  // ignore: prefer_const_constructors_in_immutables
  MyAppBar({
    Key? key,
    required this.title,
    this.action,
    // this.leading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // leading: leading,
      floating: true,
      pinned: true,
      backgroundColor: isnotDarkMode(),
      title: title,
      elevation: 0.2,
      actions: action,
    );
  }
}
