import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/mainscreen.dart';
import 'package:insta_layout/views/messages/messages.dart';

import 'camera.dart';
import 'components/constants.dart';
import 'components/customnavigationbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => DefaultTabController(
                    length: 3,
                    initialIndex: 1,
                    child: Scaffold(
                      body: const CustomBottomBar(),
                    )))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 28.h,
              ),
              Image.asset(
                Constants.logo,
                scale: 4,
              ),
              const Spacer(),
              Text(
                "from",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15.sp),
              ),
              Image.asset(
                Constants.meta,
                scale: 2.5,
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
