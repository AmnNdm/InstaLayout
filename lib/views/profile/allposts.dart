import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.38,
      child: Center(
        child: Text("All Posts"),
      ),
    );
  }
}
