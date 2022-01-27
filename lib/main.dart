// @dart=2.9

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/appbindings.dart';
import 'package:insta_layout/views/activity/activity.dart';
import 'package:insta_layout/views/camera/camera.dart';
import 'package:insta_layout/views/messages/messagescreen.dart';
import 'package:insta_layout/views/post.dart';
import 'package:insta_layout/views/profile/profile.dart';
import 'package:insta_layout/views/search/explore.dart';
import 'package:insta_layout/views/search/search.dart';
import 'package:insta_layout/views/search/searchcontent.dart';
import 'package:insta_layout/views/search/suggestions.dart';

import 'mainscreen.dart';

List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
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

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
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
        home: const MainScreen(),
        // const SplashScreen(),
        initialRoute: "/",
        routes: {
          "/search": (context) => const SearchScreen(),
          "/post": (context) => const PostScreen(),
          "/activity": (context) => const ActivityScreen(),
          "/profile": (context) => const ProfileScreen(),
          "/message": (context) => const MessagesScreen(),
          "/searchcontent": (context) => const SearchContent(),
          "/explorevideos": (context) => const Suggestion(),
          "/explore": (context) => const Explore(),
          "/camera": (context) => const CameraScreen()
        },
        initialBinding: AppBindings(),
      ),
    );
  }
}
