import 'package:flutter/material.dart';
import 'package:insta_layout/others/components.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(const TextField(
        autofocus: false,
        cursorColor: Colors.grey,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      )),
    );
  }
}