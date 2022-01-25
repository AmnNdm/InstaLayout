import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxBool visibility = false.obs;
  TextEditingController? usernameController, passwordController;

  activate() {
    if (usernameController != null || passwordController != null) {
      return true;
    } else {
      return false;
    }
  }
}
