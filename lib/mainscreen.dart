import 'package:flutter/material.dart';
import 'package:insta_layout/camera/camera.dart';
import 'package:insta_layout/components/customnavigationbar.dart';
import 'package:insta_layout/views/messages/messages.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          body: TabBarView(
              children: [CameraScreen(), CustomBottomBar(), MessagesScreen()]),
        ));
  }
}
