// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/activity.dart';
import 'package:insta_layout/home/messages/messages.dart';
import 'package:insta_layout/others/customnavigationbar.dart';
import 'package:insta_layout/post.dart';
import 'package:insta_layout/profile.dart';
import 'package:insta_layout/search/explore.dart';
import 'package:insta_layout/search/explorevideos.dart';
import 'package:insta_layout/search/search.dart';
import 'package:insta_layout/search/searchcontent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  final MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  final MaterialColor black = const MaterialColor(
    0x00000000,
    <int, Color>{
      50: Color(0x00000000),
      100: Color(0x00000000),
      200: Color(0x00000000),
      300: Color(0x00000000),
      400: Color(0x00000000),
      500: Color(0x00000000),
      600: Color(0x00000000),
      700: Color(0x00000000),
      800: Color(0x00000000),
      900: Color(0x00000000),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: black,
            // primaryColor: Colors.black26,
            scaffoldBackgroundColor: Colors.black,
            backgroundColor: Colors.black,
            canvasColor: Colors.black),
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: white,
            // primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            canvasColor: Colors.white),
        home: const CustomBottomBar(),
        // const SplashScreen(),
        initialRoute: "/",
        routes: {
          "/search": (context) => SearchScreen(),
          "/post": (context) => const PostScreen(),
          "/activity": (context) => const ActivityScreen(),
          "/profile": (context) => const ProfileScreen(),
          "/message": (context) => const MessagesScreen(),
          "/searchcontent": (context) => const SearchContent(),
          "/explorevideos": (context) => const Suggestion(),
          "/explore": (context) => const Explore()
        },
      ),
    );
  }
}
