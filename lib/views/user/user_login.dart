import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:insta_layout/controllers/usercontroller.dart';

class UserLogin extends GetView<UserController> {
  const UserLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Language",
          style: TextStyle(
              fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.w400),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24.w, 0.0, 24.w, 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Insta",
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              username(),
              SizedBox(
                height: 10.h,
              ),
              password(),
              SizedBox(
                height: 10.h,
              ),
              button()
            ],
          ),
        ),
      ),
    );
  }

  username() {
    return TextField(
      controller: controller.usernameController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade50,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        isDense: true,
        hintText: "Phone number, username, or email",
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
    );
  }

  password() {
    return ObxValue((RxBool rxBool) {
      return TextField(
        controller: controller.passwordController,
        cursorColor: Colors.grey,
        obscureText: !rxBool.value,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade50,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
            isDense: true,
            hintText: "Password",
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1)),
            suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                color: Colors.black,
                icon: Icon(
                  rxBool.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {
                  rxBool.toggle();
                })),
      );
    }, controller.visibility);
  }

  button() {
    return ElevatedButton(
        onPressed: controller.activate() ? () {} : null,
        child: const Text(
          "Log In",
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onSurface: Colors.blue,
          fixedSize: Size(MediaQuery.of(Get.context!).size.width, 45),
        )
        // ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(Colors.blue),
        //   fixedSize: MaterialStateProperty.all<Size>(
        //       Size(MediaQuery.of(context).size.width, 45)),
        // ),
        );
  }
}

// Align(
            //   alignment: Alignment.centerRight,
            //   child: TextButton(
            //     onPressed: () {},
            //     child: Text(
            //       "Forgot password?",
            //       style: TextStyle(color: Colors.blue),
            //     ),
            //     style: ButtonStyle(
            //       padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            //           EdgeInsets.zero),
            //     ),
            //   ),
            // ),