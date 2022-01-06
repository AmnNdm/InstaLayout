import 'package:get/get.dart';
import 'package:insta_layout/controllers/activitycontroller.dart';
import 'package:insta_layout/controllers/homecontroller.dart';
import 'package:insta_layout/controllers/searchcontroller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => ActivityController(), fenix: true);
  }
}
