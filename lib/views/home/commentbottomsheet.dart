import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/customwidgets.dart';
import '../../components/constants.dart';

// ignore: must_be_immutable
class CommentBottomSheet extends StatelessWidget {
  bool isButtonActive = false;
  TextEditingController tec = TextEditingController();

  CommentBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => SizedBox(
        height: 100.h,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.cake,
                    size: 30.h,
                  ),
                  Icon(
                    Icons.mood_bad_outlined,
                    size: 30.h,
                  ),
                  Icon(
                    Icons.sentiment_neutral,
                    size: 30.h,
                  ),
                  Icon(
                    Icons.sentiment_satisfied,
                    size: 30.h,
                  ),
                  Icon(
                    Icons.sentiment_very_satisfied,
                    size: 30.h,
                  ),
                  Icon(
                    Icons.sentiment_very_dissatisfied,
                    size: 30.h,
                  ),
                  Icon(
                    Icons.sick_outlined,
                    size: 30.h,
                  ),
                  Icon(
                    Icons.catching_pokemon,
                    size: 30.h,
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 0.h, 10.w, 0.h),
              child: Row(
                children: [
                  profileImage(18, Constants.user0),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      cursorColor: Colors.teal,
                      decoration: InputDecoration.collapsed(
                          hintText: "Comment as username0",
                          hintStyle: TextStyle(color: Colors.grey.shade400)),
                      controller: tec,
                      onChanged: (value) {
                        setState(() {
                          isButtonActive = value.isNotEmpty;
                        });
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: isButtonActive
                          ? () {
                              tec.clear();
                              setState(() {
                                isButtonActive = false;
                              });
                            }
                          : null,
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 14),
                          padding: EdgeInsets.zero,
                          primary: Colors.blue,
                          onSurface: Colors.blue),
                      child: const Text(
                        "Post",
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
