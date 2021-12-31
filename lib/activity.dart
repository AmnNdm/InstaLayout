import 'package:flutter/material.dart';
import 'package:insta_layout/home/components.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [appbar(Text("Activity"), sliver: true)];
        },
        body: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
