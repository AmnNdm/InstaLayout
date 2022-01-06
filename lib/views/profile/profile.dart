import 'package:flutter/material.dart';
import 'package:insta_layout/components/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MyAppBar(
                  title: const Text("Username0"),
                  leading: const Icon(Icons.lock_outline),
                  action: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                  ],
                )
              ],
          body: SingleChildScrollView(
            child: Column(
              children: [],
            ),
          )),
    );
  }
}
