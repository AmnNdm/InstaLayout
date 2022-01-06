import 'package:flutter/material.dart';
import 'package:insta_layout/components/appbar.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MyAppBar(
                    title: const TextField(
                  autofocus: false,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Search'),
                )),
              ],
          body: Container()),
    );
  }
}
