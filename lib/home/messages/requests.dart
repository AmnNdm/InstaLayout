import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_layout/home/components.dart';
import 'package:insta_layout/others/constants.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(Text("Message requests")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: allPadding,
              height: 50.h,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  color: Colors.grey.shade200),
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
                leading: Container(
                  height: 50.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(width: 1.w, color: Colors.grey.shade300),
                  ),
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
                    Spacer(),
                    Text("0",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp))
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right)),
            SizedBox(
              height: 80.h,
            ),
            Flexible(
                fit: FlexFit.loose,
                child: Column(children: [
                  Container(
                      height: 95.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border: Border.all(width: 1.5.w, color: isDarkMode()),
                      ),
                      child: Image.asset(
                        Constants.message,
                        scale: 1.1.h,
                        color: isDarkMode(),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "No Message Requests",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
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
    );
  }
}
