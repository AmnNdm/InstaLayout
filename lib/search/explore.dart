import 'package:flutter/material.dart';
import 'package:insta_layout/others/components.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [appbar(const Text("Explore"), sliver: true)];
        },
        body: ListView.builder(
          itemBuilder: (context, index) {
            return postWidget(index, true);
          },
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
