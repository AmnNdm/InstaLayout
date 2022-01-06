import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/components/appbar.dart';
import 'package:insta_layout/components/circularwidget.dart';
import 'package:insta_layout/components/constants.dart';
import 'package:insta_layout/components/customwidgets.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          MyAppBar(
            title: const Text("Message requests"),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: allPadding,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  color: Colors.grey.shade300),
              child: Text(
                Constants.requestDisclaimer,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12.sp),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            ListTile(
                leading: CircularWidget(
                  height: 50,
                  width: 53,
                  border: 1,
                  child: Icon(
                    Icons.visibility_off,
                    size: 20.h,
                    color: isDarkMode(),
                  ),
                ),
                title: Row(
                  children: [
                    Text(
                      "Hidden Requests",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    const Spacer(),
                    Text("0",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp))
                  ],
                ),
                trailing: const Icon(Icons.keyboard_arrow_right)),
            SizedBox(
              height: 80.h,
            ),
            Flexible(
                fit: FlexFit.loose,
                child: Column(children: [
                  CircularWidget(
                    height: 95,
                    width: 100,
                    border: 1.5,
                    child: Image.asset(
                      Constants.message,
                      scale: 1.1.h,
                      color: isDarkMode(),
                    ),
                    title: "No Message Requests",
                    fontsize: 18,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      "You don't have any message requests.",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  )
                ]))
          ],
        ),
      ),
    ));
  }
}
