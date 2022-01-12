import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_layout/camera.dart';
import 'package:insta_layout/components/customnavigationbar.dart';
import 'package:insta_layout/views/messages/messages.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          body: TabBarView(
              children: [CameraScreen(), CustomBottomBar(), MessagesScreen()]),
        ));
  }
}
