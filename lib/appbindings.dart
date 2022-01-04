import 'package:get/get.dart';
import 'package:insta_layout/activity/activitycontroller.dart';
import 'package:insta_layout/home/controller/homecontroller.dart';
import 'package:insta_layout/search/searchcontroller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => ActivityController(), fenix: true);
  }
}
